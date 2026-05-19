use sql_challenge;

-- 1. performance rating of each employee
select e.emp_id, e.emp_name, p.rating_2022, p.rating_2023, p.rating_2024
from cleaned_employees e
join performance p on e.emp_id = p.emp_id;

--2. which employees do not have salary record
select e.emp_id, e.emp_name
from cleaned_employees e
left join cleaned_salaries s on e.emp_id = s.emp_id
where s.emp_id is null;

--3. which employees do not have attendance record
select e.emp_id, e.emp_name
from cleaned_employees e
left join cleaned_attendance a on e.emp_id = a.emp_id
where a.emp_id is null;

--4. what is the employee name, department and salary together
select e.emp_id, e.emp_name, d.dept_name, s.salary
from cleaned_employees e
left join cleaned_departments d on e.dept_id = d.dept_id
left join cleaned_salaries s on e.emp_id = s.emp_id;