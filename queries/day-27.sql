use sql_challenge;

--1. compare each employees salary with overall average salary(if salary < overall average salary then 'Below Average', if salary > overall average salary then 'Above Average' else 'Average')
SELECT emp_id, salary,
       AVG(salary) OVER () AS overall_avg_salary,
       CASE
       when salary > AVG(salary) OVER () then 'Above Average'
       when salary < AVG(salary) OVER () then 'Below Average'
       else 'Equal' end as salary_comparison
FROM cleaned_salaries;

--2. compare employee salary with total salary of all employees(sum of salary * 10% high contributor else low contributor)
SELECT emp_id, salary,
       SUM(salary) OVER () AS total_salary,
       CASE
       when salary > SUM(salary) OVER () * 0.1 then 'High Contributor'
       else 'Low Contributor' end as contribution
FROM cleaned_salaries;

--3. compare department total salary with overall total(dept total salary > 10%  high expense dept else low expense dept)
WITH dept_salary AS 
(
    SELECT dept_id, SUM(s.salary) AS dept_total_salary
    FROM cleaned_employees e
    JOIN cleaned_salaries s ON e.emp_id = s.emp_id
    GROUP BY dept_id
)

SELECT dept_id, dept_total_salary,
       SUM(dept_total_salary) OVER () AS overall_total_salary,
       CASE
           WHEN dept_total_salary > SUM(dept_total_salary) OVER () * 0.1
           THEN 'High Expense Dept'
           ELSE 'Low Expense Dept'
       END AS dept_expense_category
FROM dept_salary;