# PA1 - Database Initialization and Data Analysis

This folder contains essential SQL scripts to set up your database schema and perform detailed data analysis for trail management.

## Table of Contents
- [Introduction](#introduction)
- [Folder Structure](#folder-structure)
- [Requirements](#requirements)
- [Files Description](#files-description)
  - [schema.sql](#schemasql)
  - [queries.sql](#queriessql)
- [Setup Instructions](#setup-instructions)
- [How to Run the Scripts](#how-to-run-the-scripts)
- [Expected Results](#expected-results)
- [Author](#author)
- [Support](#support)

## Introduction
The PA1 folder includes two primary SQL files: `schema.sql` for setting up the database schema and `queries.sql` for running various analytical queries to understand and manage the trails effectively.

## Folder Structure
Here's what you can find in this folder:
- `schema.sql` - Initializes the database with the required schema.
- `queries.sql` - Contains various SQL queries to retrieve and analyze data.

## Requirements
To use the scripts in this folder, you will need:
- MySQL Server (Version 5.7 or newer)
- A SQL client like MySQL Workbench, phpMyAdmin, or similar
- Basic understanding of SQL and database operations

## Files Description

### `schema.sql`
- **Purpose:** Create all necessary database tables and establish relationships.
- **Tables Created:**
  - `locations`: Where trails are located.
  - `difficulties`: Different levels of trail difficulty.
  - `trails`: Details about each trail.
  - `users`: Information about users.
  - `ratings`: Ratings given by users to trails.
  - `reviews`: Reviews posted by users for trails.
- **Data Insertion:** Sample data for immediate testing and use.

### `queries.sql`
- **Purpose:** Perform detailed data analysis and retrieve useful information.
- **Query Details:**
  - **Top Rated Trails:** Identifies the highest-rated trails based on user feedback.
  - **Detailed Trail Reviews:** Provides comprehensive review details for trails, particularly focusing on 'Hoverla Ascent'.
  - **Trails by Characteristics:** Filters trails by specific physical characteristics such as length and elevation.
  - **Ratings by Difficulty:** Shows the average ratings of trails grouped by their difficulty levels.

## Setup Instructions
1. **Install MySQL Server:** Ensure MySQL Server is installed on your machine. You can download it from the [MySQL official website](https://dev.mysql.com/downloads/mysql/).
2. **Install a SQL Client:** Choose and install a suitable SQL client to run the SQL scripts.

## How to Run the Scripts
1. **Open Your SQL Client:** Launch your SQL client and connect to your MySQL server.
2. **Create a New Database (Optional):** Execute the command `CREATE DATABASE TrailDB;` and then use the database with `USE TrailDB;`.
3. **Execute `schema.sql`:** Open the `schema.sql` file in your SQL client and run it to set up your database schema.
4. **Run `queries.sql`:** After setting up the schema, open and execute the `queries.sql` to analyze the data.

## Expected Results
Running the `schema.sql` will set up your database tables and relationships, ready for use. `queries.sql` will provide insights into the trails' data, such as which trails are most popular and detailed reviews.

## Author
- **Antonina Novak**
- Contact: anovak@kse.org.ua
- GitHub: [AntoninaNov](https://github.com/AntoninaNov)
- LinkedIn: [Antonina Novak](https://www.linkedin.com/in/antonina-novak-462003258/)

## Support
If you encounter any issues or have questions about running these scripts, please feel free to reach out to the development team or consult the project's main documentation. Your feedback and contributions are welcome to improve the project.

