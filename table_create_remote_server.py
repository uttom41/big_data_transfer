from model.schems import Schema, Table, Column
import mysql.connector
import logging
from hive_connection import create_connection
from pyhive import hive


# mysql_to_hive_types = {
#     'TINYINT': 'TINYINT',
#     'SMALLINT': 'SMALLINT',
#     'MEDIUMINT': 'INT',
#     'INT': 'INT',
#     'INTEGER': 'INT',
#     'BIGINT': 'BIGINT',
#     'DECIMAL': 'DECIMAL',
#     'NUMERIC': 'DECIMAL',
#     'FLOAT': 'FLOAT',
#     'DOUBLE': 'DOUBLE',
#     'BIT': 'BOOLEAN',
#     'CHAR': 'STRING',
#     'VARCHAR': 'STRING',
#     'TEXT': 'STRING',
#     'DATE': 'DATE',
#     'DATETIME': 'TIMESTAMP',
#     'TIMESTAMP': 'TIMESTAMP',
#     'TIME': 'STRING',  # Hive does not have a specific TIME type
#     'YEAR': 'STRING',  # Hive does not have a specific YEAR type
#     'JSON': 'STRING',  # Hive does not have a specific JSON type
#     'BLOB': 'BINARY',
#     'ENUM': 'STRING',  # Treat ENUM as STRING in Hive
#     'SET': 'STRING',   # Treat SET as STRING in Hive
# }

mysql_to_hive_trino_types = {
    'TINYINT': 'SMALLINT',
    'SMALLINT': 'SMALLINT',
    'MEDIUMINT': 'INT',
    'INT': 'INT',
    'INTEGER': 'INT',
    'BIGINT': 'BIGINT',
    'DECIMAL': 'DECIMAL',
    'NUMERIC': 'DECIMAL',
    'FLOAT': 'FLOAT',
    'DOUBLE': 'DOUBLE',
    'BIT': 'BOOLEAN',
    'CHAR': 'STRING',
    'VARCHAR': 'STRING',
    'TEXT': 'STRING',
    'DATE': 'DATE',
    'DATETIME': 'TIMESTAMP',
    'TIMESTAMP': 'TIMESTAMP',
    'TIME': 'STRING',
    'YEAR': 'STRING',
    'JSON': 'STRING',
    'BLOB': 'BINARY',
    'ENUM': 'STRING',
    'SET': 'STRING',
}



def get_mysql_schema(mysql_config):
    # Establish connection to MySQL
    conn = mysql.connector.connect(**mysql_config)
    cursor = conn.cursor()

    # Create Schema object to hold all tables
    schema = Schema()

    # Retrieve all tables from the database
    cursor.execute("""
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = %s AND table_type = 'BASE TABLE'
        """, (mysql_config['database'],))
    tables = cursor.fetchall()

    for (table_name,) in tables:
        # For each table, retrieve column details
        cursor.execute(f"DESCRIBE `{table_name}`")
        columns = cursor.fetchall()

        # Create a list of Column objects for the table
        column_objects = []
        for column in columns:
            column_name = column[0]
            column_type = column[1]
            column_objects.append(Column(column_name, column_type))

        # Create Table object and add it to Schema
        if table_name == 'authorization':
            table_name = f"`{table_name}`"

        table = Table(table_name, column_objects)
        schema.add_table(table)

    cursor.close()
    conn.close()

    return schema

def escape_reserved_keyword(column_name):
    # List of common reserved keywords in Hive (extend as needed)
    reserved_keywords = ['date', 'end', 'select', 'from', 'where', 'time',  \
                         'start', 'DATE', 'current', 'less', 'exchange', 'to', 'group', \
                            'transform', 'percent','order', 'select', 'from', 'where', \
                                'raw', 'unique', 'out', "application", 'user', 'column','_down_payment', '_voucher_number', '_edit_url','floor']
    
    if column_name.lower() in reserved_keywords:
        return f"`{column_name}`"
    return column_name

# table generate
def create_single_partitioned_hive_table(conn:hive.Connection, schema:Schema):
    column_names = set()
    try:
        i = 0
        for table in schema.tables:
            i+=1
            print(f"*************Name ({i}):",table.name)
            create_stmt = f"CREATE TABLE IF NOT EXISTS {table.name} ("

            for col in table.columns:
                original_name = col.name
    
                column_name = escape_reserved_keyword(original_name)
                column_names.add(column_name)
                data_type = col.data_type.upper()

                if '(' in data_type:
                    data_type = data_type.split('(')[0].strip()
               
                hive_type = mysql_to_hive_trino_types.get(data_type, 'STRING')
                create_stmt += f"{column_name} {hive_type.upper()}, "
        
            create_stmt = create_stmt.rstrip(", ") 
            create_stmt += ")"
            
            create_stmt += " STORED AS ORC"
           
            cursor = conn.cursor()
            cursor.execute(create_stmt)
            if cursor:
                cursor.close()
                cursor = conn.cursor()
          
            
        print("Table created successfully.")
    
    except Exception as e:
        logging.error(f"Error creating partitioned table: {e}")
        raise Exception(f"Error creating partitioned table: {e}")
    
    return None




def main():
    database_name = "kiam_db_final"
    mysql_config = {
        "host": "182.48.72.82",
        "user": "root",
        "password": "12345678",
        "database": "kiam_db",
        "port": 3306,
    }
    conn, cursor = create_connection(database_name)

    schema:Schema = get_mysql_schema(mysql_config)
    create_single_partitioned_hive_table(conn=conn,schema=schema)




if __name__ == "__main__":
    main()