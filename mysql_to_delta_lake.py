from mysql.connector import connect
from pyspark.sql import SparkSession
from datetime import datetime
import logging
import os
import sys

def setup_logging():
    """Configure logging for the migration process"""
    log_dir = "logs"
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
        
    log_file = os.path.join(log_dir, f'migration_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log')
    
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_file),
            logging.StreamHandler(sys.stdout)
        ]
    )
    return logging.getLogger(__name__)

def validate_paths():
    """Validate MySQL connector and Delta paths exist"""
    mysql_connector_path = "/usr/local/apache-hive-4.0.1/mysql-connector-j-8.1.0/mysql-connector-j-8.1.0.jar"
    if not os.path.exists(mysql_connector_path):
        raise FileNotFoundError(f"MySQL connector JAR not found at: {mysql_connector_path}")
    return mysql_connector_path

def create_spark_session():
    """Initialize Spark session with Delta Lake support and MySQL JDBC driver"""
    mysql_connector_path = validate_paths()
    
    spark = (SparkSession.builder
        .appName("MySQL to Delta Lake Migration")
        .config("spark.jars.packages", "io.delta:delta-core_2.12:2.4.0,mysql:mysql-connector-java:8.0.26")
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
        .config("spark.driver.extraClassPath", mysql_connector_path)
        .config("spark.sql.session.timeZone", "UTC")
        .config("spark.sql.debug.maxToStringFields", 100)
        .config("spark.sql.adaptive.enabled", "true")
        .master("local[*]")
        .config("spark.driver.memory", "4g")
        .config("spark.executor.memory", "4g")
        .getOrCreate())

    
    # Set Spark logging level
    spark.sparkContext.setLogLevel("WARN")
    return spark

def test_mysql_connection(config):
    """Test MySQL connection and database access"""
    try:
        conn = connect(**config, connect_timeout=10)
        cursor = conn.cursor()
        cursor.execute("SELECT VERSION()")
        version = cursor.fetchone()
        cursor.close()
        conn.close()
        logging.info(f"Successfully connected to MySQL (version: {version[0]})")
        return True
    except Exception as e:
        logging.error(f"MySQL connection test failed: {str(e)}")
        return False

def get_mysql_connection(host, user, password, database):
    """Create MySQL connection with retry logic"""
    max_retries = 3
    retry_count = 0
    
    while retry_count < max_retries:
        try:
            return connect(
                host=host,
                user=user,
                password=password,
                database=database,
                connect_timeout=10
            )
        except Exception as e:
            retry_count += 1
            if retry_count == max_retries:
                raise
            logging.warning(f"Connection attempt {retry_count} failed. Retrying... Error: {str(e)}")

def get_table_names(mysql_conn):
    """Get list of all tables in the database"""
    cursor = mysql_conn.cursor()
    cursor.execute("SHOW TABLES")
    tables = [table[0] for table in cursor.fetchall()]
    cursor.close()
    return tables

def migrate_table(spark, mysql_props, table_name, delta_base_path, batch_size=10000):
    """Migrate a single table from MySQL to Delta Lake"""
    logger = logging.getLogger(__name__)
    logger.info(f"Starting migration for table: {table_name}")
    
    try:
        # Get total number of records and schema
        mysql_conn = get_mysql_connection(**mysql_props)
        cursor = mysql_conn.cursor()
        cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
        total_records = cursor.fetchone()[0]
        
        # Get table schema
        cursor.execute(f"DESCRIBE {table_name}")
        schema = cursor.fetchall()
        logger.info(f"Table {table_name} schema: {schema}")
        
        cursor.close()
        mysql_conn.close()
        
        # Create JDBC URL with additional parameters
        jdbc_url = (f"jdbc:mysql://{mysql_props['host']}/{mysql_props['database']}"
                   "?useSSL=false&allowPublicKeyRetrieval=true"
                   "&zeroDateTimeBehavior=convertToNull"
                   "&useUnicode=true&characterEncoding=UTF-8")
        
        # # Read MySQL table using Spark JDBC
        df = (spark.read
              .format("jdbc")
              .option("url", jdbc_url)
              .option("driver", "com.mysql.cj.jdbc.Driver")
              .option("dbtable", table_name)
              .option("user", mysql_props['user'])
              .option("password", mysql_props['password'])
              .option("fetchsize", batch_size)
              .option("numPartitions", 10)
              .option("queryTimeout", "3600")
              .load())
        
        # Create delta table directory if it doesn't exist
        delta_path = os.path.join(delta_base_path, table_name)
        os.makedirs(os.path.dirname(delta_path), exist_ok=True)
        
        # Write to Delta Lake
        (df.write
         .format("delta")
         .mode("overwrite")
         .option("mergeSchema", "true")
         .option("overwriteSchema", "true")
         .save(delta_path))
        
        # Verify record count
        # delta_count = spark.read.format("delta").load(delta_path).count()
        
        # if delta_count == total_records:
        #     logger.info(f"Successfully migrated table {table_name}: {delta_count} records")
        # else:
        #     logger.error(f"Record count mismatch for {table_name}. MySQL: {total_records}, Delta: {delta_count}")
            
    except Exception as e:
        logger.error(f"Error migrating table {table_name}: {str(e)}")
        raise

def main():
    # Configuration
    MYSQL_CONFIG = {
        "host": "192.168.10.58",
        "user": "root",
        "password": "12345678",
        "database": "prism"
    }
    DELTA_BASE_PATH = "/home/uttom41/Downloads/delta_data/prism/tables/"
    
    # Setup logging
    logger = setup_logging()
    logger.info("Starting MySQL to Delta Lake migration")
    
    # Validate Delta Lake path
    os.makedirs(DELTA_BASE_PATH, exist_ok=True)
    
    # Test MySQL connection
    if not test_mysql_connection(MYSQL_CONFIG):
        logger.error("Failed to connect to MySQL. Exiting...")
        sys.exit(1)
    
    # Initialize Spark
    spark = create_spark_session()
    
    try:
        # Connect to MySQL
        mysql_conn = get_mysql_connection(**MYSQL_CONFIG)
        
        # Get list of tables
        tables = get_table_names(mysql_conn)
        logger.info(f"Found {len(tables)} tables to migrate")
        
        if not tables:
            logger.warning("No tables found in the database")
            return
        
        # Close the initial connection
        mysql_conn.close()
        
        # Migrate each table
        successful_migrations = 0
        failed_migrations = 0
        
        for i, table in enumerate(tables, 1):

            if failed_migrations > 1:
                break

            try:
                logger.info(f"Processing table {i} of {len(tables)}: {table}")
                migrate_table(spark, MYSQL_CONFIG, table, DELTA_BASE_PATH)
                successful_migrations += 1
            except Exception as e:
                logger.error(f"Failed to migrate table {table}: {str(e)}")
                failed_migrations += 1
                continue
        
        # Log migration summary
        logger.info("Migration Summary:")
        logger.info(f"Total tables: {len(tables)}")
        logger.info(f"Successfully migrated: {successful_migrations}")
        logger.info(f"Failed migrations: {failed_migrations}")
        
    except Exception as e:
        logger.error(f"Migration failed: {str(e)}")
        raise
        
    finally:
        spark.stop()

if __name__ == "__main__":
    main()