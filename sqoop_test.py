import os
import mysql.connector
import json
import subprocess

# Load configuration from JSON file
with open("db_config.json", "r") as config_file:
    config = json.load(config_file)

# Extract configurations
mysql_config = {
    "host": config["host"],
    "port": config["port"],
    "user": config["user"],
    "password": config["password"],
    "database": config["database"],
    "check_column": config["check_column"]
}
hive_config = {
    "hive_database": config["hive_database"],
    "warehouse_dir": config["warehouse_dir"]
}

# Path to the JSON file for storing last values
last_value_file = "last_value.json"

# Function to create Hive database if not exists
def create_hive_database(hive_database):
    hive_command = f"wsl hive -e 'CREATE DATABASE IF NOT EXISTS {hive_database};'"
    print(f"Checking/Creating Hive database: {hive_database}")
    subprocess.run(hive_command, shell=True, check=True)

# Function to fetch all tables from MySQL
def fetch_mysql_tables(mysql_config):
    conn = mysql.connector.connect(
        host=mysql_config["host"],
        port=mysql_config["port"],
        user=mysql_config["user"],
        password=mysql_config["password"],
        database=mysql_config["database"]
    )
    cursor = conn.cursor()
    cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = %s", (mysql_config["database"],))
    tables = [row[0] for row in cursor.fetchall()]
    conn.close()
    return tables

# Function to read last values from the JSON file
def read_last_value():
    if os.path.exists(last_value_file):
        with open(last_value_file, "r") as f:
            return json.load(f)
    else:
        return {}

# Function to update the last value in the JSON file
def update_last_value(database, table, last_value):
    data = read_last_value()

    # Ensure the database exists in the JSON structure
    if database not in data:
        data[database] = {}

    # Update the last value for the specific table
    data[database][table] = str(last_value)

    # Write the updated data back to the JSON file
    with open(last_value_file, "w") as f:
        json.dump(data, f, indent=4)

# Function to perform incremental import for a table
def incremental_import(table, last_value=None):
    # Read last value for the table from JSON
    last_value_data = read_last_value()
    if mysql_config["database"] in last_value_data and table in last_value_data[mysql_config["database"]]:
        last_value = last_value_data[mysql_config["database"]][table]
    else:
        last_value = "0"  # Default to 0 for the first run

    # Sqoop command for incremental import
    sqoop_command = f"""
    sqoop import \
        --connect jdbc:mysql://{mysql_config['host']}:{mysql_config['port']}/{mysql_config['database']} \
        --username {mysql_config['user']} --password {mysql_config['password']} \
        --table {table} \
        --target-dir {hive_config['warehouse_dir']}/{hive_config['hive_database']}/{table} \
        --hive-import --hive-database {hive_config['hive_database']} \
        --create-hive-table \
        --incremental append \
        --check-column {mysql_config['check_column']} \
        --last-value {last_value} \
        --as-parquetfile
    """

    print(f"Running Sqoop command for table: {table}")
    os.system(sqoop_command)

    # Update the last value (fetch max `check_column` from MySQL table)
    conn = mysql.connector.connect(
        host=mysql_config["host"],
        port=mysql_config["port"],
        user=mysql_config["user"],
        password=mysql_config["password"],
        database=mysql_config["database"]
    )
    cursor = conn.cursor()
    cursor.execute(f"SELECT MAX({mysql_config['check_column']}) FROM {table}")
    new_last_value = cursor.fetchone()[0] or last_value  # Handle empty table case
    conn.close()

    # Save the new last value in JSON file
    update_last_value(mysql_config["database"], table, new_last_value)
    print(f"Updated last value for table {table}: {new_last_value}")

# Main workflow
if __name__ == "__main__":
    # Step 1: Create Hive database if not exists
    create_hive_database(hive_config["hive_database"])

    # Step 2: Fetch all tables from MySQL
    tables = fetch_mysql_tables(mysql_config)
    print(f"Found tables: {tables}")

    # Step 3: Perform incremental import for each table
    for table in tables:  # This is the loop that processes each table
        print(f"Processing table: {table}")
        incremental_import(table)

    print("All tables imported successfully!")
