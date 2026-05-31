use sql_challenge;

--1. department average salary(show each employee with average salary of their department)
select e.emp_id, e.dept_id, s.salary,
avg(s.salary) over (Partition by e.dept_id) as dept_avg_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

--2. total salary of each department(emp_id, dept_id, salary)
select e.emp_id, e.dept_id, s.salary, 
sum(s.salary) over (Partition by e.dept_id) as total_dept_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.dept_id, s.salary;

--3. average performance of each department(emp_id,dept_id)
select e.emp_id, e.dept_id,
(p.rating_2022+p.rating_2023+p.rating_2024)/3 as avg_rating,
avg((p.rating_2022+p.rating_2023+p.rating_2024)/3) over (Partition by e.dept_id) as dept_avg_rating
from cleaned_employees e
join cleaned_performance p on e.emp_id = p.emp_id
group by e.emp_id, e.dept_id, p.rating_2022, p.rating_2023, p.rating_2024;