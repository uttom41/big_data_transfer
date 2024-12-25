import logging
from pyhive import hive
import os
from hdfs import InsecureClient

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("hive_hdfs_upload.log"),
        logging.StreamHandler()
    ]
)

def create_connection(database_name: str):
    """Create a connection to the Hive database."""
    try:
        logging.info("Connecting to Hive...")
        conn = hive.Connection(
            host='182.48.72.82', 
            port=10000, 
            username='root', 
            auth='NONE'
        )
        cursor = conn.cursor()
        cursor.execute(f"USE {database_name}")
        logging.info("Successfully connected to Hive and selected database: %s", database_name)
        return conn, cursor
    except Exception as e:
        logging.error("Error connecting to Hive: %s", e, exc_info=True)
        raise

def upload_to_hdfs(local_path: str, hdfs_path: str):
    """Upload a local file to HDFS."""
    try:
        logging.info("Uploading %s to HDFS at %s", local_path, hdfs_path)
        hdfs_file_path = os.path.join(hdfs_path, os.path.basename(local_path))
        with open(local_path, "rb") as local_file:
            hdfs_client.write(hdfs_file_path, local_file, append=False)
        logging.info("File successfully uploaded to %s", hdfs_path)
        return True
    except Exception as e:
        logging.error("Error uploading file to HDFS: %s", e, exc_info=True)
        return False

def load_data_into_hive(conn, hdfs_file_path: str, table_name: str):
    """Load data from HDFS into a Hive table."""
    try:
        logging.info("Loading data from %s into Hive table: %s", hdfs_file_path, table_name)
        cursor = conn.cursor()
        query = f"LOAD DATA INPATH '{hdfs_file_path}' INTO TABLE {table_name}"
        cursor.execute(query)
        logging.info("Data successfully loaded into Hive table: %s", table_name)
    except Exception as e:
        logging.error("Error loading data into Hive table %s: %s", table_name, e, exc_info=True)
    finally:
        if cursor:
            cursor.close()

def main():
    """Main function to manage the workflow."""
    try:
        # Initialize variables
        output_dir = 'output'
        database_name = 'kiam_db'
        hdfs_base_path = '/user/hive/warehouse'
        hdfs_url = "http://182.48.72.82:9870" 
        global hdfs_client
        hdfs_client = InsecureClient(hdfs_url, user='hdfs')

        logging.info("Starting the Hive and HDFS data upload process")
        conn, cursor = create_connection(database_name)

        for orc_folder in os.listdir(output_dir):
            folder_path = os.path.join(output_dir, orc_folder)
            if os.path.isdir(folder_path):
                for orc_file in os.listdir(folder_path):
                    if orc_file.endswith('.orc'):
                        table_name = orc_folder
                        local_path = os.path.join(folder_path, orc_file)
                        hdfs_path = os.path.join(hdfs_base_path, database_name, table_name)

                        if upload_to_hdfs(local_path, hdfs_path):
                            load_data_into_hive(conn=conn, hdfs_file_path=hdfs_path, table_name=table_name)

        logging.info("Process completed successfully.")
    except Exception as e:
        logging.critical("Critical error in the main process: %s", e, exc_info=True)
    finally:
        if 'conn' in locals() and conn:
            conn.close()
            logging.info("Hive connection closed.")

if __name__ == "__main__":
    main()
