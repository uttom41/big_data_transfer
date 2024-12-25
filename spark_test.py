from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when
import mysql.connector


# Initialize Spark session with Hive support
spark = SparkSession.builder \
    .appName("Create Database and Table Example") \
    .config("spark.sql.warehouse.dir", "/user/hive/warehouse") \
    .master("spark://182.48.72.82:7077") \
    .config("spark.sql.hive.metastore.uris", "thrift://182.48.72.82:9083") \
    .config("spark.sql.catalogImplementation", "hive") \
    .config("hive.metastore.schema.verification", "true")\
    .enableHiveSupport() \
    .getOrCreate()


spark.catalog.clearCache()
spark.sql("SHOW DATABASES").show()
# spark.sql("SHOW TABLES IN kiam_db").show()

# database_name = "kiam_db"
# spark.sql(f"CREATE DATABASE IF NOT EXISTS {database_name}")
# print(f"Database '{database_name}' created successfully!")

# # Step 2: Use the new database
# spark.sql(f"USE {database_name}")

# Create database in Hive if it doesn't exist
# spark.sql("CREATE DATABASE IF NOT EXISTS prism_db")


# # Set the database in Hive
# tables = spark.sql("SHOW TABLES IN kiam_db")
# tables.show()

#     # Validate table existence
# spark.sql("DESCRIBE TABLE kiam_db.accounts")
#     # Write data into the table




# # MySQL connection parameters
# mysql_host = "192.168.10.114"
# mysql_port = "3306"
# mysql_user = "root"
# mysql_password = "12345678"
# mysql_db = "prism_db"

# # Function to fetch table names from MySQL database
# def get_mysql_tables():
#     # Connect to MySQL
#     conn = mysql.connector.connect(
#         host=mysql_host,
#         port=mysql_port,
#         user=mysql_user,
#         password=mysql_password,
#         database=mysql_db
#     )

#     cursor = conn.cursor()
    
#     # Query to get all table names in the MySQL database
#     cursor.execute("SHOW TABLES")
#     tables = cursor.fetchall()  # Fetch all table names
    
#     # Close MySQL connection
#     cursor.close()
#     conn.close()
    
#     return [table[0] for table in tables]  # Return list of table names

# # Function to load a table from MySQL to Hive
# def load_table_to_hive(table_name):
#     properties = {
#         "user": "root",
#         "password": "12345678",
#         "driver": "com.mysql.cj.jdbc.Driver",
#         "fetchsize": "10000"  # This will fetch 10,000 rows at a time
#     }

#     jdbc_url = "jdbc:mysql://192.168.10.114:3306/prism_db?useSSL=false"

#     df = spark.read \
#         .format("jdbc") \
#         .option("url", f"jdbc:mysql://{mysql_host}:{mysql_port}/{mysql_db}?zeroDateTimeBehavior=convertToNull") \
#         .option("dbtable", table_name) \
#         .option("user", mysql_user) \
#         .option("password", mysql_password) \
#         .load()
    
#     # Handle invalid dates
#     df = handle_invalid_dates(df)

#     # Write the DataFrame to Hive
#     df.write.mode("overwrite").saveAsTable(f"prism_db.{table_name}")


# def handle_invalid_dates(df):
#     # Replace '0000-00-00' with None (NULL) for all date columns
#     for column in df.columns:
#         df = df.withColumn(column, when(col(column) == '0000-00-00', None).otherwise(col(column)))
#     return df

# # Get all table names from MySQL
# tables = get_mysql_tables()

# # Load all tables to Hive
# for table in tables:
#     print(f"Loading table: {table}")
#     load_table_to_hive(table)
#     print(f"Table {table} loaded successfully into Hive.")
