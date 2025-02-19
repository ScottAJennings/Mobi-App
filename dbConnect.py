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

        create_table_query = """
        CREATE TABLE IF NOT EXISTS Exercise (
            id INT AUTO_INCREMENT PRIMARY KEY,
            exercise_id VARCHAR(50) NOT NULL,
            muscle_group VARCHAR(100),
            type VARCHAR(50),
            location VARCHAR(100),
            instructions TEXT,
            graphic BLOB
        );
        """

        # Execute the query
        cursor.execute(create_table_query)
        print("Table 'Exercise' created successfully!")

        # Close the cursor and connection
        cursor.close()
        connection.close()
        print("\nMySQL connection closed.")

except Error as e:
    print(f"Error: {e}")
