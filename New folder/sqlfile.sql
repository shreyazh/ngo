import sqlite3

def create_contribution_table():
    connection = sqlite3.connect('contributions.db')
    cursor = connection.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS contributions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            contribution_type TEXT,
            message TEXT
        )
    ''')

    connection.commit()
    connection.close()

def store_contribution(name, email, contribution_type, message):
    connection = sqlite3.connect('contributions.db')
    cursor = connection.cursor()

    cursor.execute('''
        INSERT INTO contributions (name, email, contribution_type, message)
        VALUES (?, ?, ?, ?)
    ''', (name, email, contribution_type, message))

    connection.commit()
    connection.close()

# Example usage
create_contribution_table()
store_contribution('John Doe', 'john@example.com', 'Volunteer', 'I would like to volunteer for events.')
store_contribution('Jane Smith', 'jane@example.com', 'Write Article', 'I want to write an article on gender equality.')

# You can add similar functions and store data from other sections