use sql_challenge;

-- 1. find employees with valid department

select e.emp_id, e.emp_name, d.dept_name
from cleaned_employees e
join cleaned_departments d on e.dept_id = d.dept_id;

--2. find all employees even without valid department
select e.emp_id, e.emp_name, d.dept_name
from cleaned_employees e
left join cleaned_departments d on e.dept_id = d.dept_id;

-- 3. find all employees without department
select e.emp_id, e.emp_name, d.dept_name
from cleaned_employees e
left join cleaned_departments d on e.dept_id = d.dept_id
where d.dept_name is null;

-- 4. list of employees with salary
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
INNER JOIN cleaned_salaries s on e.emp_id = s.emp_id;

-- 5. list of employees where salary is null
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
left join cleaned_salaries s on e.emp_id = s.emp_id
where s.salary is null;