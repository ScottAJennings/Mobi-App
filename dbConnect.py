import mysql.connector
from mysql.connector import Error

# MySQL connection details
HOST = "localhost"  
USER = "scott"  
PASSWORD = "scott"  
DATABASE = "Mobi_Exercise_db"  

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host=HOST,
        user=USER,
        password=PASSWORD,
        database=DATABASE
    )

    if connection.is_connected():
        db_info = connection.get_server_info()
        print(f"Connected to MySQL Server version {db_info}")

        # Create a cursor object
        cursor = connection.cursor()

        # Execute a simple query
        cursor.execute("SHOW DATABASES;")
        databases = cursor.fetchall()
        
        # Print something to terminal
        print("\nDatabases on this MySQL server:")
        for db in databases:
            print(f"- {db[0]}")

        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("\nMySQL connection closed.")

except Error as e:
    print(f"Error: {e}")
