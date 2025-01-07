import logging
from pyhive import hive


# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("hive_querylog"),
        logging.StreamHandler()
    ]
)

def create_connection(database_name: str):
    try:
        logging.info("Connecting to Hive...")
        conn = hive.Connection(
            host='182.48.72.82', 
            port=10000, 
            username='root', 
            auth='NONE'
        )
        cursor = conn.cursor()
        cursor.execute(f"USE {database_name}")
        logging.info("Successfully connected to Hive and selected database: %s", database_name)
        return conn, cursor
    except Exception as e:
        logging.error("Error connecting to Hive: %s", e, exc_info=True)
        raise

def load_hive_query(conn,query):
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        
        logging.info("Data fetch successfully")
    except Exception as e:
        logging.error("Error loading data %s", e, exc_info=True)
    finally:
        if cursor:
            cursor.close()


def main():
    try:
        voucher_types = "38"
        entry_date_start = "2023-01-01"
        entry_date_end = "2023-12-31"
        inventory_id = "1"
        additional_condition = ""  

        database_name = 'kiam_db_final'
        logging.info("Starting the Hive Query execution process")
        conn, cursor = create_connection(database_name)

        query = f"""
               SELECT
    CASE WHEN t2.delivered_quantity IS NULL THEN 0 ELSE t2.delivered_quantity END AS opening_quantity,
    CASE WHEN t2.cost IS NULL THEN 0 ELSE t2.cost END AS opening_cost,
    inventory_journals.entry_date AS 'date',
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
    inventory_journals.inventory_id;

                """


        logging.info("Run Query %s",query ,exc_info=True)
        load_hive_query(conn=conn,query=query)

        logging.info("Process completed successfully.")
    except Exception as e:
        logging.critical("Critical error in the main process: %s", e, exc_info=True)
    finally:
        if 'conn' in locals() and conn:
            conn.close()
            logging.info("Hive connection closed.")

if __name__ == "__main__":
    main()
