use sql_challenge;

--1. List the employees who are earning more than average salary
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
where salary > (select avg(salary) from cleaned_salaries);

--2. List of employees equal to max salary
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
where salary = (select max(salary) from cleaned_salaries);

--3. List of employees who are earning less than average salary
select e.emp_id, e.emp_name, s.salary  
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
where salary < (select avg(salary) from cleaned_salaries);

--4. List of employees with min salary
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
where salary = (select min(salary) from cleaned_salaries);