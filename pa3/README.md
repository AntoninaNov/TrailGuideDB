# PA3 - Advanced Subqueries and Application Interactions

Explore the powerful use of SQL subqueries and application-based database interactions in the PA3 folder of the TrailDBOperations project.

## Table of Contents
- [Introduction](#introduction)
- [Folder Structure](#folder-structure)
- [Requirements](#requirements)
- [Files Description](#files-description)
  - [subqueries.sql](#subqueriessql)
  - [bonus.py](#bonuspy)
- [Setup Instructions](#setup-instructions)
- [How to Run the Scripts](#how-to-run-the-scripts)
- [Expected Results](#expected-results)
- [Screenshots](#screenshots)
- [Author](#author)
- [Support](#support)

## Introduction
This folder contains SQL scripts focused on advanced subquery techniques and a Python script for performing CRUD operations, illustrating how applications can interact with databases effectively.

## Folder Structure
- `subqueries.sql`: Contains advanced SQL subqueries for various data manipulations.
- `bonus.py`: A Python script demonstrating basic CRUD operations against the database.

## Requirements
- MySQL Server (Version 5.7 or newer)
- A SQL client such as MySQL Workbench or phpMyAdmin
- Python environment for running `bonus.py`, with `pymysql` library installed.

## Files Description

### `subqueries.sql`
- **Purpose:** This script utilizes various forms of subqueries to perform complex data manipulations including updates, deletions, and sophisticated selects.
- **Features:**
  - Non-correlated and correlated subqueries for selective data updates and deletions.
  - Use of `EXISTS` and `NOT EXISTS` to conditionally manipulate data based on other data existence.
  - Set operations to compare and contrast data between different sets.

### `bonus.py`
- **Purpose:** Demonstrates how to connect to and interact with the MySQL database using Python to perform CRUD operations.
- **Functionality:**
  - Create, Read, Update, and Delete operations within a Python environment.
  - Connection management and error handling best practices.

## Setup Instructions
1. **Database and Python Setup:** Ensure MySQL Server is installed and Python is set up with the `pymysql` library (`pip install pymysql`).
2. **Database Connection:** Configure the database connection parameters within `bonus.py` to match your environment.

## How to Run the Scripts
1. **Execute SQL Subqueries:** Run the `subqueries.sql` in your SQL client to explore the effects of various subquery strategies.
2. **Run Python Script:** Execute `bonus.py` from your Python environment to see CRUD operations in action.

## Expected Results
- **Subqueries Execution:** You'll witness complex data manipulation across multiple tables, showcasing the power of SQL subqueries.
- **Python CRUD Operations:** The script will create, read, update, and delete trail data, demonstrating real-time database interaction.

## Screenshots
- Add screenshots of the execution results from both SQL and Python scripts to validate and visualize the operations.

## Author
- **Antonina Novak**
- Contact: anovak@kse.org.ua
- GitHub: [AntoninaNov](https://github.com/AntoninaNov)
- LinkedIn: [Antonina Novak](https://www.linkedin.com/in/antonina-novak/)

## Support
For any issues or queries about the setups or scripts in the PA3 folder, feel free to reach out via the provided contact details or create an issue on the GitHub repository.
