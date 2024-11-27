from flask import Flask, render_template, request
from pyhive import hive
import pandas as pd
import time
import mysql.connector
from hive_connection import create_connection
from pyspark.sql import SparkSession

app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def index():
    data = None
    headers = None
    table_name = None
    row_count=0
    conn, cursor = None, None

    start_time = time.time()
    if request.method == "POST":
        # Get the table name from user input
        table_name = request.form.get("table_name")
        
        if not table_name:
            return render_template("index.html", error="Table name is required", data=data, headers=headers)

        # Query the table
        try:

            spark = SparkSession.builder \
            .appName("ReadHiveData") \
            .master("local[*]") \
            .config("spark.sql.catalogImplementation", "hive") \
            .enableHiveSupport() \
            .getOrCreate()

            database_name = "kiam_db"

            # SQL কোয়েরি তৈরি করুন
           
            # query = f" SELECT * FROM {database_name}.{table_name} WHERE CAST(REGEXP_EXTRACT(working_hour, '^([0-9]+)', 1) AS INT) < 8"
            query = f"SELECT * FROM {database_name}.{table_name} LIMIT 427598"

            # Spark DataFrame-এ কোয়েরি চালান
            df_spark = spark.sql(query)

            # Spark DataFrame-কে pandas DataFrame-এ কনভার্ট করুন
            df_pandas = df_spark.toPandas()

            # pandas DataFrame থেকে HTML রেন্ডারিংয়ের জন্য ডেটা প্রক্রিয়া করুন
            headers = list(df_pandas.columns)
            data = df_pandas.values.tolist()
            row_count = len(data)
            # conn, cursor = create_connection("kiam_db")
            # query = f"SELECT * FROM kiam_db.{table_name} LIMIT 100000"  # Limit for testing; adjust as needed
            # df = pd.read_sql(query, conn)

            # # Convert DataFrame to a list of lists for HTML rendering
            # headers = list(df.columns)
            # data = df.values.tolist()
            # row_count = len(data)
            # cursor.close()
            # conn.close()

        except Exception as e:
            return render_template("index.html", error=f"Error querying table: {e}", data=data, headers=headers)
        finally:
            if cursor:
                cursor.close()
            if conn:
                conn.close()

    end_time = time.time()
    execution = end_time - start_time
    return render_template("index.html", data=data, headers=headers, table_name=table_name,execution=execution,row_count=row_count)

@app.route("/mysqldata", methods=["GET", "POST"])
def mysqldata():
    data = None
    headers = None
    table_name = None
    row_count=0

    mysql_config = {
        "host": "192.168.10.105",
        "user": "remote",
        "password": "123456",
        "database": "kiam_db",
        "port": 3306,
    }

    start_time = time.time()    
    if request.method == "POST":
        # Get the table name from user input
        table_name = request.form.get("table_name")
        
        if not table_name:
            return render_template("index.html", error="Table name is required", data=data, headers=headers)

        # Query the table
        try:
            
            conn = mysql.connector.connect(**mysql_config)
            cursor = conn.cursor()
            query = f"SELECT * FROM {table_name} limit 100000"  # Limit for testing; adjust as needed
            cursor.execute(query)

             # Fetch column headers
            headers = [i[0] for i in cursor.description]

                # Fetch data from the table
            data = cursor.fetchall()
            row_count = cursor.rowcount
                # Close the connection
            cursor.close()
            conn.close()

        except Exception as e:
            return render_template("mysqldata.html", error=f"Error querying table: {e}", data=data, headers=headers)
    end_time = time.time()
    execution = end_time - start_time
    return render_template("mysqldata.html", data=data, headers=headers, table_name=table_name,execution=execution,row_count=row_count)



if __name__ == "__main__":
    app.run(debug=True)
