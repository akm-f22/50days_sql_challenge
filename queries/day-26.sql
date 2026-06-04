use sql_challenge;

--1. find rank of employees within each department based on salary
SELECT e.emp_id, e.dept_id, s.salary,
       DENSE_RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS dept_rank
FROM cleaned_employees e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id;

--2.compare each employees salary with their department average salary
SELECT e.emp_id, e.dept_id, s.salary,
       AVG(s.salary) OVER (PARTITION BY e.dept_id) AS dept_avg_salary,
       CASE
       when s.salary > AVG(s.salary) OVER (PARTITION BY e.dept_id) then 'Above Average'
       when s.salary < AVG(s.salary) OVER (PARTITION BY e.dept_id) then 'Below Average'
       else 'Average' end as salary_comparison
FROM cleaned_employees e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id;

--3. top 3 highest paid employees in each department
select * from (
SELECT e.emp_id, e.dept_id, s.salary,
       RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary DESC) AS dept_salary_rank
FROM cleaned_employees e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id) ranked_salaries
WHERE dept_salary_rank <= 3;

--4. lowest salary employee in each department
select * from (
SELECT e.emp_id, e.dept_id, s.salary,
       RANK() OVER (PARTITION BY e.dept_id ORDER BY s.salary ASC) AS dept_salary_rank
FROM cleaned_employees e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id) ranked_salaries
WHERE dept_salary_rank = 1;