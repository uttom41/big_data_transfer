import json
import time
import os
import pyorc
from hive_connection import create_connection
from hdfs import InsecureClient

hive_sql_file = 'hive_tables.sql'
output_dir = 'output'
hdfs_base_path = '/user/hive/warehouse/'  # HDFS path for Hive tables
database_name = 'kaim_db/'

def table_create(conn):
    print("Creating tables...")

    with open(hive_sql_file, 'r') as sql_file:
        sql_script = sql_file.read().strip()
        if sql_script.endswith(";"):
            sql_script = sql_script[:-1]
        cursor = conn.cursor()
        try:
            sql_statements = sql_script.split(';')  # Split by semicolon to get individual statements
            for statement in sql_statements:
                statement = statement.strip()
                if statement:  # Execute only non-empty statements
                    cursor.execute(statement)
                    print(f"Executed: {statement}")
                    print("Tables created successfully.")
        except Exception as e:
            print(f"Error occurred: {str(e)}")
        finally:
            # Close the cursor after execution
            if cursor:
                cursor.close()

    print(f"Tables created in database prism.")

# Function to upload CSV to HDFS
def upload_to_hdfs_with_metadata(hdfs_client, local_path, hdfs_path, table_name, metadata_file):
    print("upload hdfs method")
    try:
        # HDFS-এ ডিরেক্টরি তৈরি করুন (যদি না থাকে)
        if not hdfs_client.status(hdfs_path, strict=False):  # strict=False will not throw an error if the path does not exist
            hdfs_client.makedirs(hdfs_path)
        else:
            print(f"Directory {hdfs_path} already exists in HDFS.")
            return True

        # ফাইল HDFS-এ আপলোড করুন
        d = hdfs_client.upload(hdfs_path, local_path)

        if d:
            print(f"File successfully uploaded to HDFS path: {hdfs_path}")
        else:
            print(f"File upload failed for path: {hdfs_path}")
            return False


        # মেটাডেটা JSON ফাইল আপডেট করুন
        # metadata = {}

        # # পূর্ববর্তী মেটাডেটা পড়ুন (যদি ফাইল থাকে)
        # if os.path.exists(metadata_file):
        #     with open(metadata_file, 'r') as f:
        #         metadata = json.load(f)

        # # নতুন এন্ট্রি যোগ করুন
        # metadata[table_name] = hdfs_path

        # # JSON ফাইলটি আপডেট করুন
        # with open(metadata_file, 'w') as f:
        #     json.dump(metadata, f, indent=4)

        # print(f"Metadata updated successfully in {metadata_file}.")
        return True
    except Exception as e:
        print(f"Error during upload: {e}")
        return False

def delete_table_metadata(metadata_file, table_name):
    try:
        # চেক করুন যে JSON ফাইলটি আছে কিনা
        if not os.path.exists(metadata_file):
            print(f"Metadata file '{metadata_file}' does not exist.")
            return False

        # JSON ফাইলটি পড়ুন
        with open(metadata_file, 'r') as f:
            metadata = json.load(f)

        # চেক করুন যে table_name আছে কিনা
        if table_name in metadata:
            # table_name মুছে ফেলুন
            del metadata[table_name]
            print(f"Deleted metadata for table '{table_name}'.")
        else:
            print(f"Table '{table_name}' not found in metadata.")
            return False

        # JSON ফাইলটি আপডেট করুন
        with open(metadata_file, 'w') as f:
            json.dump(metadata, f, indent=4)

        print("Metadata file updated successfully.")
        return True
    except Exception as e:
        print(f"Error while deleting table metadata: {e}")
        return False

def validate_orc_file(file_path):
    try:
        with open(file_path, "rb") as f:
            reader = pyorc.Reader(f)
            for record in reader:
                print(record)
        print("ORC file is valid.")
    except Exception as e:
        print(f"Error reading ORC file: {e}")

def main():
    start_time = time.time()
    conn, cursor = create_connection("kiam_db")

    # table_create(conn)
   
    hdfs_client = InsecureClient('http://localhost:9870', user='uttom41')  # adjust as needed

    try:
        files = hdfs_client.list('/')
        print("HDFS connection successful. Files and directories in root:")
        print(files)
    except Exception as e:
        print("HDFS connection failed.")
        print("Error:", e)

    metastore_file = './model/execitopm_time'

    
    # validate_orc_file('output/all_payscale_data.orc') 

    for csv_file in os.listdir(output_dir):
        if csv_file.endswith('.orc'):
            table_name = os.path.splitext(csv_file)[0]
            table_name1= table_name
            # table_name = f"`{table_name}`"
            local_path = os.path.join(output_dir, csv_file)
            hdfs_path = os.path.join(hdfs_base_path, database_name, table_name,"/2")
            # Function call
            success = upload_to_hdfs_with_metadata(hdfs_client, local_path, hdfs_path, table_name, metastore_file)

            if success:
                try:
                    # load_data_command = f"""
                    # LOAD DATA INPATH '{hdfs_path}/{csv_file}' OVERWRITE INTO TABLE {table_name1}
                    # FIELDS TERMINATED BY ',' 
                    # LINES TERMINATED BY '\\n'
                    # """
                    load_data_command = f"""
                        LOAD DATA INPATH '{hdfs_path}/{csv_file}' INTO TABLE {table_name}
                        """
                    cursor.execute(load_data_command)
                    print(f"Loaded data into table {table_name1}")

                    # # Optionally set properties like compression
                    # alter_table_command = f"ALTER TABLE {table_name} SET TBLPROPERTIES ('orc.compress'='SNAPPY');"
                    # cursor.execute(alter_table_command)
                    # print(f"Set ORC compression for table {table_name}")
                     # লোকাল ফাইল মুছুন (যদি আপলোড সফল হয়)
                    # if os.path.exists(local_path):
                    #     os.remove(local_path)
                    #     print(f"File {local_path} deleted successfully.")
                    # delete_table_metadata(metadata_file=metastore_file,table_name=table_name)
                    
                except Exception as e:
                    print(f"Error loading data for table {table_name}: {e}")
            else:
                print("File upload failed.")

    cursor.close()
    conn.close()
    end_time = time.time()
    execution = end_time - start_time
    print(f"Tables created total Time.{execution}")


if __name__ == "__main__":
    main()