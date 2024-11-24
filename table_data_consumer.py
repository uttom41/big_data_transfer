import os
import subprocess
from pyhive import hive


def upload_to_hdfs(local_path, hdfs_path):
    try:
        subprocess.run(['hdfs', 'dfs', '-put', '-f', local_path, hdfs_path], check=True)
        print(f"File uploaded to HDFS: {hdfs_path}")
        try:
            # os.remove(local_path)
            print(f"File {local_path} deleted successfully.")
        except OSError as e:
            print(f"Error deleting file {local_path}: {e}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error uploading file to HDFS: {e}")
        return False

def load_data_into_hive(conn, hdfs_file_path, table_name):
    try:
        cursor = conn.cursor()

        query = f"LOAD DATA INPATH '{hdfs_file_path}' INTO TABLE {table_name}"
        cursor.execute(query)
        print(f"Data successfully loaded into Hive table: {table_name}")
    except Exception as e:
        print(f"Error loading data into Hive: {e}")
    finally:
        cursor.close()
        conn.close()

def merge_chunks(chunk_folder, merged_file_path, total_chunks):
    with open(merged_file_path, 'wb') as merged_file:
        for i in range(total_chunks):
            chunk_path = os.path.join(chunk_folder, f'chunk_{i}')
            with open(chunk_path, 'rb') as chunk_file:
                merged_file.write(chunk_file.read())
    print(f"File chunks merged into: {merged_file_path}")


def check_file_exists_in_hdfs(hdfs_file_path):
    try:
        # Run the HDFS command to check if the file exists
        subprocess.run(['hdfs', 'dfs', '-test', '-e', hdfs_file_path], check=True)
        return True  # File exists in HDFS
    except subprocess.CalledProcessError:
        return False  # File does not exist in HDFS