import mysql.connector
import random
import string

def random_string(length):
    """Generates a random string of lowercase letters."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def random_double():
    """Generates a random float with 4 digits after the decimal point."""
    return round(random.uniform(0, 100), 4)

def insert_trails_data(cursor, number_of_records):
    """Inserts randomized trail data into the trails_clone table."""
    query = """
    INSERT INTO trails_clone (name, length, elevation, description, image_url, location_id)
    VALUES (%s, %s, %s, %s, %s, %s)
    """
    for _ in range(number_of_records):
        location_id = random.randint(1, 10)
        data = (
            random_string(20),
            random_double(),
            random.randint(0, 3000),
            random_string(50),
            'https://example.com/image.jpg',
            location_id
        )
        cursor.execute(query, data)

# Prompt user to enter database credentials
user = input("Enter your MySQL username: ")
password = input("Enter your MySQL password: ")
host = input("Enter your MySQL server host (e.g., localhost): ")
database = input("Enter your database name: ")

config = {
    'user': user,
    'password': password,
    'host': host,
    'database': database,
    'raise_on_warnings': True
}

# Connect to MySQL and perform data insertion
cnx = None
try:
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()
    insert_trails_data(cursor, 40000)  # Adjust the number of records as needed
    cnx.commit()
    print("Data inserted successfully.")
except mysql.connector.Error as err:
    print(f"Something went wrong: {err}")
finally:
    if cnx and cnx.is_connected():
        cursor.close()
        cnx.close()
        print("MySQL connection is closed.")
