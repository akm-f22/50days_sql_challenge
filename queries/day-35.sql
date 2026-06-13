use sql_challenge;

--1.analyse our query before index
explain analyze
select e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

-- apply index
create index idx_emp_emp on cleaned_employees(emp_id);
create index idx_emp_sal on cleaned_salaries(emp_id);

--after applying index 
explain analyze
select e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

--2. composite index 
-- (a)before composite index emp_id = 101, salary_date = '2024-01-01'
explain analyze
select * 
from cleaned_salaries 
where emp_id = 101 and salary_date = '2024-01-01';

-- create composite index
create index idx_composite on cleaned_salaries(emp_id, salary_date);

-- check after index
explain analyze
select * 
from cleaned_salaries 
where emp_id = 101 and salary_date = '2024-01-01';


--3. emp_id=101
explain analyze
select *
from cleaned_salaries
where emp_id = 101;

-- apply index, analyze
create index idx_emp_id on cleaned_salaries(emp_id);

explain analyze
select *
from cleaned_salaries
where emp_id = 101;
