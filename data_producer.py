from ast import Str
import os
import mysql.connector
import pandas as pd
import pyarrow as pa
import pyarrow.orc as orc
from decimal import Decimal 
import numpy as np
from pyspark.sql import SparkSession
from pyspark.sql.functions import when, col, regexp_extract
from pyspark.sql.types import StringType, BooleanType, IntegerType,DecimalType,TimestampType,DateType




output_dir = 'output/'
os.makedirs(output_dir, exist_ok=True)

def convert_unsupported_types(df):
    # Iterate through all columns to find unsupported types
    for column in df.columns:
        if pd.api.types.is_timedelta64_dtype(df[column]):  
            print(f"Converting column '{column}' with timedelta[ns] to int64 (milliseconds).")
            df[column] = df[column].dt.total_seconds() * 1000  

    return df


def export_mysql_to_orc(mysql_config, query, orc_file_path):
        
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]  # Column names
    data = cursor.fetchall()
   
    df = pd.DataFrame(data, columns=columns)
    
    if df.empty:
        print("DataFrame is empty. Returning from function.")
        return None  
    
    #df = convert_unsupported_types(df)
    
    df = df.where(pd.notnull(df), None)  # Replaces NaN/NaT with None
  
    for col in df.columns:
        if df[col].isna().all():
            print(f"DDD: NULL Column '{col}' received")
            print(df[col].dtype)
            # if pd.api.types.is_numeric_dtype(df[col]):
            #     if pd.api.types.is_integer_dtype(df[col]):
            #         df[col] = df[col].fillna(0).astype(np.int64)  
            #     else:
            #         df[col] = df[col].fillna(0.0).astype(float)
            # elif pd.api.types.is_datetime64_any_dtype(df[col]): 
            #     df[col] = pd.NaT
            # else:
            if pd.api.types.is_datetime64_any_dtype(df[col].dtype):
                print(f"DDD(is_datetime64_any_dtype): NULL Column '{col}' received")
            # Convert datetime columns to string or date
                df[col] = df[col].fillna(pd.NaT)  # Replace NaT with None for null compatibility
                # df[col] = df[col].astype(str)  # Convert to string (or use .dt.date for date)

            elif pd.api.types.is_timedelta64_dtype(df[col].dtype):
                    print(f"DDD(is_timedelta64_dtype): NULL Column '{col}' received")
                    # Convert timedelta columns to seconds or milliseconds (int)
                    df[col] = df[col].dt.total_seconds().fillna(np.nan)  # Handle nulls properly

            elif pd.api.types.is_categorical_dtype(df[col].dtype):
                    print(f"DDD(is_categorical_dtype): NULL Column '{col}' received")
                    # Convert categorical columns with NaNs to empty strings or the appropriate default value
                    df[col] = df[col].cat.add_categories([""]).fillna("")

            elif pd.api.types.is_numeric_dtype(df[col].dtype):
                    print(f"DDD(is_numeric_dtype): NULL Column '{col}' received")
                    # For numeric columns, replace NaNs with appropriate default value
                    df[col] = df[col].fillna(np.nan)  # Or any other default value like np.nan for floats

            else:
                    print(f"DDD(): NULL Column '{col}' received")
                    # For any other data types, ensure null compatibility
                    df[col] = df[col].fillna(np.nan) 
                    
        else:
            print(f"DDD: NOT NULL Column '{col}' received")
            if pd.api.types.is_numeric_dtype(df[col]): 
                if pd.api.types.is_integer_dtype(df[col]):
                    df[col] = df[col].fillna(np.nan) 
                else:
                    df[col] = df[col].fillna(0.0).astype(float)
            elif pd.api.types.is_datetime64_any_dtype(df[col]):
                print(f"Column '{col}' contains timedelta data. Converting to seconds.")
                # df[col] = pd.to_datetime(df[col], errors="coerce").dt.date
                # Convert column to datetime, handling invalid values as NaT
                df[col] = pd.to_datetime(df[col], errors="coerce")
                # Handle duration types (timedelta)
                print(df[col].dtype, "7878787787887")
                print(df[col], "ssssssssssss")
                if pd.api.types.is_timedelta64_dtype(df[col]):
                    print("Duration type data received!")
                    # Convert duration to total seconds or nanoseconds
                    # Convert timedelta to total seconds
                    df[col] = df[col].dt.total_seconds()
                    df[col] = df[col].where(pd.notnull(df[col]), None)  # Convert to seconds (or use nanoseconds)
                # Dynamically determine whether the column should be DATE or TIMESTAMP
                elif df[col].dt.time.eq(pd.Timestamp.min.time()).all():  # If all times are 00:00:00
                    # Treat as DATE (drop the time component)
                    df[col] = df[col].dt.date
                else:
                    # Treat as TIMESTAMP (format as Hive-compatible string)
                    df[col] = df[col]

                # Replace NaT with None for Hive NULL compatibility
                df[col] = df[col].where(pd.notnull(df[col]), pd.NaT)

            elif pd.api.types.is_categorical_dtype(df[col]):
                df[col] = df[col].cat.add_categories([""]).fillna("")
            elif df[col].apply(lambda x: isinstance(x, Decimal)).any():
                print(f"Converting column '{col}' from Decimal to float.")
                df[col] = df[col].apply(lambda x: float(x) if isinstance(x, Decimal) else x).fillna(0.0)
            else:
                df[col] = df[col].fillna(np.nan)  # For other types, use np.nan

    for col in df.columns:
        if pd.api.types.is_integer_dtype(df[col]):
            df[col] = df[col].astype(np.int64)
        elif pd.api.types.is_float_dtype(df[col]):
            df[col] = df[col].astype(float)
        elif pd.api.types.is_datetime64_any_dtype(df[col]):
            df[col] = pd.to_datetime(df[col], errors="coerce").fillna(pd.NaT)
        elif pd.api.types.is_string_dtype(df[col]):
            df[col] = df[col].astype(str)

    # Convert DataFrame to PyArrow Table
    table = pa.Table.from_pandas(df, preserve_index=False)


    # Write the Table to ORC file
    with open(orc_file_path, 'wb') as f:
        orc.write_table(table, f)
    
    
    print(f"Data exported to ORC file: {orc_file_path}")
    
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()
    return orc_file_path


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
    'TIME': 'STRING',  # Hive does not have a specific TIME type
    'YEAR': 'STRING',  # Hive does not have a specific YEAR type
    'JSON': 'STRING',  # Hive does not have a specific JSON type
    'BLOB': 'BINARY',
    'ENUM': 'STRING',  # Treat ENUM as STRING in Hive
    'SET': 'STRING',   # Treat SET as STRING in Hive
}

def get_hive_column_type(data_type):
    # Strip any parentheses (e.g., DECIMAL(10,0) to DECIMAL)
    if '(' in data_type:
        data_type = data_type.split('(')[0].strip()
    # Return the appropriate Hive type
    return mysql_to_hive_types.get(data_type.upper(), 'STRING')


def export_mysql_to_orc_spark(orc_file_path,table_name,database_name):
    # Initialize SparkSession
    spark = SparkSession.builder \
        .appName("spark_convert") \
        .config("spark.sql.warehouse.dir", "/user/hive/warehouse") \
        .config("spark.executor.memory", "4g") \
        .config("spark.driver.memory", "4g") \
        .enableHiveSupport() \
        .getOrCreate()
    
    mysql_url = f"jdbc:mysql://192.168.10.58:3306/{database_name}"
    mysql_properties = {
        "user": "root",
        "password": "12345678",
        "driver": "com.mysql.cj.jdbc.Driver"
    }
    mysql_table_name = table_name

    # Read the schema of the MySQL table using Spark
    describe_result = spark.sql(f"DESCRIBE FORMATTED {database_name}.{mysql_table_name}").collect()

    # Mapping column types dynamically
    column_type_mapping = {}
    for row in describe_result:
        col_name, data_type, is_nullable = row.col_name.strip(), row.data_type.strip(), row.comment
        if col_name and data_type != "NULL":
            hive_type = get_hive_column_type(data_type)
            column_type_mapping[col_name] = hive_type

    # Load the MySQL table as a DataFrame with inferred types
    df = spark.read.jdbc(url=mysql_url, table=mysql_table_name, properties=mysql_properties)

    # Apply the column type mapping to the DataFrame dynamically
    for col_name, col_type in column_type_mapping.items():
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
                df = df.withColumn(col_name, df[col_name].cast(Str()))
            # elif col_type == "BINARY":
            #     df = df.withColumn(col_name, df[col_name].cast(StringType()))

            else:
                print(f"%%%%%%%%%%%%%%%%%%%%%%%%%% ELSE() data Type is {hive_type} Col Name {col_name}, col type {col_type}" )

                df = df.withColumn(col_name, df[col_name].cast(col_type))
    # Write the data to ORC format
    df.write.format("orc").mode("append").save(orc_file_path)

    # Extract partition columns from the MySQL table schema
    partition_columns = []
    # start_partition = False
    # print(f"Table name: {mysql_table_name}")
    # for row in describe_result:
    #     col_name, data_type, _ = row.col_name.strip(), row.data_type.strip(), row.comment
    #     if col_name == "# Partition Information":
    #         start_partition = True
    #         continue
    #     if start_partition:
    #         if col_name == "# Detailed Table Information":
    #             break
    #         if col_name and not col_name.startswith("#") and data_type != "NULL":
    #             partition_columns.append(col_name)

    # Write the data to Hive, partitioned by the identified partition columns
    if partition_columns:
        df.write.format("hive") \
                .mode("append") \
                .partitionBy(*partition_columns) \
                .option("path", orc_file_path) \
                .saveAsTable(f"{database_name}.{mysql_table_name}")
    else:
        df.write.format("hive") \
                .mode("append") \
                .saveAsTable(f"{database_name}.{mysql_table_name}")

    print(f"Data successfully exported to ORC and Hive for table {mysql_table_name}.")

    
def send_file_path_to_kafka(file_path, topic,tableName,producer):

    try:
        # Read the file and divide it into chunks
        chunk_size = 5 * 1024 * 1024  # 5 MB
        file_size = os.path.getsize(file_path)
        num_chunks = (file_size + chunk_size - 1) // chunk_size
        # Check if the file exists
        with open(file_path, 'rb') as file:
            for chunk_number in range(num_chunks):
                chunk = file.read(chunk_size)
                # Prepare the message with metadata
                # message = {
                #     'file_name': os.path.basename(file_path),
                #     'chunk_number': chunk_number,
                #     'total_chunks': num_chunks,
                #     'table_name': tableName,
                #     'data': chunk
                # }
                # Send the message to Kafka
                producer.produce(topic, value=chunk, key=str(chunk_number),callback=lambda err, msg: delivery_report(err, msg, file_path), headers=[
                    ('file_name', os.path.basename(file_path)),
                    ('chunk_number', str(chunk_number)),
                    ('tableName', str(tableName)),
                    ('total_chunks', str(num_chunks))
                ])
                producer.flush()
                print(f"Sent chunk {chunk_number + 1}/{num_chunks}")

        # Ensure all messages are sent
        producer.flush()
        print(f"File path '{file_path}' sent to Kafka topic '{topic}'.")

    except FileNotFoundError:
        print(f"File not found: {file_path}")
    except Exception as e:
        print(f"Error sending file path to Kafka: {e}")

def delivery_report(err, msg, file_path):
    if err is not None:
        print(f"Message delivery failed: {err}")
    else:
        print(f"Message delivered to {msg.topic()} [{msg.partition()}]")

        # File delete if message is delivered successfully
        try:
            # os.remove(file_path)
            print(f"File {file_path} deleted successfully.")
        except OSError as e:
            print(f"Error deleting file {file_path}: {e}")


def append_to_orc(orc_file_path, new_table):
    # Check if the DataFrame (new_table) is empty
    if new_table.num_rows == 0:
        return  # Early return if the DataFrame is empty

    # Check if the ORC file exists
    if os.path.exists(orc_file_path):
        # Read the existing ORC file
        with open(orc_file_path, 'rb') as f:
            existing_table = orc.read_table(f)

        # Print schemas for debugging
        print_table_schema(existing_table, "existing_table")
        print_table_schema(new_table, "new_table")

        # Ensure the schemas match by casting the new table columns
        for column in existing_table.schema.names:
            if column in new_table.schema.names:
                existing_type = existing_table.schema.field(column).type
                new_type = new_table.schema.field(column).type

                # If the types don't match, cast the new_table column to the existing type
                if existing_type != new_type:
                    print(f"Casting column '{column}' from {new_type} to {existing_type}")

                    if existing_type == pa.date32():
                        # Convert double to date32[day]
                        new_column = new_table[column].to_pandas().apply(
                            lambda x: pa.scalar(int(x)).as_py() if not pd.isnull(x) else None
                        )
                        new_column = pa.array(new_column, type=pa.date32())
                        new_table = new_table.set_column(
                            new_table.schema.get_field_index(column),
                            column,
                            new_column
                        )
                    else:
                        # Other casts (e.g., double -> string)
                        new_table = new_table.set_column(
                            new_table.schema.get_field_index(column),
                            column,
                            new_table[column].cast(existing_type)
                        )
                combined_table = pa.concat_tables([existing_table, new_table])


    else:
        # If the file doesn't exist, use the new table as is
        combined_table = new_table

    # Write the combined data (existing + new) to the ORC file
    with open(orc_file_path, 'wb') as f:
        orc.write_table(combined_table, f)

def print_table_schema(table, table_name):
    print(f"Schema for {table_name}:")
    for field in table.schema:
        print(f"Column name: {field.name}, Type: {field.type}")


