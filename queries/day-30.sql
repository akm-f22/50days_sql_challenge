use sql_challenge;

--1. create a temp table of salaries and use it.
WITH salary_cte AS
(
    SELECT emp_id, salary
    FROM cleaned_salaries
)
select * from salary_cte
where emp_id =62;



--2. combine employees and salaries table using cte.
WITH emp_salary AS 
(
    SELECT e.emp_id, e.dept_id, s.salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
)
select * from emp_salary
where dept_id = 3;



--3.calculate department average salary using cte.
WITH dept_avg AS
(
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    GROUP BY dept_id
)
SELECT * FROM dept_avg;



--4. find the employees earning more than department average using cte.
WITH dept_avg AS
(
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    GROUP BY dept_id
),
emp_with_avg AS
(
    SELECT e.emp_id, e.dept_id, s.salary, d.avg_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    JOIN dept_avg d ON e.dept_id = d.dept_id
)
SELECT * FROM emp_with_avg
WHERE salary > avg_salary;