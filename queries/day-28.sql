use sql_challenge;

--1. find top 2 employees per department(top 2 highest paid emp in each dept)
WITH ranked_employees AS (
    SELECT e.emp_id, e.dept_id, s.salary,
           DENSE_RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS salary_rank
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
)
SELECT emp_id, dept_id, salary, salary_rank
FROM ranked_employees
WHERE salary_rank <= 2;

--2. salary gap(difference between current salary and previous salary)
SELECT emp_id, salary,salary_date,
       LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS previous_salary,
       salary - LAG(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS salary_gap
FROM cleaned_salaries;

--3. performance gap(change in performance between years)
SELECT emp_id, rating_2022, rating_2023, rating_2024,gap_2022_2023, gap_2023_2024
FROM (
    SELECT emp_id, rating_2022, rating_2023, rating_2024,
           rating_2023 - rating_2022 AS gap_2022_2023,
           rating_2024 - rating_2023 AS gap_2023_2024
    FROM cleaned_performance
) AS performance_gaps;
       
--4.rank filtering(top performers as per salary) 
WITH ranked_employees AS (
    SELECT e.emp_id, e.dept_id, s.salary,
           DENSE_RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS salary_rank
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
)
SELECT emp_id, dept_id, salary, salary_rank
FROM ranked_employees
WHERE salary_rank = 1;