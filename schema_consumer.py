import logging
from pyhive import hive

from model.schems import Schema

hive_table_scripts = 'hive_tables.sql'
mysql_to_hive_types = {
    'TINYINT': 'TINYINT',
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
    'TIME': 'STRING',  # Hive does not have a specific TIME type
    'YEAR': 'STRING',  # Hive does not have a specific YEAR type
    'JSON': 'STRING',  # Hive does not have a specific JSON type
    'BLOB': 'BINARY',
    'ENUM': 'STRING',  # Treat ENUM as STRING in Hive
    'SET': 'STRING',   # Treat SET as STRING in Hive
}

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
    hive_create_statements = []
    try:
        i = 0
        for table in schema.tables:
            i+=1
            print(f"*************Name ({i}):",table.name)

            partition_cols = []
            create_stmt = f"CREATE TABLE IF NOT EXISTS {table.name} ("

            for col in table.columns:
                original_name = col.name
    
                column_name = escape_reserved_keyword(original_name)
                column_names.add(column_name)

                 # Check if the data type is valid, else replace with a valid type
                data_type = col.data_type.upper()

                #partitioned by kaj korbo

                if '(' in data_type:
                    data_type = data_type.split('(')[0].strip()
               
                hive_type = mysql_to_hive_types.get(data_type, 'STRING')

                # if hive_type.upper() == "DATE":
                #     partition_cols.append(column_name)
                # else:
                create_stmt += f"{column_name} {hive_type.upper()}, "
        
            create_stmt = create_stmt.rstrip(", ") 
            # if partition_cols:
            #     partition = ", ".join([f"{col} DATE" for col in partition_cols])
            #     create_stmt += f") PARTITIONED BY ({partition})"
            # else:
            create_stmt += ")"
            
            create_stmt += " STORED AS ORC"
            print(f"*********Table created successfully.{create_stmt}")

            cursor = conn.cursor()
            cursor.execute(create_stmt)
            if cursor:
                cursor.close()
                cursor = conn.cursor()
            hive_create_statements.append(create_stmt)
            print(f"*********Table created successfully.{table.name}")
            
            
        print("Table created successfully.")
        with open(hive_table_scripts, 'w', encoding='utf-8') as script_file:
          script_file.write("\n\n".join(hive_create_statements))
    
    except Exception as e:
        logging.error(f"Error creating partitioned table: {e}")
        raise Exception(f"Error creating partitioned table: {e}")
    
    return None

