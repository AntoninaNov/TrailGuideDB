# PA2 - Database Schema Enhancements and Advanced Queries

This folder extends the initial database setup with schema enhancements to accommodate many-to-many relationships and introduces complex SQL queries for deep data analysis.

## Table of Contents
- [Introduction](#introduction)
- [Folder Structure](#folder-structure)
- [Requirements](#requirements)
- [Files Description](#files-description)
  - [schema_updates.sql](#schema_updates.sql)
  - [queries.sql](#queriessql)
  - [bonus.sql](#bonussql)
  - [bonus.py](#bonuspy)
- [Setup Instructions](#setup-instructions)
- [How to Run the Scripts](#how-to-run-the-scripts)
- [Expected Results](#expected-results)
- [Author](#author)
- [Support](#support)

## Introduction
The PA2 folder introduces schema updates to support many-to-many relationships, particularly between trails and difficulties, and updates data interaction capabilities with new analytical queries.

## Folder Structure
- `schema_updates.sql`: Updates to the database schema.
- `queries.sql`: Advanced SQL queries for data analysis.
- `bonus.sql`: Indexes creation.
- `bonus.py`: Python script for generating random trail data.

## Requirements
- MySQL Server (Version 5.7 or newer)
- A SQL client such as MySQL Workbench or phpMyAdmin
- Python environment (for bonus.py), with `mysql-connector-python` installed

## Files Description

### `schema_updates.sql`
- **Purpose:** Updates and enhances the database schema to include new tables and relationships, particularly to support many-to-many interactions between trails and difficulties.
- **Key Updates:**
  - Addition of `trail_difficulty` table to link trails and difficulties.
  - Updates to the `ratings` table to include difficulty identification.

### `queries.sql`
- **Purpose:** Provides advanced SQL queries for analyzing trail data, focusing on user interactions and difficulty assessments.
- **Queries Include:**
  - Analysis of trails by user preference and completion status.
  - Finding all users who completed trails of specific difficulties.

### `bonus.sql`
- **Purpose:** Demonstrates the creation and impact of database indexes on query performance.
- **Functionality:**
  - **Profiling Setup:** Enables profiling to monitor and compare query performance metrics.
  - **Table Cloning:** Creates a `trails_clone1` table from `trails_clone` to test indexing effects without affecting original data.
  - **Indexing:** Implements an index on the `name` column and compares query execution times before and after the index is applied.
  - **Performance Analysis:** Uses MySQL's profiling feature to display detailed performance data, helping to understand the benefit of indexing.

### `bonus.py`
- **Purpose:** Python script to insert randomized data into the database, useful for testing scalability and performance.
- **Functionality:**
  - Generates and inserts random trail data.
  - Configurable for different amounts of data insertion.

## Setup Instructions
1. **Install MySQL and Python:** Ensure both MySQL Server and Python are installed on your machine.
2. **Set Up Environment:** For the Python script, ensure `mysql-connector-python` is installed using `pip install mysql-connector-python`.

## How to Run the Scripts
1. **Update Schema:** Run `schema_updates.sql` in your SQL client to apply the latest schema changes.
2. **Execute SQL Queries:** Use `queries.sql` to perform advanced data analysis.
3. **Run Python Script:** Execute `bonus.py` to generate and insert random data into your database.
4. **Execute the SQL Script:** Run the `bonus.sql` in your SQL client.
2. **View Profiling Data:** After running the queries, review the profiling output to see the performance impact of indexing.

## Expected Results
- **Schema Updates:** Enhanced database schema ready for complex data interactions.
- **Data Analysis:** Deeper insights into how trails are used and reviewed by users.
- **Data Generation:** Randomized data populated for testing and performance analysis.

## Author
- **Antonina Novak**
- Contact: anovak@kse.org.ua
- GitHub: [AntoninaNov](https://github.com/AntoninaNov)
- LinkedIn: [Antonina Novak](https://www.linkedin.com/in/antonina-novak/)

## Support
For any issues or queries regarding the setup or execution of scripts in the PA2 folder, please reach out via the provided contact details or raise an issue on the GitHub repository.

