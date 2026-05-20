use sql_challenge;

--1. what is the employees name, department, performance ratings
SELECT e.emp_name, d.dept_name, p.rating_2022, p.rating_2023,p.rating_2024
from cleaned_employees e
JOIN cleaned_departments d ON e.dept_id = d.dept_id
JOIN cleaned_performance p ON e.emp_id = p.emp_id;

--2. what is the complete profile of each employee,(dept, salary,performance)
SELECT e.emp_name, d.dept_name, s.salary, p.rating_2022, p.rating_2023, p.rating_2024
FROM cleaned_employees e
LEFT JOIN cleaned_departments d ON e.dept_id = d.dept_id
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
LEFT JOIN cleaned_performance p ON e.emp_id = p.emp_id;

--3. How many salary records does  each employee have?
SELECT e.emp_name, e.emp_id,COUNT(s.salary_id) AS salary_records
FROM cleaned_employees e
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;

--4. what is the total salary of each employee?
SELECT e.emp_name, e.emp_id, SUM(s.salary) AS total_salary
FROM cleaned_employees e
LEFT JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;
