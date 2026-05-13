use sql_challenge;

update cleaned_employees
set emp_name = 'Unknown'
WHERE emp_name is NULL or emp_name = '';

update cleaned_employees
set city = "Delhi"
where emp_id = "13";

update cleaned_employees
set city = "Delhi NCR"
where city is NULL or city = '';

update cleaned_performance
set rating_2023 = 0
WHERE rating_2023 = '';

--find duplicate values
SELECT emp_id,emp_name,city ,COUNT(*)
FROM cleaned_employees
GROUP BY emp_id,emp_name,city
HAVING COUNT(*) > 1;

select dept_id, dept_name, count(*)
from cleaned_departments
GROUP BY dept_id, dept_name
HAVING COUNT(*) > 1;

SELECT emp_id, attendance_id,Count(*)
FROM cleaned_attendance
GROUP BY emp_id, attendance_id
HAVING COUNT(*) > 1;

select emp_id,count(*)
from cleaned_performance
GROUP BY emp_id
HAVING COUNT(*) > 1;

SELECT emp_id, salary_id, Count(*)
FROM cleaned_salaries
GROUP BY emp_id, salary_id
HAVING COUNT(*) > 1;