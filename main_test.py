import os
from confluent_kafka import Consumer, KafkaException, KafkaError
from hive_connection import create_connection
from schema_collector import SchemaCollector
from schema_consumer import create_single_partitioned_hive_table
from table_data_consumer import * 

# Kafka Configuration
KAFKA_SERVER = 'localhost:9092'
TOPIC_NAME = 'data'
CHUNK_FOLDER = '/tmp/orcdata/'  # Temporary folder for storing file chunks
MERGED_FILE_PATH = ''  # Path for the merged ORC file
HDFS_PATH = ''
HIVE_TABLE_NAME = ''


def main():
    received_chunks = 0
    # Connect to Hive (not used in this simplified version)
    conn, cursor = create_connection("kiam_db")

    # Configure Kafka consumer
    consumer_config = {
        'bootstrap.servers': '192.168.10.250:9092',  # Kafka broker address
        'group.id': 'group-id',                 # Consumer group ID
        'auto.offset.reset': 'earliest',          # Start reading from the earliest message
        'fetch.message.max.bytes': 5242880
    }

    # Create a Kafka consumer instance
    consumer = Consumer(consumer_config)
    consumer.subscribe(['schema','data'])

    # Initialize schema collector
    schema_collector = SchemaCollector()

    try:
        while True:
            # Read message from Kafka
            msg = consumer.poll(timeout=1.0)  # 1-second timeout

            if msg is None:
                continue  # No message available within the timeout
            elif msg.error():
                if msg.error().code() == KafkaError._PARTITION_EOF:
                    print(f"End of partition reached: {msg.topic()} [{msg.partition()}] at offset {msg.offset()}")
                else:
                    raise KafkaException(msg.error())
            elif msg.topic() == 'schema':
                print("***From schema topic")
                # Extract headers as a list of tuples (key, value)
                headers = msg.headers()
                # Find the 'schema_id', 'part_number', and 'total_parts' from headers
                schema_id = None
                part_number = None
                total_parts = None
                for header in headers:
                    if header[0] == 'schema_id':
                        schema_id = header[1].decode('utf-8')  # Decode the schema_id
                    elif header[0] == 'part_number':
                        part_number = int(header[1].decode('utf-8'))  # Decode and convert part_number
                    elif header[0] == 'total_parts':
                        total_parts = int(header[1].decode('utf-8'))  # Decode and convert total_parts
                if schema_id is None or part_number is None or total_parts is None:
                    print("Missing header fields, skipping message")
                    continue
                # Get the schema data from the message
                schema_data = msg.value()
                # Add the part to the collector and check if it's a complete schema
                full_schema_json = schema_collector.add_part(schema_id, part_number, total_parts, schema_data)
                if full_schema_json:
                    create_single_partitioned_hive_table(conn,full_schema_json)
                    print("Full schema received and decoded successfully.")

            elif msg.topic() == 'data':
                print("***From data topic")
                while True:
                    # Extract metadata from headers
                    headers = {key: value.decode('utf-8') for key, value in msg.headers()}
                    print(f"****** Headers:\n{headers}")
                    chunk_number = int(headers.get('chunk_number', 0))
                    total_chunks = int(headers.get('total_chunks', 1))
                    table_name = headers.get('tableName',"")
                    MERGED_FILE_PATH = '/tmp/' + table_name + ".orc"
                    HDFS_PATH = '/user/hive/warehouse/' + table_name + ".orc"
                    HIVE_TABLE_NAME = table_name
                    os.makedirs(CHUNK_FOLDER, exist_ok=True)
                    chunk_path = os.path.join(CHUNK_FOLDER, f'chunk_{chunk_number}')
                    with open(chunk_path, 'wb') as f:
                        f.write(msg.value())

                    received_chunks += 1
                    print(f"Received chunk {chunk_number + 1}/{total_chunks}")

                    if received_chunks == total_chunks:
                        print("All chunks received. Merging...")
                        merge_chunks(CHUNK_FOLDER, MERGED_FILE_PATH, total_chunks)
    
                        # Upload merged file to HDFS
                        if not check_file_exists_in_hdfs(HDFS_PATH):
                            upload_to_hdfs(MERGED_FILE_PATH, HDFS_PATH)

                        load_data_into_hive(conn=conn, hdfs_file_path= HDFS_PATH, table_name=HIVE_TABLE_NAME)
                        received_chunks = 0
                        break

    except KeyboardInterrupt:
        print("Interrupted by user")
    finally:
        # Close the consumer connection
        consumer.close()
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()
