use sql_challenge;

--1. find the latest salary per employee along with total salary till that point
select * FROM
 (
    SELECT emp_id, salary, salary_date,
           ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY salary_date DESC) AS rn,
           SUM(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS total_salary
    FROM cleaned_salaries
) t

WHERE rn = 1;

--2. rank employees based on salary and compare with department average
select * FROM
(
    SELECT e.emp_id, e.dept_id, s.salary,
           RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS salary_rank,
           AVG(s.salary) OVER (PARTITION BY e.dept_id) AS dept_avg_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
) t
WHERE salary_rank <= 10; -- top 10 employees per department based on salary

--3. check if our salary is increased or decreased comparedto previous
SELECT emp_id, salary, salary_date,
       LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS previous_salary,
       CASE 
           WHEN salary > LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) THEN 'Increased'
           WHEN salary < LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) THEN 'Decreased'
           ELSE 'No Change'
       END AS salary_trend
FROM cleaned_salaries;