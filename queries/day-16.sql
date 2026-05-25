use sql_challenge;

--1. total salary per employee
select e.emp_id, e.emp_name, sum(s.salary) as total_salary
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id
group by e.emp_id, e.emp_name;

--2. average salary per employee
select e.emp_id, e.emp_name, avg(s.salary) as average_salary
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id
group by e.emp_id, e.emp_name;

--3. count of salary records per employee
select e.emp_id, e.emp_name, count(s.salary) as salary_record_count 
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id
group by e.emp_id, e.emp_name;

--4. max salary per employee
select e.emp_id, e.emp_name, max(s.salary) as max_salary
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id  
group by e.emp_id, e.emp_name;