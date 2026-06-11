use sql_challenge;

--1. update employee data using view
create view emp_basic AS
select emp_id, emp_name, city
from cleaned_employees;

select * FROM emp_basic
where emp_id = 110;

update emp_basic
set city = 'Mumbai'
where emp_id = 110;

--2. create view for high salary employees (salary> 50000)
create view high_salary AS
select emp_id, salary
from cleaned_salaries
where salary > 50000;

select * FROM high_salary;

--3. multi table view (combine emloyee data, department data and salary data)
create view emp_dept_salary AS
select e.emp_id, e.emp_name, d.dept_name, s.salary
from cleaned_employees e
join cleaned_departments d on e.dept_id = d.dept_id
join cleaned_salaries s on e.emp_id = s.emp_id;

select * FROM emp_dept_salary
where salary > 50000;

--4. hr wants high salary employees with dept name - create view HR DASHBOARD 
create view hr_dashboard AS
select e.emp_id, e.emp_name, d.dept_name, s.salary
from cleaned_employees e
join cleaned_departments d on e.dept_id = d.dept_id
join cleaned_salaries s on e.emp_id = s.emp_id
where s.salary > 50000;

select * FROM hr_dashboard;