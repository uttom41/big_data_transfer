import logging
from pyhive import hive

from model.schems import Schema

def escape_reserved_keyword(column_name):
    # List of common reserved keywords in Hive (extend as needed)
    reserved_keywords = ['date', 'end', 'select', 'from', 'where', 'time', 'start', 'DATE', 'current', 'less', 'exchange', 'to', 'group', 'transform', 'percent']
    if column_name.lower() in reserved_keywords:
        return f"`{column_name}`"
    return column_name
# table generate
def create_single_partitioned_hive_table(conn:hive.Connection, schema:Schema):
    column_names = set()
   
    
    try:
        i = 0
        print(schema)
        for table in schema['tables']:
            i+=1
            print(f"*************Name ({i}):",table['name'])
            create_stmt = f"CREATE TABLE IF NOT EXISTS {table['name']} ("
            for col in table['columns']:
                original_name = col['name']
                # Escape reserved keywords like 'order'
                # column_name = original_name
                column_name = escape_reserved_keyword(original_name)  # Escape keywords

                if column_name.lower() in ['order', 'select', 'from', 'where', \
                    'raw', 'unique', 'out', "application", 'user', 'column', \
                        '_down_payment', '_voucher_number', '_edit_url','floor']:  # Add more keywords if necessary
                    column_name = f"`{column_name}`"  # Escape the keyword

                count = 1
                
                # Check for duplicates and rename if necessary
                while column_name in column_names:
                    column_name = f"{original_name}_{count}"
                    count += 1
                
                # Add column name to set and to the create statement
                column_names.add(column_name)

                 # Check if the data type is valid, else replace with a valid type
                data_type = col['data_type'].upper()
                # valid_data_types = ['STRING', 'INT', 'BIGINT', 'FLOAT', 'DOUBLE', 'BOOLEAN', 'TIMESTAMP']
                valid_data_types = ['STRING', 'INT', 'BIGINT', 'FLOAT', 'DOUBLE', 'BOOLEAN', 'TIMESTAMP', 'DATE']

                if data_type not in valid_data_types:
                    data_type = "STRING"
                create_stmt += f"{column_name} {data_type.upper()}, "
        
            create_stmt = create_stmt.rstrip(", ")  # Remove trailing comma
            create_stmt += ") STORED AS ORC"
            print(f"*********Table created successfully.{create_stmt}")

            cursor = conn.cursor()
            cursor.execute(create_stmt)
            if cursor:
                cursor.close()
                cursor = conn.cursor()
            
            print(f"*********Table created successfully.{table['name']}")
            
            
        print("Table created successfully.")
    
    except Exception as e:
        # Handle errors and log the issue
        logging.error(f"Error creating partitioned table: {e}")
        raise Exception(f"Error creating partitioned table: {e}")
    
    return None
