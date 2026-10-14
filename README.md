# SQL-DATA-WAREHOUSE-PROJECT

A SQL Server-based data warehousing project focused on data integration, ETL processes, data modelling, and analytical reporting.

## Project Overview

This project demonstrates the development of a data warehouse using Microsoft SQL Server. It brings concepts to organize data into a structured format that supports querying, analysis, and informed decision-making.

The repository includes datasets, project documentation, SQL scripts, and tests used throughout the project.

## Project Objectives

- Build a structured data warehouse using SQL Server.
- Organize data for efficient querying and analysis.
- Implement ETL (Extract, Transform, Load) processes.
- Apply data modelling concepts to structure analytical data.
- Write SQL queries to explore data and generate useful insights.
- Follow a structured and maintainable project organization.

## Data Warehouse Architecture
<img src="doc/Data Architecture.jpg" width=800 height=500>
The project follows a Medallion Architecture with three layers:

- **Bronze Layer:** Stores raw data from source systems.
- **Silver Layer:** Cleans, standardizes, and transforms data.
- **Gold Layer:** Organizes processed data into business-ready
  fact and dimension views.
  
## Tools & Technologies

- Database: Microsoft SQL Server
- Query Language: SQL
- Core Concepts: Data warehousing, data transformation, data modelling, ETL process and analytics

## Project Components

<b>1. Datasets</b>

Contains the data files used as inputs for the project.

<b>2. Documentation</b>

The "doc" folder contains project-related documentation.

<b>3. SQL Scripts</b>

The "scripts" folder contains SQL scripts associated with the data warehouse implementation and related operations.

<b>4. Tests</b>

The "tests" folder contains project test files used to support validation and quality checks.

## Workflow

The project follows the general workflow of a data warehouse :

1. Data Sources: Work with the datasets provided for the project.
2. Data Processing: Extract and transform data using SQL-based processes.
3. Data Warehousing: Organize the processed data within a structured warehouse.
4. Data Modelling: Structure data to support analytical queries.
5. Analysis: Use SQL queries to explore data and derive insights.

## Key Learning Outcomes

Through this project, I developed practical experience with:

- SQL Server and SQL query writing
- Data warehouse concepts and structure
- ETL workflow fundamentals
- Data transformation and organization
- Data modelling for analytics
- Project documentation 

## Project Structure

The repository is organized into the following directories and files:

- datasets/ – Contains the source datasets used in the data warehouse project.
- doc/ – Intended for project documentation, including architecture and design details. Documentation has not been added to this folder yet.
- scripts/ – Contains SQL scripts used to implement the data warehouse and perform data processing.
- tests/ – Intended for testing and validating SQL scripts and data quality.
- LICENSE – Specifies the licensing terms for the project.
- README.md – Provides an overview of the project, its objectives, technologies, and instructions for getting started.


## To explore the project:

1. Review the files in "datasets" and "doc".
2. Open the SQL scripts in "scripts".
3. Use Microsoft SQL Server and an appropriate SQL development environment to inspect and execute the scripts, after configuring the required database and data paths.
4. Review the "tests/" folder for available validation or test scripts.

 ## About This Project

This project is part of my practical learning journey in SQL, data warehousing, and data analytics. It demonstrates my interest in building structured data solutions and strengthening my technical skills through hands-on projects.

 ## Related Project

This data warehouse project is connected to my SQL Data Analytics and Power BI dashboard project - SalesScope Analytics, which focuses on analyzing sales performance, customer behaviour, and product performance through interactive dashboards.

 SalesScope Analytics – [View Repository](https://github.com/bhumika-madaan/SaleScope_Analytics)
