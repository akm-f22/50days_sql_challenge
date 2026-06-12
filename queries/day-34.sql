use sql_challenge;

--1. create index on emp_id
create index idx_emp_id 
on cleaned_employees(emp_id);

--2. create index on dept_id
create index idx_dept_id
on cleaned_employees(dept_id);

--3. composite index(emp_id, salary_date)
create index idx_emp_salary_date
on cleaned_salaries(emp_id, salary_date);

select * from cleaned_salaries where emp_id = 110 and salary_date = '2024-01-01';