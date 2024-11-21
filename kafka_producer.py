import os
import mysql.connector
import pandas as pd
import pyarrow as pa
import pyarrow.orc as orc
from confluent_kafka import Producer
from model.schems import Schema,Table,Column


# Kafka configuration
KAFKA_SERVER = '192.168.10.114:9092'  # Replace with your Kafka broker address
TOPIC_NAME = 'data'  # Replace with your topic name


# Function to connect to MySQL and retrieve schema information
def get_mysql_schema(mysql_config):
    # Establish connection to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()

    # Create Schema object to hold all tables
    schema = Schema()

    # Retrieve all tables from the database
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()

    for (table_name,) in tables:
        # For each table, retrieve column details
        cursor.execute(f"DESCRIBE {table_name}")
        columns = cursor.fetchall()

        # Create a list of Column objects for the table
        column_objects = []
        for column in columns:
            column_name = column[0]
            column_type = column[1]
            column_objects.append(Column(column_name, column_type))

        # Create Table object and add it to Schema
        table = Table(table_name, column_objects)
        schema.add_table(table)

    cursor.close()
    conn.close()

    return schema


# Producer configuration
producer_conf = {
    'bootstrap.servers': KAFKA_SERVER,
    'client.id': 'python-producer'  # Optional: Identify producer
}

producer = Producer(producer_conf)

def export_mysql_to_orc(mysql_config, query, orc_file_path):
    """
    Exports MySQL query results to an ORC file and saves it in the specified path.
    
    Args:
        mysql_config (dict): MySQL connection configuration.
        query (str): Query to fetch data from MySQL.
        orc_file_path (str): Path to save the ORC file.
    """
    # Connect to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()
    
    # Execute the query and fetch data
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]  # Column names
    data = cursor.fetchall()
    
    # Convert data to Pandas DataFrame
    df = pd.DataFrame(data, columns=columns)
    
    # Handle nulls explicitly: Pandas automatically uses NaN for numeric columns.
    # PyArrow will translate these NaNs and None into proper Arrow nulls.
    
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

def delivery_report(err, msg):
    """Delivery report callback."""
    if err is not None:
        print(f"Message delivery failed: {err}")
    else:
        print(f"Message delivered to {msg.topic()} [{msg.partition()}]")


def send_file_path_to_kafka(file_path, topic,tableName):
    """Send file path as a message to Kafka."""
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

if __name__ == "__main__":
    # MySQL Configuration
    mysql_config = {
        "host": "192.168.10.114",
        "user": "root",
        "password": "12345678",
        "database": "prism_db",
        "port": 3306,
    }

    # schema:Schema = get_mysql_schema(mysql_config)

    # for table in schema.tables:
    #     # MySQL Query
    #     query = f"SELECT * FROM {table["name"]}"

    #     # Path to save ORC file
    #     orc_file_path = f"/tmp/{table["name"]}.orc"

    #      # Export MySQL table to ORC
    #     export_mysql_to_orc(mysql_config, query, orc_file_path)

    #     message_key = "example-key"

    #     send_file_path_to_kafka(orc_file_path, TOPIC_NAME)

    # Path to save ORC file
    orc_file_path = f"/tmp/voucher_products.orc"
    message_key = "example-key"
    send_file_path_to_kafka(orc_file_path, TOPIC_NAME, "voucher_products")

   