## Day 1: Project Setup
### Objective
Set up the SQL project environment and prepare the dataset for analysis.
### Tasks Completed
- Created project folder structure (dataset, SQL_QUERIES, screenshots)
- Set up SQL database (hr_project)
- Created tables for HR dataset
- Imported messy dataset into database
### Tools Used
- MySQL 
- VS Code
- GitHub
### Outcome
Successfully completed project setup. Ready to start data cleaning and analysis from Day 2.



## Day 2: Data Audit (Messiness Detection)
### Objective
Identify data issues across all tables and columns.
### Tasks Completed
Created cleaned tables
Identified NULL and empty values
### Outcome
Understood that data cleaning is required across the entire system before analysis.



## Day 3: Data Cleaning (Handling Missing Values)
### Objective
Clean the dataset by handling missing values across multiple tables.
### Tasks Completed
- Created cleaned versions of tables (cleaned_employees, cleaned_departments, cleaned_performance)
- Converted empty values into NULL for consistency
- Replaced NULL and empty values with appropriate defaults
### Key Learning
- NULL and empty values are different but both need to be handled
### Outcome
Dataset is now more structured and ready for further cleaning and analysis.



## Day 4: Data Cleaning (Handling Inconsistent Text)
## Objective
Clean the dataset by fixing inconsistent text values across columns.
## Tasks Completed
Identified inconsistent text formats (e.g., dlhi, New delhi, Delhi ncr)
Standardized text using functions like UPPER(), LOWER(), INITCAP()
Trimmed extra spaces using TRIM()
Replaced incorrect spellings and variations
Ensured uniform naming conventions across tables
## Key Learning
Text inconsistency affects grouping and analysis
Same values with different formats behave as different data
Standardization is critical before applying aggregations
## Outcome
Text data is now consistent, making grouping, filtering, and analysis accurate.
- Data should not be cleaned directly in raw tables
- Business rules are important while filling missing values
