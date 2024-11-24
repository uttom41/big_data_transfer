from confluent_kafka import Producer
from data_producer import export_mysql_to_orc, send_file_path_to_kafka
from model.schems import Schema,Table,Column
from schema_producer import get_mysql_schema, send_full_schema_to_kafka


# Kafka configuration
KAFKA_SERVER = '192.168.10.250:9092'  # Replace with your Kafka broker address
TOPIC_NAME = 'data'  # Replace with your topic name

producer_conf = {
    'bootstrap.servers': KAFKA_SERVER,
    'client.id': 'python-producer',  # Optional: Identify producer
    'message.max.bytes': 5242880
}


producer = Producer(producer_conf)

if __name__ == "__main__":
    # MySQL Configuration
    mysql_config = {
        "host": "192.168.10.250",
        "user": "root",
        "password": "12345678",
        "database": "prism_db",
        "port": 3306,
    }

    schema:Schema = get_mysql_schema(mysql_config)
    # send_full_schema_to_kafka(schema=schema,producer=producer,topic="schema")

    c=0
    for table in schema.tables:
        if c==7:
            break

        print(f'************data send start {table.name}')
    #     # MySQL Query
        query = f"SELECT * FROM {table.name}"

    #     # Path to save ORC file
        orc_file_path = f"/tmp/orcdata/{table.name}.orc"

    #      # Export MySQL table to ORC
        file = export_mysql_to_orc(mysql_config, query, orc_file_path)

    #     message_key = "example-key"
        if file is not None:
            send_file_path_to_kafka(file, TOPIC_NAME,table.name,producer)
            print(f'****************data send End {table.name}')
        c+=1
    # Path to save ORC file
    # orc_file_path = f"/tmp/voucher_products.orc"
    # message_key = "example-key"
    # send_file_path_to_kafka(orc_file_path, TOPIC_NAME, "voucher_products")

   