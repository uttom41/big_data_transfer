import os
import mysql.connector
import pandas as pd
import pyarrow as pa
import pyarrow.orc as orc



def export_mysql_to_orc(mysql_config, query, orc_file_path):
  
    # Connect to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    
    # Execute the query and fetch data
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]  # Column names
    data = cursor.fetchall()
    
    # Convert data to Pandas DataFrame
    df = pd.DataFrame(data, columns=columns)
    
    # Replace NaN/NaT with None explicitly for all columns
    df = df.where(pd.notnull(df), None)  # Replaces NaN/NaT with None
    
    # Ensure the DataFrame types are compatible with pyarrow
    for col in df.columns:
        if df[col].dtype == 'object':  # For object types (strings), convert to category if needed
            df[col] = df[col].astype(str)
        elif df[col].dtype == 'datetime64[ns]':  # Handle datetime columns
            df[col] = pd.to_datetime(df[col], errors='coerce')
    
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
                message = {
                    'file_name': os.path.basename(file_path),
                    'chunk_number': chunk_number,
                    'total_chunks': num_chunks,
                    'table_name': tableName,
                    'data': chunk
                }
                # Send the message to Kafka
                producer.produce(topic, value=chunk, key=str(chunk_number), headers=[
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

def delivery_report(err, msg):
    """Delivery report callback."""
    if err is not None:
        print(f"Message delivery failed: {err}")
    else:
        print(f"Message delivered to {msg.topic()} [{msg.partition()}]")
