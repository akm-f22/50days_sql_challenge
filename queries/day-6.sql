use sql_challenge;

alter table cleaned_salaries
modify salary int;

-- basic understanding

SELECT 
min(salary) as min_salary,
max(salary) as max_salary,
avg(salary) as avg_salary
FROM cleaned_salaries
WHERE salary > 0;

-- client rules for salary max - 200000 and min - 20000
alter table cleaned_salaries
add column is_outlier int;

update cleaned_salaries
set is_outlier =
case when salary < 20000 or salary > 200000 
then 1
else 0
end;


select * from cleaned_salaries
WHERE is_outlier = 1;

update cleaned_salaries
set salary =
case 
when emp_id = 35 then 65000
when emp_id = 262 then 97000
else salary
end
WHERE is_outlier = 1;


update cleaned_salaries
set is_outlier =
case when salary < 20000 or salary > 200000 
then 1
else 0
end;