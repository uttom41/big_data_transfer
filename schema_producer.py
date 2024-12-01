import json
import math
import uuid
import mysql.connector

from model.schems import Column, Schema, Table

# Function to connect to MySQL and retrieve schema information
def get_mysql_schema(mysql_config):
    # Establish connection to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()

    # Create Schema object to hold all tables
    schema = Schema()

    # Retrieve all tables from the database
    cursor.execute("""
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = %s AND table_type = 'BASE TABLE'
        """, (mysql_config['database'],))
    tables = cursor.fetchall()

    for (table_name,) in tables:
        # For each table, retrieve column details
        cursor.execute(f"DESCRIBE `{table_name}`")
        columns = cursor.fetchall()

        # Create a list of Column objects for the table
        column_objects = []
        for column in columns:
            column_name = column[0]
            column_type = column[1]
            column_objects.append(Column(column_name, column_type))

        # Create Table object and add it to Schema
        if table_name == 'authorization':
            table_name = f"`{table_name}`"

        table = Table(table_name, column_objects)
        schema.add_table(table)

    cursor.close()
    conn.close()

    return schema

def send_full_schema_to_kafka(schema, producer, topic):
    # Create a dictionary to hold all tables and their columns
    schema_data = {
        "schema": []
    }

    # Add tables and columns to the schema data
    for table in schema.tables:
        table_data = {
            "table_name": table.name,
            "columns": []
        }

        for column in table.columns:
            column_data = {
                "column_name": column.name,
                "column_type": column.data_type
            }
            table_data["columns"].append(column_data)

        schema_data["schema"].append(table_data)

    # Serialize the entire schema to JSON
    serialized_data = json.dumps(schema_data)
    chunk_size=5 * 1024 * 1024
    file_size = len(serialized_data)
    print(file_size)
    num_chunks = math.ceil(file_size / chunk_size)
    schema_id = str(uuid.uuid4())

    for part_number in range(1, num_chunks + 1):
        # Extract the chunk of schema data
        start_idx = (part_number - 1) * chunk_size
        end_idx = part_number * chunk_size
        schema_chunk = serialized_data[start_idx:end_idx]
        
        # Produce the message to Kafka
        producer.produce(
            "schema",
              value=schema_chunk.encode('utf-8'),
                key=str(part_number),
                headers=[
                    ('schema_id', schema_id.encode('utf-8')),
                    ('part_number', str(part_number).encode('utf-8')),
                    ('total_parts', str(num_chunks).encode('utf-8'))
                ]
            )
        producer.flush()
        print(f"Produced chunk {part_number} of {num_chunks}")

    producer.flush()  # Ensure message is sent

    print("Full schema data sent to Kafka successfully")
