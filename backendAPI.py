from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

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

# Get a single exercise by ID
@app.route("/exercise/<exercise_id>", methods=["GET"])
def get_exercise_by_id(exercise_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Exercise WHERE exercise_id = %s;", (exercise_id,))
    exercise = cursor.fetchone()
    conn.close()
    return jsonify(exercise)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
