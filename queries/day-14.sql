use sql_challenge;

--1. List employees earning more than the department average salary
select e.emp_id, e.emp_name, s.salary, d.dept_id
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where s.salary > (select avg(salary) from cleaned_salaries s2
                  join cleaned_employees e2 on s2.emp_id = e2.emp_id
                  where e2.dept_id = e.dept_id);


--2. List employees whose salary is equal to the highest salary in their department
select e.emp_id, e.emp_name, s.salary, d.dept_id
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where s.salary = (select max(salary) from cleaned_salaries s2
                   join cleaned_employees e2 on s2.emp_id = e2.emp_id
                   where e2.dept_id = e.dept_id);



--3. List all employees whose salary is equal to the lowest salary in their department
select e.emp_id, e.emp_name, s.salary, d.dept_id
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where s.salary = (select min(salary) from cleaned_salaries s2
                   join cleaned_employees e2 on s2.emp_id = e2.emp_id
                   where e2.dept_id = e.dept_id);