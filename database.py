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


# CREATE 
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


# READ 
def view_fatalities(connection):
    try:
        cursor = connection.cursor()

        sql = """
        SELECT
            fatality.fatality_id,
            enthusiast.first_name,
            enthusiast.last_name,
            fatality.incident_date,
            location.location_name,
            death_type.type_name,
            season.season_name,
            fatality.weather_conditions

        FROM fatality

        JOIN enthusiast
        ON fatality.enthusiast_id = enthusiast.enthusiast_id

        JOIN location
        ON fatality.location_id = location.location_id

        JOIN death_type
        ON fatality.death_type_id = death_type.death_type_id

        JOIN season
        ON fatality.season_id = season.season_id
        """

        cursor.execute(sql)

        rows = cursor.fetchall()

        print("\n=== Fatality Records ===")

        for row in rows:
            print("\nFatality ID:", row[0])
            print("Victim:", row[1], row[2])
            print("Date:", row[3])
            print("Location:", row[4])
            print("Death Type:", row[5])
            print("Season:", row[6])
            print("Weather:", row[7])

    except Error as e:
        print("error:", e)


# UPDATE 
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


# DELETE 
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
