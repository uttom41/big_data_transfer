
import mysql.connector
import os
import json
import os
from pyspark.sql import SparkSession
from pyspark.sql.functions import when, col

from pyspark.sql.types import (ShortType, IntegerType, DecimalType, TimestampType
)

mysql_to_hive_types = {
    'TINYINT': 'TINYINT',
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
    return mysql_to_hive_types.get(data_type.upper(), 'STRING')


def export_mysql_to_orc_spark(orc_file_path,table_name,database_name):
    os.makedirs(orc_file_path, exist_ok=True)

    spark = SparkSession.builder \
    .appName("Save ORC Locally") \
    .master("local[*]") \
    .config("spark.executor.memory", "4g") \
    .config("spark.driver.memory", "4g") \
    .config("spark.hadoop.fs.defaultFS", "file:///") \
    .getOrCreate()
    
    mysql_url = f"jdbc:mysql://182.48.72.82:3306/{database_name}"
    mysql_properties = {
        "user": "root",
        "password": "12345678",
        "driver": "com.mysql.cj.jdbc.Driver"
    }
     
    df = spark.read.jdbc(url=mysql_url, table=table_name, properties=mysql_properties)
    column_type_mapping = {field.name: field.dataType.simpleString() for field in df.schema.fields}

    for col_name, col_type in column_type_mapping.items():
        hive_type = get_hive_column_type(col_type)
        if col_name in df.columns:
            if col_type == 'DECIMAL':
                df = df.withColumn(col_name, df[col_name].cast(DecimalType()))
            elif col_type == 'TIMESTAMP':
                df = df.withColumn(col_name, df[col_name].cast(TimestampType()))
            elif col_type == 'INT' or col_type == 'BIGINT':
                df = df.withColumn(
                    col_name,
                    when(col(col_name).rlike("^[0-9]+$"), col(col_name).cast(IntegerType())).otherwise(None)
                )
            elif col_type == "YEAR":
                df = df.withColumn(col_name, df[col_name].cast(ShortType()))
            else:
                print(f"%%%%%%%%%%%%%%%%%%%%%%%%%% ELSE() data Type is {hive_type} Col Name {col_name}, col type {col_type}" )

                df = df.withColumn(col_name, df[col_name].cast(col_type))

    df.write.format("orc").mode("append").save(orc_file_path)

    
    metadata_file = './model/execitopm_time'
    
    metadata = {}

       
    if os.path.exists(metadata_file):
        with open(metadata_file, 'r') as f:
            metadata = json.load(f)

       
    metadata[table_name] = True

    with open(metadata_file, 'w') as f:
        json.dump(metadata, f, indent=4)
    print(f"Data successfully exported to ORC and Hive for table {table_name}.")



def main():
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
    metadata = {}

    metadata_file = './model/execitopm_time'   
    if os.path.exists(metadata_file):
        with open(metadata_file, 'r') as f:
            metadata = json.load(f)

    skip_tables = {'attendance_status', 'currencies', 'django_celery_beat_periodictasks','django_session','ledgers',
                'inventory_journals', 'products', 'vouchers', 'items', 'inventories', 'parties', 'activity_logs','custom_vouchers',
                'employment_types', 'features', 'groups', 'histories', 'im_colors', 'im_connectivity_type','im_device_type',
                'im_fiber_core','im_network_type','leave_balance','lms_books','prod_events','prod_si_ancestors','prod_unit_ancestors',
                'raw_pos_sale_orders','report_download_logs','report_print_count_logs','schedule_attendance','service_package_products',
                'service_updown_requests','stationery_ledgers','voucher_outlines', 'asset_management_ledgers', 'attendance_device_data',
                'cheques'
                }

    skip_tables.update(metadata)
   

    for table_name in tables:
        table_name =table_name[0]
        if table_name == 'authorization':
            table_name = f"`{table_name}`"
        if table_name in skip_tables:
            continue
    
        print(f"Table name: {table_name}")

        export_mysql_to_orc_spark(orc_file_path=f"file:///home/uttom41/Downloads/python_example/output/{table_name}",table_name=table_name,database_name=database_name)



if __name__ == "__main__":
    main()