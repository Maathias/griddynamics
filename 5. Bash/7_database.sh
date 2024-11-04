# Create Database:
#   Implement a function to create a new database.
#   Accept the database name as a command-line argument.
#   Create a file for the database with the given name (e.g., example_db.txt).
#
# Create Table:
#   Implement a function to create a table within the database.
#   Accept the table name and fields as command-line arguments.
#   Ensure the table adheres to the specified format.
#
# Select Data:
#   Implement a function to select and display data from the table.
#   Ensure proper formatting and adhere to the specified row length.
#
# Delete Data:
#   Implement a function to delete data from the table.
#   Accept criteria for deletion as command-line arguments.
#
# Insert Data:
#   Implement a function to insert data into the table.
#   Accept data values as command-line arguments.
#   Ensure proper formatting and adherence to the specified row length.
#
# Database Structure:
#   Ensure the database file adheres to the specified structure: Maximum line length of 39 characters.
#   One row length of 8 characters (including spaces, excluding stars).
#   Two stars at the start and end of each row.
#   One space before text starts.
#
# Error Handling:
#   Implement error handling for cases such as invalid commands, missing arguments, etc.
#   Provide meaningful error messages for better user understanding.
#
# Testing:
#   Test the database service with various scenarios to ensure its functionality and reliability.
#
# Documentation:
#   Document the usage of each function and the overall structure of the database service.
#
# Code Organization:
#   Organize the code in a modular and readable manner.
#
# Examples of task execution:
#   # Create a new database
#   ./database.sh create_db example_db
#
#   # Create a table in the database
#   ./database.sh create_table example_db persons id name height age
#
#   # Insert data into the table
#
#   ./database.sh insert_data example_db persons 0 Igor 180 36
#   ./database.sh insert_data example_db persons 1 Pyotr 178 25
#
#   # Select and display data
#   ./database.sh select_data example_db persons
#
#   # Delete data from the table
#   ./database.sh delete_data example_db persons "id=1"
#
