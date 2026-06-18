use sql_challenge;

--1. create temporary table for employee salary summary
CREATE TEMPORARY TABLE temp_salary_summary 
(
    emp_id INT,
    total_salary INT
);

--2.insert data into temporary table
INSERT INTO temp_salary_summary (emp_id, total_salary)
SELECT emp_id, SUM(salary) AS total_salary
FROM cleaned_salaries
GROUP BY emp_id;

select * FROM temp_salary_summary;

--3. join the temp table with employee table
SELECT e.emp_id, e.emp_name, t.total_salary
from cleaned_employees e
JOIN temp_salary_summary t ON e.emp_id = t.emp_id;

--4. drop the temporary table
DROP TEMPORARY TABLE temp_salary_summary;