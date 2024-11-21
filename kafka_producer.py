from confluent_kafka import Producer
from model.schems import Schema,Table,Column
from schema_producer import get_mysql_schema


# Kafka configuration
KAFKA_SERVER = '192.168.10.114:9092'  # Replace with your Kafka broker address
TOPIC_NAME = 'data'  # Replace with your topic name

producer_conf = {
    'bootstrap.servers': KAFKA_SERVER,
    'client.id': 'python-producer'  # Optional: Identify producer
}


producer = Producer(producer_conf)

if __name__ == "__main__":
    # MySQL Configuration
    mysql_config = {
        "host": "192.168.10.114",
        "user": "root",
        "password": "12345678",
        "database": "prism_db",
        "port": 3306,
    }

    schema:Schema = get_mysql_schema(mysql_config)

    for table in schema.tables:
        print(table["name"])
    #     # MySQL Query
    #     query = f"SELECT * FROM {table["name"]}"

    #     # Path to save ORC file
    #     orc_file_path = f"/tmp/{table["name"]}.orc"

    #      # Export MySQL table to ORC
    #     export_mysql_to_orc(mysql_config, query, orc_file_path)

    #     message_key = "example-key"

    #     send_file_path_to_kafka(orc_file_path, TOPIC_NAME)

    # Path to save ORC file
    # orc_file_path = f"/tmp/voucher_products.orc"
    # message_key = "example-key"
    # send_file_path_to_kafka(orc_file_path, TOPIC_NAME, "voucher_products")

   