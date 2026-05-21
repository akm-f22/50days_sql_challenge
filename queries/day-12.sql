use sql_challenge;

--1. average salary in each department
SELECT d.dept_name, AVG(salary) AS average_salary
from cleaned_departments d
JOIN cleaned_employees e ON e.dept_id = d.dept_id
join cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

--2. how many days was each employee present
select e.emp_id, e.emp_name, count(*) as days_present
from cleaned_employees e
join cleaned_attendance a on e.emp_id = a.emp_id
where a.status = 'present'
GROUP BY e.emp_id, e.emp_name;

--3. which employee belonging to the same department
select dept_id, group_concat(emp_name) as employees
from cleaned_employees e
GROUP BY dept_id
having count(*) > 1;

--4. which employee has more than one salary record
select e.emp_id, e.emp_name, count(salary_id) as salary_records
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
having count(salary_id) > 1;

