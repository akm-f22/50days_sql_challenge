use sql_challenge;

--1. finding employees whose total salary > 100000
WITH total_salary AS
(
    SELECT emp_id, SUM(salary) AS total_salary
    FROM cleaned_salaries
    GROUP BY emp_id
),
high_earners AS
(
    SELECT *
    FROM total_salary
    WHERE total_salary > 100000
)

SELECT * FROM high_earners;

--2. show employees salary along with dept average salary
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
SELECT * FROM emp_with_avg;

--3. find department with highest salary per depatment along with total salry per dept
WITH dept_salary AS
(
    SELECT dept_id, MAX(salary) AS max_salary, SUM(salary) AS total_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    GROUP BY dept_id
)
SELECT * FROM dept_salary;
