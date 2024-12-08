import time
import os
from pyspark.sql import SparkSession
from pyspark.sql.utils import AnalysisException
import logging


# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

output_dir = 'output'
hdfs_base_path = '/user/hive/warehouse/'
database_name = 'prism.db/'

def data_upload_hive_using_spark(local_path, orc_file_path, hive_table_name):
    try:
        # Initialize SparkSession
        spark = SparkSession.builder \
            .appName("Dynamic Partition Detection") \
            .config("spark.sql.catalogImplementation", "hive") \
            .enableHiveSupport() \
            .getOrCreate()

        local_path = os.path.abspath(local_path)

        # Check if the local file exists
        if not os.path.exists(local_path):
            raise FileNotFoundError(f"The ORC file {local_path} does not exist.")

        # Read ORC file into DataFrame
        df = spark.read.format("orc").load(f"file:///{local_path}")
        logger.info(f"Data loaded successfully from {local_path}")

        # Write data to HDFS ORC file
        df.write.format("orc").mode("append").save(orc_file_path)
        logger.info(f"Data successfully saved to HDFS path {orc_file_path}")

        # Write data into Hive table
        df.write.format("hive") \
            .mode("append") \
            .option("path", orc_file_path) \
            .saveAsTable(f"prism.{hive_table_name}")
        logger.info(f"Data successfully saved into Hive table {hive_table_name}")

    except FileNotFoundError as e:
        logger.error(f"File not found: {e}")
    except AnalysisException as e:
        logger.error(f"Hive analysis error: {e}")
    except Exception as e:
        logger.error(f"Error occurred: {e}")
    finally:
        # Stop Spark session if it was created
        spark.stop()
        logger.info("Spark session stopped.")

def main():
    start_time = time.time()

    # Check if output directory exists
    if not os.path.exists(output_dir):
        logger.error(f"The output directory {output_dir} does not exist.")
        return

    for orc_folder in os.listdir(output_dir):
        folder_path = os.path.join(output_dir, orc_folder)
        if os.path.isdir(folder_path):
            for orc_file in os.listdir(folder_path):
                if orc_file.endswith('.orc'):
                    table_name = orc_folder
                    local_path = os.path.join(folder_path, orc_file)
                    hdfs_path = os.path.join(hdfs_base_path, database_name, table_name)

                    # Try creating the HDFS directory and handle errors
                    try:
                        os.system(f"hdfs dfs -mkdir -p {hdfs_path}")
                        logger.info(f"HDFS directory created at {hdfs_path}")
                    except Exception as e:
                        logger.error(f"Error creating HDFS directory {hdfs_path}: {e}")
                        continue

                    # Upload data to Hive using Spark
                    data_upload_hive_using_spark(local_path=local_path, orc_file_path=hdfs_path, hive_table_name=table_name)

    end_time = time.time()
    execution_time = end_time - start_time
    logger.info(f"Total execution time: {execution_time:.2f} seconds")

if __name__ == "__main__":
    main()
