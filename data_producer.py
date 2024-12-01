import os
import mysql.connector
import pandas as pd
import pyarrow as pa
import pyarrow.orc as orc
from decimal import Decimal 
import numpy as np



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
        
    # os.makedirs(orc_file_path, exist_ok=True)
  
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]  # Column names
    data = cursor.fetchall()
   
    df = pd.DataFrame(data, columns=columns)
    
    if df.empty:
        print("DataFrame is empty. Returning from function.")
        return None  
    
    df = convert_unsupported_types(df)
    
    df = df.where(pd.notnull(df), None)  # Replaces NaN/NaT with None
    
    # for col in df.columns:
    #     if df[col].isna().all():
    #         if pd.api.types.is_numeric_dtype(df[col]):
    #             df[col] = 0
    #         elif pd.api.types.is_datetime64_any_dtype(df[col]):
    #             df[col] = pd.Timestamp("1870-01-01") 
    #         else:
    #             df[col] = ""
    #     else:
    #         if pd.api.types.is_numeric_dtype(df[col]):
    #             df[col] = df[col].fillna(0).astype(float) 
    #         elif pd.api.types.is_datetime64_any_dtype(df[col]):
    #             df[col] = pd.to_datetime(df[col], errors='coerce').fillna(pd.Timestamp("1870-01-01"))
    #         elif pd.api.types.is_categorical_dtype(df[col]):
    #             df[col] = df[col].cat.add_categories([""]).fillna("")
    #         elif df[col].apply(lambda x: isinstance(x, Decimal)).any(): 
    #             print(f"Converting column '{col}' from Decimal to float.")
    #             # Replace NaN with 0 before converting to float
    #             df[col] = df[col].fillna(0).apply(lambda x: float(x) if isinstance(x, Decimal) else x)
    #         else:
    #             df[col] = df[col].fillna("")

    for col in df.columns:
        if df[col].isna().all():
            if pd.api.types.is_numeric_dtype(df[col]):
                if pd.api.types.is_integer_dtype(df[col]):
                    df[col] = df[col].fillna(0).astype(np.int64)  # Ensure integer columns remain int
                else:
                    df[col] = df[col].fillna(0.0).astype(float)
            elif pd.api.types.is_datetime64_any_dtype(df[col]): 
                df[col] = pd.NaT 
                # df[col] = df[col].astype('datetime64[ns]')
            else:
                df[col] = np.nan
                 
        else:
            if pd.api.types.is_numeric_dtype(df[col]): 
                if pd.api.types.is_integer_dtype(df[col]):
                    df[col] = df[col].fillna(0).astype(np.int64) 
                else:
                    df[col] = df[col].fillna(0.0).astype(float)
            elif pd.api.types.is_datetime64_any_dtype(df[col]):
                df[col] = pd.to_datetime(
                    df[col], errors="coerce"
                ).fillna(pd.NaT)
            elif pd.api.types.is_categorical_dtype(df[col]):
                df[col] = df[col].cat.add_categories([""]).fillna("")
            elif df[col].apply(lambda x: isinstance(x, Decimal)).any():
                print(f"Converting column '{col}' from Decimal to float.")
                df[col] = df[col].apply(lambda x: float(x) if isinstance(x, Decimal) else x).fillna(0.0)
            else:
                df[col] = df[col].fillna(np.nan)

    # Final type conversion to ensure all columns are compatible with Hive
    for col in df.columns:
        if pd.api.types.is_integer_dtype(df[col]):
            df[col] = df[col].astype(np.int64)  # Ensure integer columns are int64
        elif pd.api.types.is_float_dtype(df[col]):
            df[col] = df[col].astype(float)  # Ensure float columns are proper float type
        elif pd.api.types.is_datetime64_any_dtype(df[col]):
            df[col] = pd.to_datetime(df[col], errors="coerce").fillna(pd.NaT)
        elif pd.api.types.is_string_dtype(df[col]):
            df[col] = df[col].astype(str)
           

    # Convert DataFrame to PyArrow Table
    table = pa.Table.from_pandas(df, preserve_index=False)
    append_to_orc(orc_file_path, table)


    # # Write the Table to ORC file
    # with open(orc_file_path, 'wb') as f:
    #     orc.write_table(table, f)
    
    
    print(f"Data exported to ORC file: {orc_file_path}")
    
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()
    return orc_file_path



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

        # Ensure the schemas match by casting the new table columns
        for column in existing_table.schema.names:
            if column in new_table.schema.names:
                existing_type = existing_table.schema.field(column).type
                new_type = new_table.schema.field(column).type

                # If the types don't match, cast the new_table column to the existing type
                if existing_type != new_type:
                    print(f"Casting column '{column}' from {new_type} to {existing_type}")

                    if existing_type == pa.date32():  # Ensure correct type for date32
                        if new_type == pa.float64:  # If new_type is double (float64)
                            new_table = new_table.set_column(
                                new_table.schema.get_field_index(column),
                                column,
                                new_table[column].cast(pa.timestamp('ms')).cast(pa.date32())
                            )
                    else:
                        new_table = new_table.set_column(
                            new_table.schema.get_field_index(column),
                            column,
                            new_table[column].cast(existing_type)
                        )

        # Concatenate the existing data with the new table
        combined_table = pa.concat_tables([existing_table, new_table])

    else:
        # If the file doesn't exist, use the new table as is
        combined_table = new_table

    # Write the combined data (existing + new) to the ORC file
    with open(orc_file_path, 'wb') as f:
        orc.write_table(combined_table, f)