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

## Day 5: Data Cleaning (Handling Invalid Values)
## Objective
Identify and fix logically incorrect or invalid values in the dataset.
## Tasks Completed
Detected invalid values (negative salary, invalid age, incorrect ratings)
Applied business rules to define valid ranges
Replaced incorrect values using client-provided data
Used CASE WHEN and JOIN-based updates for corrections
Ensured no assumption-based fixes were applied
## Key Learning
Invalid values are not always missing but logically incorrect
Data should be corrected using trusted sources (client/system)
Never blindly manipulate values without business context
## Outcome
Dataset now contains only valid and reliable values, improving data accuracy.
- Data should not be cleaned directly in raw tables
- Business rules are important while filling missing values

## Day 6: Data Cleaning (Outlier Detection & Handling)
## Objective
Identify and handle extreme values (outliers) in the dataset.
## Tasks Completed
Detected outliers using business thresholds (e.g., salary range)
Flagged outliers using a new column (is_outlier)
Differentiated between valid and invalid outliers
Replaced incorrect outliers using client-provided data
Preserved valid extreme values (e.g., CEO salary)
## Key Learning
Not all outliers are errors — some are meaningful
Outliers should be analyzed, not blindly removed
Business understanding is essential in decision-making
## Outcome
Outliers are properly identified and handled, ensuring both accuracy and meaningful insights.

## Day 7: Data Cleaning
## Objective: Date format fixing
Identified inconsistent date formats in multiple columns (salary_date, attendance_date, hire_date)
## Tasks Completed
Detected invalid values (e.g., wrong month, incomplete year, incorrect patterns)
Replaced incorrect dates with NULL to avoid misleading data
Standardized all valid dates into a uniform format (YYYY-MM-DD)
Ensured consistency across all date-related columns

## Day 8: Data Cleaning
## Objective
Identified leading and trailing spaces in emp_name column
## Task Completed
Removed unwanted spaces using TRIM() to ensure consistency
Checked data types across all tables (employees, departments, salary, performance, attendance)
Detected incorrect data types affecting joins and analysis
Converted columns to appropriate data types (INT, VARCHAR, DATE, DECIMAL)
Ensured uniform structure across all tables for accurate querying

## Day 9: SQL Tasks
## Queries
• Show only employees who have a valid department
• Show all employees (even without department)
• Find employees without department
• Find who earns how much
• List employees without salary

## Day 10: SQL Tasks
## Queries
• What are the performance ratings of each employee?
• Which employees do not have any salary records?
• Which employees do not have any attendance records?
• What is the employee name, department, and salary together?

## Day 11: SQL Tasks
## Queries
• What is the employee name, department, and performance ratings?
• What is the complete profile of each employee (department, salary, performance)?
• How many salary records does each employee have?
• What is the total salary paid to each employee?

## Day 12: SQL Tasks
## Queries
• What is the average salary in each department?
• How many days was each employee present at work?
• List of employees belonging to the same department
• Which employee has more than one salary record?

## Day 13: SQL Tasks
## Queries
• List employees earning more than average salary
• List employees with maximum salary
• List employees earning less than average salary
• List employees with minimum salary

## Day 14: SQL Tasks (Department-Level Analysis)
## Queries
• List employees earning more than the department average salary
• List employees whose salary is equal to the highest salary in their department
• List all employees whose salary is equal to the lowest salary in their department

## Day 15: SQL Tasks (EXISTS / NOT EXISTS)
## Queries
• List employees with salary records (at least once)
• List employees without salary records
• List employees with attendance records
• List employees without attendance records
