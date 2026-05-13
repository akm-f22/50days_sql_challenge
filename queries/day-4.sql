use sql_challenge;

-- Remove duplicate records from cleaned_employees
with cte as (
select *, row_number() over(partition by emp_id, emp_name, city
order by emp_id) as rn
from cleaned_employees
)

delete from cleaned_employees
where emp_id in 
(select emp_id from cte where rn > 1);

-- Remove duplicate records from cleaned_salaries
with cte as (
select *, row_number() over(partition by emp_id, salary_id
order by salary_id) as rn
from cleaned_salaries
)

delete from cleaned_salaries
where salary_id in 
(select salary_id from cte where rn > 1);

-- Remove duplicate records from cleaned_performance
with cte as (
select *, row_number() over(partition by emp_id
order by emp_id) as rn
from cleaned_performance
)

delete from cleaned_performance
where emp_id in 
(select emp_id from cte where rn > 1);

-- identifying text inconsistencies 
select DISTINCT city from cleaned_employees;

select DISTINCT dept_name from cleaned_departments;

update cleaned_employees
set city = concat(UPPER(LEFT(trim(city), 1)), 
LOWER(SUBSTRING(trim(city), 2)));

update cleaned_employees
set city = case 
when city in ('Dlhi','Delhi ncr', 'New Delhi') then 'Delhi'
when city in ('Hydbd', 'Hydrabad') then 'Hyderabad'
when city in ('Bangalore') then 'Bengaluru'
else city end;
