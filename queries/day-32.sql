use sql_challenge;

--1.Create employee view to store reusable employee details
CREATE VIEW emp_view AS
SELECT emp_id, emp_name, dept_id, city
FROM cleaned_employees;

select * 
from emp_view
where city = 'Mumbai';

--2. Create salary view to store salary-related data
CREATE VIEW salary_view AS
SELECT emp_id, salary, salary_date
FROM cleaned_salaries;

select *
from salary_view
where emp_id =444;

--3. Create joined view combining employee and salary details
CREATE VIEW emp_salary_view AS
SELECT e.emp_id, e.emp_name, e.dept_id, s.salary, s.salary_date
FROM emp_view e
JOIN salary_view s ON e.emp_id = s.emp_id;

--4.Use above view to find employees with salary greater than 50000
SELECT *
FROM emp_salary_view
WHERE salary > 50000;