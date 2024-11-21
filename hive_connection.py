from thrift.transport.TSocket import TSocket
from thrift.transport.TTransport import TFramedTransport
from thrift.protocol.TBinaryProtocol import TBinaryProtocol

from pyhive import hive

#hive connection
def create_connection():
    try:
        print("Connecting to Hive...")
        # Create a Thrift socket with timeout
        socket = TSocket('172.19.147.229', 10000)
        socket.setTimeout(60000)  # Set timeout in milliseconds

        # Wrap socket with transport and protocol
        transport = TFramedTransport(socket)
        protocol = TBinaryProtocol(transport)
        conn = hive.Connection(
            host='172.19.147.229', 
            port=10000, 
            username='uttom41', 
            auth='NONE'
        )
        cursor = conn.cursor()
        print("Successfully connected to Hive")
        return conn, cursor
    except Exception as e:
        print("Error connecting to Hive:", e)
        raise