import pymysql.cursors

def connect():
    """Connect to the MySQL database."""
    try:
        config = {
            'host': 'your_host',
            'user': 'your_username',
            'password': 'your_password',
            'database': 'your_database',
            'charset': 'utf8mb4',
            'cursorclass': pymysql.cursors.DictCursor
        }
        return pymysql.connect(**config)
    except pymysql.MySQLError as e:
        print(f"Error connecting to the database: {e}")
        return None

def create_trail(name, length, elevation, description, image_url, location_id):
    """Create a new trail record."""
    db = connect()
    if db is not None:
        try:
            with db.cursor() as cursor:
                sql = """
                INSERT INTO trails (name, length, elevation, description, image_url, location_id)
                VALUES (%s, %s, %s, %s, %s, %s)
                """
                values = (name, length, elevation, description, image_url, location_id)
                cursor.execute(sql, values)
                db.commit()
                trail_id = cursor.lastrowid
                print(f"Trail Created: {trail_id}")
                return trail_id
        finally:
            db.close()

def read_trails():
    """Read all trails."""
    db = connect()
    if db is not None:
        try:
            with db.cursor() as cursor:
                cursor.execute("SELECT * FROM trails")
                result = cursor.fetchall()
                for row in result:
                    print(row)
        finally:
            db.close()

def update_trail(trail_id, new_name):
    """Update an existing trail's name."""
    db = connect()
    if db is not None:
        try:
            with db.cursor() as cursor:
                sql = "UPDATE trails SET name = %s WHERE id = %s"
                values = (new_name, trail_id)
                cursor.execute(sql, values)
                db.commit()
                print(f"Trail Updated: {cursor.rowcount} records.")
        finally:
            db.close()

def delete_trail(trail_id):
    """Delete a trail."""
    db = connect()
    if db is not None:
        try:
            with db.cursor() as cursor:
                # Check for dependent reviews
                cursor.execute("SELECT id FROM reviews WHERE trail_id = %s", (trail_id,))
                reviews = cursor.fetchall()
                if reviews:
                    print("Cannot delete trail because there are reviews depending on it:")
                    for review in reviews:
                        print(review)  # Debug output to see what's blocking the deletion
                    return
                else:
                    print("No dependent reviews found; proceeding with deletion.")

                # Delete the trail if no dependent reviews
                sql = "DELETE FROM trails WHERE id = %s"
                cursor.execute(sql, (trail_id,))
                db.commit()
                print(f"Trail Deleted: {cursor.rowcount} records.")
        finally:
            db.close()

# Example usage to demonstrate functionality
if __name__ == "__main__":
    new_trail_id = create_trail("Test Trail", 500, 100, "Test description", "http://example.com/testtrail.jpg", 1)
    read_trails()
    update_trail(new_trail_id, "Updated Test Trail")
    delete_trail(new_trail_id)
