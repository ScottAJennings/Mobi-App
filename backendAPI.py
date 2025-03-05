from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)  # Allow all origins to access API

# MySQL connection
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="scott",
        password="scott",
        database="Mobi_Exercise_db"
    )

# Get all exercises
@app.route("/exercises", methods=["GET"])
def get_exercises():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Exercise;")
    exercises = cursor.fetchall()
    conn.close()
    return jsonify(exercises)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

