import requests
import mysql.connector
from confluent_kafka import Consumer, KafkaError, KafkaException
from kafka import KafkaConsumer
import json
import socket
from kafka.admin import KafkaAdminClient
from pyhive import hive


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
    "auto.offset.reset": "earliest",
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

def get_all_topics(bootstrap_servers):
    print("--- Fetch all topic dynamically")
    admin_client = KafkaAdminClient(
        bootstrap_servers=bootstrap_servers,
        client_id='admin-client'
    )
    topics = admin_client.list_topics()
    admin_client.close()
    return topics

def subscribe_to_all_topics(topics):
    try:
        # Initialize KafkaConsumer
        consumer = KafkaConsumer(
            bootstrap_servers=BOOTSTRAP_SERVERS,
            auto_offset_reset='earliest',
            enable_auto_commit=True,
            group_id=GROUP_ID
        )
        
        # Filter topics that start with "dbserver1"
        debezium_topics = [topic for topic in topics if topic.startswith("dbserver1")]
        
        # Subscribe to the filtered topics
        consumer.subscribe(debezium_topics)
        
        
        # print(f"Subscribed to topics: {debezium_topics}")
        
        # Return the consumer to fetch messages later
        return consumer
    except Exception as e:
        print(f"Error subscribing to topics: {e}")
        return None

def consume_kafka_topic(consumer):
    if consumer:
        print("Consuming messages...")
        try:
            while True:
                records = consumer.poll(timeout_ms=1000)
                if not records:
                    print("No new messages, polling again...")
                    continue

                for topic_partition, messages in records.items():
                    print(f"Topic: {topic_partition.topic}, Partition: {topic_partition.partition}")

                    for msg in messages:
                        message_value = msg.value.decode('utf-8')

                        try:
                            record = json.loads(message_value)
                            if 'payload' not in record:
                                print(f"Skipping non-data message.")
                                continue
                            
                            payload = record.get('payload', {})
                            if payload:
                                after_data = payload.get('after')
                                before_data = payload.get('before')
                                operation = payload.get('op')

                                if operation == 'c':
                                    print(f"Insert detected: {after_data}")
                                    return after_data
                                elif operation == 'u':
                                    print(f"Update detected. Before: {before_data}, After: {after_data}")
                                    return before_data
                                elif operation == 'd':
                                    print(f"Delete detected. Before: {before_data}")
                                else:
                                    print(f"Unknown operation: {operation}")
                        except json.JSONDecodeError:
                            print("Failed to decode message as JSON.")
        except KeyboardInterrupt:
            print("Stopped listening to Kafka topic.")
        finally:
            consumer.close()

def consume_kafka_topic2(topic_name):
    consumer = Consumer(KAFKA_CONSUMER_CONFIG)
    consumer.subscribe([topic_name])

    print(f"Listening to Kafka topic: {topic_name}")
    try:
        while True:
            msg = consumer.poll(1.0)  # Poll every second
            if msg is None:
                continue
            if msg.error():
                if msg.error().code() == KafkaError._PARTITION_EOF:
                    print(f"End of partition reached {msg.topic()} [{msg.partition()}]")
                elif msg.error():
                    raise KafkaException(msg.error())
            else:
                key = msg.key().decode('utf-8') if msg.key() else None
                message_value = msg.value().decode('utf-8')

                print(f"Received message: Key={key} Value={message_value}")

                record = json.loads(message_value)

                before_data = record.get('before', None)
                after_data = record.get('after', None)

                if after_data is not None and before_data is None:
                    print(f"New record inserted: {after_data}")
                elif after_data is not None and before_data is not None:
                    if after_data != before_data:
                         print(f"Record updated: {after_data}")
                    else:
                        print("No actual change in the data (update with no changes).")
                elif after_data is None and before_data is not None:
                    print(f"Record deleted: {before_data}")
                else:
                    print("Unknown operation or unexpected data.")          
    except KeyboardInterrupt:
        print("Stopped listening to Kafka topic.")
    finally:
        consumer.close()

def insert_into_hive(data, conn, table="attendance"):
    if not data:
        print("No data to insert.")
        return

    # Build a dynamic INSERT query
    columns = ", ".join(data.keys())
    values = ", ".join(
        f"'{value}'" if isinstance(value, str) else str(value)
        for value in data.values()
    )
    query = f"INSERT INTO TABLE {table} VALUES ({values})"

    print(f"Executing query: {query}")

    # Execute the query
    with conn.cursor() as cursor:
        cursor.execute(query)


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
    # print("--- Checking Zookeeper ---")
    # check_zookeeper()


    # print("\n--- Checking Kafka ---")
    # check_kafka()
    

    # print("\n--- Checking Debezium Connector ---")
    # connector_name = "mysql-connector"
    # if check_debezium_connector(connector_name):
    #     print(f"Debezium connector '{connector_name}' is running.")
    # else:
    #     print(f"Debezium connector '{connector_name}' is not running.")


    # print("\n--- Testing MySQL Connection ---")
    # test_mysql_connection()

    # # topics = get_all_topics(BOOTSTRAP_SERVERS)
    # # consumer = subscribe_to_all_topics(topics=topics)

    # kafka_topic = "dbserver1.kiam_db.attendance"
    # # consume_kafka_topic(consumer)
    # data = consume_kafka_topic2(kafka_topic)
    data = {'id': 37793239, 'employee_id': 2048, 'shift_id': 1, 'branch_id': 1, 'department_id': 41, 'designation_id': 2, 'entry_date': 17532, 'in_out': '15:30 - 23:51', 'in_out_buyer_view': '15:30 - 20:51', 'odd_entry': 0, 'leave_type_id': None, 'taken_days': None, 'deduction_amount': 0.0, 'holiday_policy_id': 1, 'holiday': 0, 'present_hour': 8.35, 'present_hour_buyer_view': 5.35, 'working_hour': 0.0, 'working_hour_buyer_view': 0.0, 'absent': 0, 'short_duration': 0, 'short_presence': 1, 'late': 1, 'late_hour': 10.5, 'over_time': 0.0, 'over_time_buyer_view': 0.0, 'extra_over_time': 0.0, 'extra_over_time_buyer_view': 0.0, 'raw_over_time': 0.0, 'raw_extra_over_time': 0.0, 'comment': None, 'created': '2024-10-20T07:36:56Z', 'created_by': None, 'updated': '2024-10-20T07:41:51Z', 'updated_by': None, 'early_out_hour': 0.0, 'night_shift': 0, 'replacement_leave': None, 'movement_register_id': None, 'wfh': None, 'special_holiday': 0, 'weekends': 0, 'actual_ot': None}
    conn = create_connection("kiam_db")
    insert_into_hive(data=data,conn=conn)



   


if __name__ == "__main__":
    main()



