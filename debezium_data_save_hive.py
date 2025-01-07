import requests
import mysql.connector
from confluent_kafka import Consumer, KafkaError, KafkaException
from kafka import KafkaConsumer
import json
import socket
from kafka.admin import KafkaAdminClient
from pyhive import hive
import time



# Kafka Connect REST API URL
KAFKA_CONNECT_URL = "http://localhost:8083"
BOOTSTRAP_SERVERS = "localhost:9092" 
GROUP_ID = "my-group" 


# MySQL Configuration
MYSQL_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "12345678",
    "database": "kiam_db"
}


# Kafka Consumer Configuration
KAFKA_CONSUMER_CONFIG = {
    "bootstrap.servers": "localhost:9092",
    "group.id": GROUP_ID,
    "auto.offset.reset": "latest",
    'fetch.max.bytes': 10485760,
    'max.partition.fetch.bytes': 10485760,
    'enable.auto.commit':True
}


def check_zookeeper():
    host = "localhost"
    port = 2181
    try:
        with socket.create_connection((host, port), timeout=5):
            print("ZooKeeper is running.")
    except (socket.timeout, ConnectionRefusedError):
        print("ZooKeeper is not reachable.")


def check_kafka():
    try:
        response = requests.get(f"{KAFKA_CONNECT_URL}/")
        if response.status_code == 200:
            print("Kafka Connect is running.")
        else:
            print("Kafka Connect is not running. Status code:", response.status_code)
    except requests.exceptions.RequestException as e:
        print("Kafka Connect is not reachable.")
        print(str(e))


def check_debezium_connector(connector_name):
    try:
        response = requests.get(f"{KAFKA_CONNECT_URL}/connectors/{connector_name}/status")
        if response.status_code == 200:
            status = response.json()
            print(f"Connector '{connector_name}' status:", status["connector"]["state"])
            return True
        else:
            print(f"Connector '{connector_name}' not found. Status code:", response.status_code)
            return False
    except requests.exceptions.RequestException as e:
        print(f"Failed to check status for connector '{connector_name}'.")
        print(str(e))
        return False


def test_mysql_connection():
    try:
        connection = mysql.connector.connect(**MYSQL_CONFIG)
        if connection.is_connected():
            print("MySQL connection successful.")
            connection.close()
        else:
            print("Failed to connect to MySQL.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")

def consume_kafka_topic_with_dynamic_subscription(consumer, cursor):
    print("--- Starting dynamic subscription and message consumption ---")
    
    admin_client = KafkaAdminClient(
        bootstrap_servers=BOOTSTRAP_SERVERS,
        client_id='admin-client'
    )
    debezium_topics = []

    try:
        while True:
            # Step 1: Fetch topics dynamically
            current_topics = admin_client.list_topics()
            print(current_topics)
            new_topics = [topic for topic in current_topics if topic.startswith("dbserver1")]

            if set(new_topics) != set(debezium_topics):
                debezium_topics = new_topics
                consumer.subscribe(topics=debezium_topics)
                print(f"Updated subscription to topics: {debezium_topics}")

            # Step 2: Consume messages from subscribed topics
            records = consumer.poll(1000)  # Timeout in milliseconds
            for topic_partition, messages in records.items():
                for msg in messages:
                    process_message(msg, cursor)
            # Wait before checking for new topics again
            time.sleep(10)  # Adjust the interval as needed
    except KeyboardInterrupt:
       print("Stopped listening to Kafka topics.")
    finally:
        consumer.close()
        admin_client.close()

def process_message(msg,cursor):
    print("Consuming messages...")
    try:
        record = json.loads(msg.value.decode('utf-8'))
        source = record.get('source')
        if not source:
            return
        database = source.get('db', 'unknown')
        table = source.get('table', 'unknown')

        before_data = record.get('before')
        after_data = record.get('after')

        if after_data and not before_data:
            print(f"New record inserted: {after_data}")
            insert_into_hive(data=after_data, conn=cursor, table=table)
        elif after_data and before_data and after_data != before_data:
            print(f"Record updated: {after_data}")
            insert_into_hive(data=after_data, conn=cursor, table=table)
        elif before_data and not after_data:
            print(f"Record deleted: {before_data}")
            insert_into_hive(data=before_data, conn=cursor, table=table)

    except json.JSONDecodeError as e:
        print(f"JSON decode error: {e}")


def insert_into_hive(data, conn, table="attendance"):
    if not data:
        print("No data to insert.")
        return

    # Build a dynamic INSERT query
    columns = ", ".join(data.keys())
   
  
    # values = ', '.join([f"'{v}'" if v is not None else 'NULL' for v in data.values()])
    # Format values correctly based on their types
    values = ', '.join([
        f"'{v}'" if isinstance(v, str) else 'NULL' if v is None else str(v)
        for v in data.values()
    ])
    
    query = f"INSERT INTO TABLE {table} ({columns}) VALUES ({values})"

    print(f"Executing query: {query}")

    # Execute the query
    #with conn.cursor() as cursor:
    conn.execute(query)

def create_connection(database_name:str):
    try:
        print("Connecting to Hive...")
        conn = hive.Connection(
            host='182.48.72.82', 
            port=10000, 
            username='root', 
            auth='NONE'
        )
        cursor = conn.cursor()
        cursor.execute(f"USE {database_name}")
        
        print("Successfully connected to Hive")
        return conn, cursor
    except Exception as e:
        print("Error connecting to Hive:", e)
        raise

def main():
    print("--- Checking Zookeeper ---")
    check_zookeeper()


    print("\n--- Checking Kafka ---")
    check_kafka()
    

    print("\n--- Checking Debezium Connector ---")
    connector_name = "mysql-connector"
    if check_debezium_connector(connector_name):
        print(f"Debezium connector '{connector_name}' is running.")
    else:
        print(f"Debezium connector '{connector_name}' is not running.")


    print("\n--- Testing MySQL Connection ---")
    test_mysql_connection()
    conn,cursor = create_connection("kiam_db_final")

    consumer = KafkaConsumer(
            bootstrap_servers=BOOTSTRAP_SERVERS,
            auto_offset_reset='latest',
            enable_auto_commit=True,
            group_id=GROUP_ID
        )
    consume_kafka_topic_with_dynamic_subscription(consumer, cursor)

if __name__ == "__main__":
    main()

