import re
import os
import json
import pyorc
from collections import OrderedDict
from model.schems import Schema
from schema_producer import get_mysql_schema
from hive_connection import create_connection
from schema_consumer import create_single_partitioned_hive_table
from data_producer import export_mysql_to_orc

# # Paths
# sql_file_path = '../prismdb.sql'  # Your MySQL dump file
# table_schema_list = 'table_schema.json'
# output_dir = 'output/'   # Directory to save CSV files
# hive_table_scripts = 'hive_tables.sql'
# hdfs_base_path = '/user/hive/warehouse/'  # HDFS path for Hive tables
# database_name = 'prismdb/'

# # Regex for CREATE TABLE and INSERT INTO
# create_table_regex = re.compile(r"CREATE TABLE `(?P<table>\w+)` \((?P<columns>.+?)\)\s*(/\*.+?\*/)?\s*ENGINE",re.S)

# insert_into_regex = re.compile(r"INSERT INTO `(?P<table>\w+)` VALUES\s*(?P<values>[\s\S]*?);", re.S)

# schema_data_dic = {}


# def load_schema(file_path):
#     try:
#         with open(file_path, "r") as file:
#             return json.load(file)
#     except FileNotFoundError:
#         return {}

# # Function to save data back to the JSON file
# def save_schema():
#     global schema_data_dic
#     with open(table_schema_list, "w") as file:
#         json.dump(schema_data_dic, file)

# # Ensure output directory exists
# os.makedirs(output_dir, exist_ok=True)

# # List of reserved MySQL keywords to ignore during column parsing
# reserved_keywords = ['PRIMARY', 'KEY', 'UNIQUE', 'FOREIGN']

# reserved_Key = [
#     'WHERE', 'LESS', 'TIME', 'FLOOR', 'OUT', '_DOWN_PAYMENT', 'START', 'PERCENT', 'RAW', '_EDIT_URL', 'GROUP', 'USER', 'DATE', 'END', '_VOUCHER_NUMBER', 'ORDER', 'FROM', 'SELECT', 'TRANSFORM', 'EXCHANGE', 'TO', 'UNIQUE', 'APPLICATION', 'CURRENT', 'COLUMN'
# ]
# # Function to clean up column names
# def clean_column_name(col_name):
#     # Remove backticks and unwanted characters
#     return re.sub(r'[^a-zA-Z0-9_]', '', col_name)

# # Function to process and clean columns
# def process_column(column_defs,table_name):
#     columns = []
#     column_names = OrderedDict()
#     combined_def = ""
#     type_map={}
    
#     for column_def in column_defs:
#         column_parts = column_def.strip().split()
        
#         # Skip reserved keywords and their associated definitions
#         if any(keyword.upper() in column_parts for keyword in reserved_keywords):
#             continue
        
#         # Handle split parts of a type like decimal(30,6)
#         if combined_def:
#             combined_def += f" {column_def.strip()}"
#             if ")" in column_def:  # Closing a multi-part type
#                 column_parts = combined_def.strip().split()
#                 combined_def = ""
#             else:
#                 continue
#         elif "(" in column_def and ")" not in column_def:
#             combined_def = column_def.strip()
#             continue

#         # Extract column name
#         column_name = clean_column_name(column_parts[0].strip('`'))
        
#         if column_name.upper() in reserved_Key:
#             column_name = f"`{column_name}`"
#          # Avoid duplicates
#         if column_name in column_names:
#             continue
#         column_names[column_name] = None

#         # Extract column type
#         column_type = column_parts[1] if len(column_parts) > 1 else "STRING"
        
#         # Map MySQL types to Hive types
#         if 'INT' in column_type.upper():
#             hive_type = 'INT'
#         elif 'CHAR' in column_type.upper() or 'TEXT' in column_type.upper():
#             hive_type = 'STRING'
#         elif 'DECIMAL' in column_type.upper() or 'NUMERIC' in column_type.upper():
#             hive_type = 'FLOAT'
#         elif 'DATE' in column_type.upper() or 'TIME' in column_type.upper():
#             hive_type = 'STRING'
#         elif 'FLOAT' in column_type.upper() or 'DOUBLE' in column_type.upper():
#             hive_type = 'FLOAT'
#         else:
#             hive_type = 'STRING'
#         type_map[column_name]=hive_type.lower()
#         columns.append(f"{column_name} {hive_type}")
    
#     # add_or_update_table(table_name=table_name,columns=column_names,types=type_list)
#     global schema_data_dic
#     print(list(column_names.keys()))
#     schema_data_dic[table_name] = {"columns": list(column_names.keys()), "types": type_map}
#     return columns

# # Step 1: Parse the SQL file
# hive_create_statements = []

# with open(sql_file_path, 'r', encoding='utf-8') as sql_file:
#     content = sql_file.read()
#     # Process CREATE TABLE statements
#     for match in create_table_regex.finditer(content):
#         table_name = match.group('table')
#         if table_name =='authorization':
#             table_name= "'authorization'"

#         columns_raw = match.group('columns')
#         column_definitions = columns_raw.split(',')

#         columns = process_column(column_defs=column_definitions,table_name=table_name)
#         # save_schema()
       
#         # hive_query = f"CREATE TABLE IF NOT EXISTS {table_name} (\n    {',\n    '.join(columns)}\n) STORED AS ORC;"
#         # Generate Hive DDL for ORC table
#         # hive_create_statements.append(hive_query)
        



#     # Process INSERT INTO statements
#     for match in insert_into_regex.finditer(content):
#         table_name = match.group('table')
#         if table_name =='authorization':
#             table_name= "'authorization'"
#         values_raw = match.group('values')
#         columns_data = schema_data_dic[table_name]
#         columns = columns_data["columns"]
#         columns_type = columns_data["types"]
        
        
#         schema = f"struct<{','.join([f'{col}:{columns_type[col]}' for col in columns])}>"
#         # Extract individual rows from the VALUES section
#         rows = re.findall(r"\((.+?)\)", values_raw, re.S)
        
#         orc_file_path = f"output/{table_name}.orc"
#         with open(orc_file_path, "wb") as orc_file:
#             writer = pyorc.Writer(orc_file, schema)  # Use the dynamically generated schema
#             print("Table Name: ",table_name)
#             for row in rows:
#                 row = row.strip().strip("()")
#                 values = re.findall(r"'((?:[^'\\]|\\.)*)'|([^',]+)", row)

#                 values = [v[0] if v[0] else v[1] for v in values]
#                 values = [None if value.upper() == 'NULL' else value for value in values]
             
#                 if not row:  # Skip empty rows
#                     print("Skipping empty row.")
#                     continue

#                 if len(values) < len(schema_data_dic[table_name]["types"]):
#                     values.extend([None] * (len(schema_data_dic[table_name]["types"]) - len(values)))     

#                 if len(values) != len(schema_data_dic[table_name]["types"]):
#                     print(f"Skipping row: {values}. Mismatched columns.")
                
#                 else:
#                     parsed_row = []

#                     for value, (column_name, column_type) in zip(values, schema_data_dic[table_name]["types"].items()):
#                         if value is not None:
#                             value = value.strip().strip("'") 
#                         if not value or value.lower() == "null":  # Check for NULL or empty values
#                             parsed_row.append(None)
#                         else:
#                             try:
#                                 if column_type == "int":
#                                     parsed_row.append(int(value))
#                                 elif column_type == "float":
#                                     parsed_row.append(float(value))
#                                 elif column_type == "string":  # Treat as string if it's a VARCHAR or STRING column
#                                     parsed_row.append(value if value and value.lower() != "null" else None)
#                                 else:  # Default to string for other types
#                                     parsed_row.append(value)
#                             except ValueError:
#                                 parsed_row.append(None)
                    
#                     # Check if parsed row matches schema
#                     if len(parsed_row) != len(schema_data_dic[table_name]["types"]):
#                         print(f"Schema for table {table_name}: {schema_data_dic[table_name]['types']}")
#                         continue

#                 writer.write(tuple(parsed_row))  # Write each tuple as a row
#             writer.close()

#         # print(f"ORC file '{orc_file_path}' written successfully!")


#         # for row in rows:
#         #     row = row.strip()
#         #     # Replace NULL with None and split by commas
#         #     cleaned_row = [value.strip().replace("'", "") if value.strip() != "NULL" else None for value in row.split(",")]
            
#         #     # Create dictionary of column names and values
#         #     row_dict = dict(zip(columns, cleaned_row))
#         #     data.append(row_dict)
        
#         # print(data.__sizeof__)

#         # Create a DataFrame from the data
#         # df = pd.DataFrame(data)

#         # # Convert DataFrame to PyArrow Table
#         # table = pa.Table.from_pandas(df)

#         # orc_file_path = f"output/{table_name}.orc"
#         # with open(orc_file_path, 'wb') as f:
#         #     orc.write_table(table, f)

#         # print(f"ORC file created for table {table_name} at {orc_file_path}")

#         # Generate CSV for each table
#         # csv_file_path = os.path.join(output_dir, f"{table_name}.csv")
#         # with open(csv_file_path, 'w', encoding='utf-8') as csv_file:
#         #     for row in rows:
#         #         # Clean up row values
#         #         row = row.strip()
#         #         # Replace NULL values with empty strings and remove quotes
#         #         clean_row = re.sub(r'\bNULL\b', '', row)
#         #         clean_row = clean_row.replace("'", '').replace('\\n', ' ').replace('\\"', '"')
#         #         csv_file.write(clean_row + '\n')
    
    
#     # # Step 2: Write Hive DDL statements
#     # with open(hive_table_scripts, 'w', encoding='utf-8') as script_file:
#     #     script_file.write("\n\n".join(hive_create_statements))

#     # print(f"Hive table creation scripts saved to {hive_table_scripts}")



def main():
    mysql_config = {
        "host": "192.168.10.58",
        "user": "root",
        "password": "12345678",
        "database": "prism",
        "port": 3306,
    }
    conn, cursor = create_connection("prism")
    schema:Schema = get_mysql_schema(mysql_config)
    create_single_partitioned_hive_table(conn,schema)
    
    # query = f"SELECT * FROM attendance ORDER BY id ASC LIMIT 400000 OFFSET 1210100"
    # export_mysql_to_orc(mysql_config,query=query,orc_file_path="output/attendance.orc")

if __name__ == "__main__":
    main()