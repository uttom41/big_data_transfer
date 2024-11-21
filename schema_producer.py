import mysql.connector

from model.schems import Column, Schema, Table

# Function to connect to MySQL and retrieve schema information
def get_mysql_schema(mysql_config):
    # Establish connection to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()

    # Create Schema object to hold all tables
    schema = Schema()

    # Retrieve all tables from the database
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()

    for (table_name,) in tables:
        # For each table, retrieve column details
        cursor.execute(f"DESCRIBE {table_name}")
        columns = cursor.fetchall()

        # Create a list of Column objects for the table
        column_objects = []
        for column in columns:
            column_name = column[0]
            column_type = column[1]
            column_objects.append(Column(column_name, column_type))

        # Create Table object and add it to Schema
        table = Table(table_name, column_objects)
        schema.add_table(table)

    cursor.close()
    conn.close()

    return schema
