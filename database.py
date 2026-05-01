import mysql.connector
from mysql.connector import Error


def create_connection():
    """Connect to MySQL database"""
    try:
        connection = mysql.connector.connect(
            host="localhost",
            database="colorado_outdoor_caution",
            user="root",
            password="password"
        )

        if connection.is_connected():
            print("Connected to database.")
            return connection

    except Error as e:
        print(f"Connection error: {e}")
        return None

import mysql.connector
from mysql.connector import Error


# connect to database
def create_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            database="colorado_outdoor_caution",
            user="root",
            password="password"
        )

        if connection.is_connected():
            print("Connected to database")
            return connection

    except Error as e:
        print("error connecting:", e)
        return None


# CREATE - add new enthusiast
def add_enthusiast(connection):
    try:
        cursor = connection.cursor()

        first_name = input("first name: ")
        last_name = input("last name: ")
        age = input("age: ")
        level = input("experience level: ")
        state = input("state: ")

        sql = "INSERT INTO enthusiast (first_name, last_name, age, experience_level, state_of_residence) VALUES (%s,%s,%s,%s,%s)"
        values = (first_name, last_name, age, level, state)

        cursor.execute(sql, values)
        connection.commit()

        print("added enthusiast")

    except Error as e:
        print("error:", e)


# READ - show fatalities
def view_fatalities(connection):
    try:
        cursor = connection.cursor()

        sql = """
        SELECT f.fatality_id, f.incident_date, l.location_name,
               d.type_name, s.season_name, f.weather_conditions
        FROM fatality f
        JOIN location l ON f.location_id = l.location_id
        JOIN death_type d ON f.death_type_id = d.death_type_id
        JOIN season s ON f.season_id = s.season_id
        """

        cursor.execute(sql)
        rows = cursor.fetchall()

        print("\nfatalities:")
        for row in rows:
            print(row)

    except Error as e:
        print("error:", e)


# UPDATE - change weather
def update_weather(connection):
    try:
        cursor = connection.cursor()

        fid = input("fatality id: ")
        weather = input("new weather: ")

        sql = "UPDATE fatality SET weather_conditions = %s WHERE fatality_id = %s"
        values = (weather, fid)

        cursor.execute(sql, values)
        connection.commit()

        print("updated")

    except Error as e:
        print("error:", e)


# DELETE - remove fatality
def delete_fatality(connection):
    try:
        cursor = connection.cursor()

        fid = input("fatality id to delete: ")
        confirm = input("are you sure? yes/no: ")

        if confirm != "yes":
            print("cancelled")
            return

        sql = "DELETE FROM fatality WHERE fatality_id = %s"

        cursor.execute(sql, (fid,))
        connection.commit()

        print("deleted")

    except Error as e:
        print("error:", e)