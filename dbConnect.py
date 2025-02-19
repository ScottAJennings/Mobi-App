import mysql.connector
from mysql.connector import Error

# Define MySQL connection details
HOST = "localhost"  # or "127.0.0.1"
USER = "scott"  # Change if using a different user
PASSWORD = "scott"  # Set your actual MySQL root password
DATABASE = "Mobi_Exercise_db"  # Change to your database name

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
        
        print("\nDatabases on this MySQL server:")
        for db in databases:
            print(f"- {db[0]}")

        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("\nMySQL connection closed.")

except Error as e:
    print(f"Error: {e}")
