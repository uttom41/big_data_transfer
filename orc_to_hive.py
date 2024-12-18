import time
import os
import json
from pyspark.sql import SparkSession
from pyspark.sql.utils import AnalysisException
import logging
import subprocess
from table_data_consumer import * 
from hive_connection import create_connection

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

output_dir = 'output'
hdfs_base_path = '/user/hive/warehouse'
database_name = 'kiam_db'
TRACKING_FILE = 'upload_tracking.json'


def load_tracking_data():
    if os.path.exists(TRACKING_FILE):
        with open(TRACKING_FILE, "r") as file:
            return json.load(file)
    return {}

def save_tracking_data(data):
    with open(TRACKING_FILE, "w") as file:
        json.dump(data, file, indent=4)

def data_upload_hive_using_spark(spark, local_path, orc_file_path, hive_table_name):
    try:
        tracking_data = load_tracking_data()

        if hive_table_name in tracking_data and tracking_data[hive_table_name]:
            logger.info(f"Table {hive_table_name} is already uploaded. Skipping...")
            return

        # Check if the local file exists
        if not os.path.exists(local_path):
            logger.error(f"The ORC file {local_path} does not exist.")
            return

        # Read ORC file into DataFrame
        logger.info(f"Reading ORC file from {local_path}")
        df = spark.read.format("orc").load(f"file:///{local_path}")
        logger.info(f"Data loaded successfully from {local_path}")

        # Write data to HDFS ORC file
        logger.info(f"Writing data to HDFS path {orc_file_path}")
        df.write.format("orc").mode("append").save(orc_file_path)
        logger.info(f"Data successfully saved to HDFS path {orc_file_path}")

        # Write data into Hive table
        logger.info(f"Loading data into Hive table {hive_table_name}")
        df.write.format("hive") \
            .mode("append") \
            .option("path", orc_file_path) \
            .saveAsTable(f"kiam_db.{hive_table_name}")
        logger.info(f"Data successfully saved into Hive table {hive_table_name}")

        tracking_data[hive_table_name] = True
        save_tracking_data(tracking_data)

    except AnalysisException as e:
        logger.error(f"Hive analysis error: {e}")
    except Exception as e:
        logger.error(f"Error occurred: {e}")

def main():
    start_time = time.time()

    # Initialize SparkSession once
    # spark = SparkSession.builder \
    #     .appName("Dynamic Partition Detection") \
    #     .config("spark.sql.catalogImplementation", "hive") \
    #     .enableHiveSupport() \
    #     .getOrCreate()

    # Check if output directory exists
    if not os.path.exists(output_dir):
        logger.error(f"The output directory {output_dir} does not exist.")
        return
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
                        load_data_into_hive(conn=conn, hdfs_file_path= hdfs_path, table_name=table_name)

    # for orc_folder in os.listdir(output_dir):
    #     folder_path = os.path.join(output_dir, orc_folder)
    #     if os.path.isdir(folder_path):
    #         for orc_file in os.listdir(folder_path):
    #             if orc_file.endswith('.orc'):
    #                 table_name = orc_folder
    #                 local_path = os.path.join(folder_path, orc_file)
    #                 hdfs_path = os.path.join(hdfs_base_path, database_name, table_name)

    #                 # Try creating the HDFS directory and handle errors
    #                 try:
    #                     subprocess.run(["hdfs", "dfs", "-mkdir", "-p", hdfs_path], check=True)
    #                     logger.info(f"HDFS directory created at {hdfs_path}")
    #                 except subprocess.CalledProcessError as e:
    #                     logger.error(f"Error creating HDFS directory {hdfs_path}: {e}")
    #                     continue

    #                 spark.sql()
    #                 # Upload data to Hive using Spark
    #                 data_upload_hive_using_spark(spark=spark, local_path=local_path, orc_file_path=hdfs_path, hive_table_name=table_name)

    # # Stop Spark session at the end
    # spark.stop()

    end_time = time.time()
    execution_time = end_time - start_time
    logger.info(f"Total execution time: {execution_time:.2f} seconds")

if __name__ == "__main__":
    main()
