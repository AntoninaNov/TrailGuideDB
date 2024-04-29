# PA4 Folder - Stored Procedures and Transaction Management

Delve into the use of SQL stored procedures, transaction management, and error handling with the PA4 folder of the TrailDBOperations project.

## Table of Contents
- [Introduction](#introduction)
- [Folder Structure](#folder-structure)
- [Requirements](#requirements)
- [Files Description](#files-description)
  - [procedures.sql](#proceduressql)
  - [executions.sql](#executionssql)
- [Setup Instructions](#setup-instructions)
- [How to Run the Scripts](#how-to-run-the-scripts)
- [Expected Results](#expected-results)
- [Author](#author)
- [Support](#support)

## Introduction
This folder includes SQL scripts focused on creating and executing stored procedures that integrate complex parameter handling, transaction management, and conditional logic to ensure data integrity and procedural functionality.

## Folder Structure
- `procedures.sql`: Contains the definitions of stored procedures with various parameter types and transaction controls.
- `executions.sql`: Demonstrates the execution of these procedures and their effects on data management.

## Requirements
- MySQL Server (Version 5.7 or newer)
- A SQL client such as MySQL Workbench or phpMyAdmin capable of handling stored procedures and transactions.

## Files Description

### `procedures.sql`
- **Purpose:** Defines several stored procedures showcasing the use of IN, OUT, and INOUT parameters along with transactional control mechanisms to handle different data manipulation scenarios effectively.
- **Key Procedures:**
  - `proc_calculate_difficulty_stats`: Calculates the number of trails for a given difficulty.
  - `proc_update_trail_length`: Safely updates trail lengths using a temporary table.
  - `proc_manage_review`: Manages review submissions with transactional logic based on content length.

### `executions.sql`
- **Purpose:** Executes the stored procedures defined in `procedures.sql` and illustrates their real-world application in managing database transactions.
- **Features:**
  - Safe updates of trail lengths.
  - Conditional commits in review management based on review content length.

## Setup Instructions
1. **Database Preparation:** Ensure MySQL Server is installed and the database is accessible.
2. **Procedure Deployment:** Execute `procedures.sql` to deploy the stored procedures into your database.

## How to Run the Scripts
1. **Execute Stored Procedures:** Use `executions.sql` in your SQL client. This script will run the procedures and provide output that demonstrates the procedures’ effects and transaction outcomes.

## Expected Results
- **Stored Procedures Execution:** You'll observe the implementation of advanced SQL techniques, including parameter passing and transaction control within stored procedures.
- **Transactional Management:** Successful demonstration of conditional logic affecting transaction outcomes, providing a robust mechanism for error handling and data integrity.

## Author
- **Antonina Novak**
- Contact: anovak@kse.org.ua
- GitHub: [AntoninaNov](https://github.com/AntoninaNov)
- LinkedIn: [Antonina Novak](https://www.linkedin.com/in/antonina-novak/)

## Support
For any issues or queries about the setups or scripts in the PA4 folder, feel free to reach out via the provided contact details or create an issue on the GitHub repository.
