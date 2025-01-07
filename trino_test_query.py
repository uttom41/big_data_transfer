import trino
from trino.auth import BasicAuthentication
from datetime import date, datetime
from decimal import Decimal
import time

# Trino server connection details
host = "182.48.72.82"  # Replace with your Trino server host
port = 8080  # Replace with your Trino server port
catalog = "hive"
schema = "kiam_db_final"
username = "root"  # Replace with your Trino username
password = ""  # Replace with your Trino password (if applicable)

# SQL Query
query = """
SELECT
    CASE WHEN t2.delivered_quantity IS NULL THEN 0 ELSE t2.delivered_quantity END AS opening_quantity,
    CASE WHEN t2.cost IS NULL THEN 0 ELSE t2.cost END AS opening_cost,
    inventory_journals.entry_date AS "date",
    CASE WHEN t2.qty_kgs IS NULL THEN 0 ELSE t2.qty_kgs END AS opening_quantity_kgs,
    inventory_journals.product_id,
    inventory_journals.barcode,
    inventory_journals.variant_1,
    inventory_journals.variant_2,
    inventory_journals.variant_3,
    inventory_journals.variant_4,
    inventory_journals.variant_5,
    inventory_journals.variant_6,
    CASE WHEN t2.delivered_quantity IS NULL THEN 0 ELSE t2.delivered_quantity END AS closing_quantity,
    CASE WHEN t2.cost IS NULL THEN 0 ELSE t2.cost END AS closing_cost,
    CASE WHEN t2.qty_kgs IS NULL THEN 0 ELSE t2.qty_kgs END AS closing_quantity_kgs,
    SUM(CASE WHEN inventory_journals.voucher_type IN (38) AND inventory_journals.delivered_quantity < 0 THEN inventory_journals.cost ELSE 0 END) AS delivery_out_cost,
    SUM(CASE WHEN inventory_journals.voucher_type IN (38) AND inventory_journals.delivered_quantity < 0 THEN inventory_journals.delivered_quantity ELSE 0 END) AS delivery_out_quantity,
    SUM(CASE WHEN inventory_journals.voucher_type IN (38) AND inventory_journals.delivered_quantity < 0 THEN inventory_journals.qty_kgs ELSE 0 END) AS out_qty_kgs,
    SUM(CASE WHEN inventory_journals.voucher_type IN (38) AND inventory_journals.delivered_quantity > 0 THEN inventory_journals.cost ELSE 0 END) AS delivery_in_cost,
    SUM(CASE WHEN inventory_journals.voucher_type IN (38) AND inventory_journals.delivered_quantity > 0 THEN inventory_journals.delivered_quantity ELSE 0 END) AS delivery_in_quantity,
    SUM(CASE WHEN inventory_journals.voucher_type IN (38) AND inventory_journals.delivered_quantity > 0 THEN inventory_journals.qty_kgs ELSE 0 END) AS in_qty_kgs
FROM
    inventory_journals
    LEFT JOIN (
        SELECT
            SUM(t3.cost) AS cost,
            SUM(t3.qty_kgs) AS qty_kgs,
            SUM(t3.delivered_quantity) AS delivered_quantity,
            t3.product_id, t3.barcode, t3.variant_1, t3.variant_2, t3.variant_3, t3.variant_4, t3.variant_5, t3.variant_6,
            t3.inventory_id
        FROM
            inventory_journals AS t3
        WHERE
            t3.entry_date < DATE '2023-01-01' AND t3.inventory_id = 1 
        GROUP BY
            t3.product_id,
            t3.barcode,
            t3.variant_1,
            t3.variant_2,
            t3.variant_3,
            t3.variant_4,
            t3.variant_5,
            t3.variant_6,
            t3.inventory_id
    ) AS t2 ON t2.barcode = inventory_journals.barcode AND t2.inventory_id = inventory_journals.inventory_id
    AND ((t2.variant_1 IS NULL AND inventory_journals.variant_1 IS NULL) OR (t2.variant_1 = inventory_journals.variant_1))
    AND ((t2.variant_2 IS NULL AND inventory_journals.variant_2 IS NULL) OR (t2.variant_2 = inventory_journals.variant_2))
    AND ((t2.variant_3 IS NULL AND inventory_journals.variant_3 IS NULL) OR (t2.variant_3 = inventory_journals.variant_3))
    AND ((t2.variant_4 IS NULL AND inventory_journals.variant_4 IS NULL) OR (t2.variant_4 = inventory_journals.variant_4))
    AND ((t2.variant_5 IS NULL AND inventory_journals.variant_5 IS NULL) OR (t2.variant_5 = inventory_journals.variant_5))
    AND ((t2.variant_6 IS NULL AND inventory_journals.variant_6 IS NULL) OR (t2.variant_6 = inventory_journals.variant_6))
WHERE
    inventory_journals.entry_date > DATE '2023-01-01' AND inventory_journals.entry_date <= DATE '2023-12-31'
    AND inventory_journals.inventory_id = 1 
GROUP BY
    inventory_journals.entry_date,
    inventory_journals.product_id,
    inventory_journals.barcode,
    inventory_journals.variant_1,
    inventory_journals.variant_2,
    inventory_journals.variant_3,
    inventory_journals.variant_4,
    inventory_journals.variant_5,
    inventory_journals.variant_6,
    t2.delivered_quantity,
    t2.cost,
    t2.qty_kgs,
    inventory_journals.inventory_id
"""
# Connect to Trino server
conn = trino.dbapi.connect(
    host=host,
    port=port,
    user=username,
    catalog=catalog,
    schema=schema,
    # auth=BasicAuthentication(username, password)
)

# Execute the query
cursor = conn.cursor()
start_time = time.time()
cursor.execute(query)
end_time = time.time()
execution = end_time - start_time

# Fetch results
results = cursor.fetchall()

# Function to format values
def format_value(value):
    if isinstance(value, Decimal):
        return float(value)  # Convert Decimal to float
    elif isinstance(value, (date, datetime)):
        return value.isoformat()  # Convert date or datetime to ISO format string
    elif value is None:
        return None  # Keep None as it is
    elif isinstance(value, (list, tuple)):
        return [format_value(v) for v in value]  # Recursively format list/tuple
    elif isinstance(value, dict):
        return {k: format_value(v) for k, v in value.items()}  # Recursively format dict
    else:
        return value  # Keep other types as they are

# Print results
# for row in results:
#     formatted_row = [format_value(value) for value in row]
#     print(formatted_row)
print(f"Time:{execution}")
# Close connection
cursor.close()
conn.close()
