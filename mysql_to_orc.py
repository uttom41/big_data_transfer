import mysql.connector
import os
import json
import time
import logging
from pyspark.sql import SparkSession
from mysql.connector.errors import ProgrammingError
from pyspark.sql.functions import when, col
from pyspark.sql.types import ShortType, IntegerType, DecimalType, TimestampType


# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


mysql_to_hive_trino_types = {
    'TINYINT': 'SMALLINT',
    'SMALLINT': 'SMALLINT',
    'MEDIUMINT': 'INT',
    'INT': 'INT',
    'INTEGER': 'INT',
    'BIGINT': 'BIGINT',
    'DECIMAL': 'DECIMAL',
    'NUMERIC': 'DECIMAL',
    'FLOAT': 'FLOAT',
    'DOUBLE': 'DOUBLE',
    'BIT': 'BOOLEAN',
    'CHAR': 'STRING',
    'VARCHAR': 'STRING',
    'TEXT': 'STRING',
    'DATE': 'DATE',
    'DATETIME': 'TIMESTAMP',
    'TIMESTAMP': 'TIMESTAMP',
    'TIME': 'STRING',
    'YEAR': 'STRING',
    'JSON': 'STRING',
    'BLOB': 'BINARY',
    'ENUM': 'STRING',
    'SET': 'STRING',
}

def get_hive_column_type(data_type):
    if '(' in data_type: data_type = data_type.split('(')[0].strip()
    return mysql_to_hive_trino_types.get(data_type.upper(), 'STRING')

def export_mysql_to_orc_spark(orc_file_path, table_name, database_name, min_id,max_id,num_partitions):

    os.makedirs(orc_file_path, exist_ok=True)
    
    spark = SparkSession.builder \
        .appName("Save ORC Locally") \
        .master("local[*]") \
        .config("spark.executor.memory", "16g") \
        .config("spark.driver.memory", "16g") \
        .config("spark.jars", "/root/Downloads/mysql-connector-j-8.1.0/mysql-connector-j-8.1.0.jar") \
        .getOrCreate()

#  .config("spark.sql.shuffle.partitions", "200") \
#         .config("spark.default.parallelism", "200") \

    mysql_url = f"jdbc:mysql://182.48.72.82:3306/{database_name}?zeroDateTimeBehavior=convertToNull"
    mysql_properties = {
        "user": "root",
        "password": "12345678",
        "driver": "com.mysql.cj.jdbc.Driver"
    }
 
    df = spark.read.jdbc(
        url=mysql_url,
        table=table_name,
        properties=mysql_properties,
        column="id",
        lowerBound=min_id,
        upperBound=max_id,
        numPartitions=num_partitions
    )

    column_type_mapping = {field.name: field.dataType.simpleString() for field in df.schema.fields}

    for col_name, col_type in column_type_mapping.items():
        hive_type = get_hive_column_type(col_type)
        if col_name in df.columns:
            if col_type == 'DECIMAL':
                df = df.withColumn(col_name, df[col_name].cast(DecimalType()))
            elif col_type == 'TIMESTAMP':
                # Replace invalid dates ('0000-00-00') with None
                df = df.withColumn(
                    col_name,
                    when(col(col_name).rlike(r"^0000-\d{2}-\d{2}$"), None)
                    .otherwise(col(col_name).cast(TimestampType()))
                )
            elif col_type in ['INT', 'BIGINT']:
                df = df.withColumn(
                    col_name,
                    when(col(col_name).rlike("^[0-9]+$"), col(col_name).cast(IntegerType())).otherwise(None)
                )
            elif col_type == "YEAR":
                df = df.withColumn(col_name, df[col_name].cast(ShortType()))
            else:
                df = df.withColumn(col_name, df[col_name].cast(hive_type))

    output_path = os.path.join(orc_file_path, f"{num_partitions}_full.orc")
    df.write.format("orc").mode("overwrite").save(output_path)

    metadata_file = './model/execution_time.json'
    metadata = {}

    if os.path.exists(metadata_file):
        with open(metadata_file, 'r') as f:
            metadata = json.load(f)

    metadata[table_name] = True

    with open(metadata_file, 'w') as f:
        json.dump(metadata, f, indent=4)
    print(f"Data successfully exported to ORC for table {table_name}.")

def main():
    start_time = time.time()
    database_name = "kiam_db"
    mysql_config = {
        "host": "182.48.72.82",
        "user": "root",
        "password": "12345678",
        "database": database_name,
        "port": 3306,
    }

    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()

    cursor.execute("""
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = %s AND table_type = 'BASE TABLE'
        """, (mysql_config['database'],))
    tables = cursor.fetchall()

    metadata_file = './model/execution_time.json'
    #metadata_file = './table_status'
    metadata = {}

    if os.path.exists(metadata_file):
        with open(metadata_file, 'r') as f:
            metadata = json.load(f)

    skip_tables = {'django_celery_beat_periodictasks', 'django_session', 'groups','djcelery_periodictasks','attendance_status','currencies','lc_purchase_orders','rsa_active_keys','user_otp_session'}


    skip_tables.update(metadata)

    for table_name in tables:
        table_name = table_name[0]
        if table_name in skip_tables:
            continue
       
        query = f"(SELECT MIN(id) as min_id, MAX(id) as max_id FROM {table_name})"
        try:
            cursor.execute(query)
            min_max_data = cursor.fetchone()
        except ProgrammingError:
            logger.info(f"Skipping table: {table_name}, Reason: 'id' column not found.")
            continue 

        if not min_max_data or min_max_data[0] is None or min_max_data[1] is None:
            logger.info(f"Skipping table: {table_name}, No valid data in 'id' column.")
            continue 

        min_id = min_max_data[0]
        max_id = min_max_data[1]
        total_rows = max_id - min_id + 1
        num_partitions= 1
        if  max_id > 5000000:
           num_partitions = max(1, total_rows // 5000000)
       
        logger.info(f"Processing table: {table_name}")
        # orc_file_path=f"file:///root/Documents/hdfs/output/{table_name}",
        export_mysql_to_orc_spark(
            orc_file_path=f"./output/{table_name}",
            table_name=table_name,
            database_name=database_name,
            min_id=min_id,
            max_id=max_id,
            num_partitions=num_partitions
        )

    end_time = time.time()
    execution_time = end_time - start_time
    logger.info(f"Total execution time: {execution_time:.2f} seconds")
if __name__ == "__main__":
    main()
