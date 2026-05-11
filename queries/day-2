-- 1.cleaned employees
use sql_challenge;

select * from cleaned_employees
WHERE
emp_id is NULL or emp_id = ''
or
emp_name is NULL or emp_name = '' 
or
age is NULL or age = ''
or
city is NULL or city = ''
or
dept_id is NULL or dept_id = ''
or
hire_date is NULL or hire_date = ''
;

-- 2.cleaned salaries
select * from cleaned_salaries
WHERE
salary_id is NULL or salary_id = ''
or
emp_id is NULL or emp_id = ''
or
salary is NULL or salary = ''
or
salary_date is NULL or salary_date = ''
;

-- 3.cleaned attendance
select * from cleaned_attendance
WHERE
attendance_id is NULL or attendance_id = ''
or
emp_id is NULL or emp_id = ''
or
attendance_date is NULL or attendance_date = ''
or
status is NULL or status = ''
;

-- 4.cleaned performance
select * from cleaned_performance
WHERE
emp_id is NULL or emp_id = ''
or
rating_2022 is NULL or rating_2022 = ''
or
rating_2023 is NULL or rating_2023 = ''
or
rating_2024 is NULL or rating_2024 = ''
;

-- 5.cleaned departments
select * from cleaned_departments
WHERE
dept_id is NULL or dept_id = ''
or 
dept_name is NULL or dept_name = ''
;