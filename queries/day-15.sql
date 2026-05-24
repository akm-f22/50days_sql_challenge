use sql_challenge;

--1. employees who have salary record, they have got paid atleast once
select e.emp_id, e.emp_name
from cleaned_employees e
where exists (select 1 from cleaned_salaries s where s.emp_id = e.emp_id);


--2. employees who have no salary record, they have never got paid
select e.emp_id, e.emp_name
from cleaned_employees e
where not exists (select 1 from cleaned_salaries s where s.emp_id = e.emp_id);

--3. employees with attendance
select e.emp_id, e.emp_name
from cleaned_employees e
where exists (select 1 from cleaned_attendance a where a.emp_id = e.emp_id);

--4. employees without attendance
select e.emp_id, e.emp_name
from cleaned_employees e
where not exists (select 1 from cleaned_attendance a where a.emp_id = e.emp_id);