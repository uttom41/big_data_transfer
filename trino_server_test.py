from flask import Flask, request, jsonify, render_template_string
import trino
from trino.auth import BasicAuthentication
import time

app = Flask(__name__)

# Trino server connection details
TRINO_HOST = "182.48.72.82"
TRINO_PORT = 8080
TRINO_CATALOG = "hive"
TRINO_SCHEMA = "kiam_db_final"
TRINO_USERNAME = "root"
TRINO_PASSWORD = ""

# HTML Template
HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
    <title>Trino SQL Executor</title>
</head>
<body>
    <h1>Execute SQL Query</h1>
    <form method="post" action="/execute">
        <label for="query">Enter SQL Query:</label><br>
        <textarea id="query" name="query" rows="5" cols="50" required></textarea><br><br>
        <input type="submit" value="Execute">
    </form>

    {% if result %}
        <h2>Result:</h2>
        <textarea rows="10" cols="50" readonly>{{ result }}</textarea>
    {% elif error %}
        <h2 style="color: red;">Error:</h2>
        <textarea rows="10" cols="50" readonly>{{ error }}</textarea>
    {% endif %}

    {% if execution_time %}
        <h3>Query Execution Time: {{ execution_time }} seconds</h3>
    {% endif %}
</body>
</html>
"""

@app.route('/', methods=['GET'])
def home():
    return render_template_string(HTML_TEMPLATE, result=None, error=None, execution_time=None)

@app.route('/execute', methods=['POST'])
def execute_query():
    query = request.form.get('query')
    try:
        # Start measuring time
        start_time = time.time()

        # Connect to Trino
        conn = trino.dbapi.connect(
            host=TRINO_HOST,
            port=TRINO_PORT,
            user=TRINO_USERNAME,
            catalog=TRINO_CATALOG,
            schema=TRINO_SCHEMA,
            # auth=BasicAuthentication(TRINO_USERNAME, TRINO_PASSWORD)
        )
        cursor = conn.cursor()

        # Execute query
        cursor.execute(query)
        rows = cursor.fetchall()

        # Measure execution time
        execution_time = round(time.time() - start_time, 2)

        # Format result as JSON
        columns = [desc[0] for desc in cursor.description]
        result = [dict(zip(columns, row)) for row in rows]

        # Truncate large results for display
        if len(result) > 1000:
            truncated_result = result[:1000]
            display_result = {
                "message": "Result truncated to 1000 rows due to size limit.",
                "data": truncated_result
            }
        else:
            display_result = result

        return render_template_string(HTML_TEMPLATE, result=jsonify(display_result).get_data(as_text=True), error=None, execution_time=execution_time)

    except Exception as e:
        # Handle errors
        execution_time = round(time.time() - start_time, 2)
        return render_template_string(HTML_TEMPLATE, result=None, error=str(e), execution_time=execution_time)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
