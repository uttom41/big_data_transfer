import os
import mysql.connector
import pandas as pd
import pyarrow as pa
import pyarrow.orc as orc


def convert_unsupported_types(df):
    # Iterate through all columns to find unsupported types
    for column in df.columns:
        if pd.api.types.is_timedelta64_dtype(df[column]):  
            print(f"Converting column '{column}' with timedelta[ns] to int64 (milliseconds).")
            df[column] = df[column].dt.total_seconds() * 1000  

    return df


def export_mysql_to_orc(mysql_config, query, orc_file_path):
        
    # os.makedirs(orc_file_path, exist_ok=True)
  
    # Connect to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    
    # Execute the query and fetch data
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]  # Column names
    data = cursor.fetchall()
    
    # Convert data to Pandas DataFrame
    df = pd.DataFrame(data, columns=columns)
    
    if df.empty:
        print("DataFrame is empty. Returning from function.")
        return None  
    
    df = convert_unsupported_types(df)
    
    # Replace NaN/NaT with None explicitly for all columns
    df = df.where(pd.notnull(df), None)  # Replaces NaN/NaT with None
    
    # Ensure the DataFrame types are compatible with pyarrow
    for col in df.columns:
        if df[col].isna().all():
        #    print(f"Column '{col}' is entirely NULL. Replacing with a default value.")
           df[col] = ""
        
        elif pd.api.types.is_numeric_dtype(df[col]):
            df[col] = 0  # Replace with zero for numeric columns
        elif pd.api.types.is_datetime64_any_dtype(df[col]):
            df[col] = pd.Timestamp("1970-01-01")
    
    # For partially null columns, fill remaining nulls
        # df[col] = df[col].fillna(
        #     "" if df[col].dtype == 'object' else 0 if pd.api.types.is_numeric_dtype(df[col]) else None
        # )

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
