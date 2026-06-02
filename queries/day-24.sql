use sql_challenge;

--1. comparison of current salary and next salary
select emp_id, salary, salary_date, 
lead(salary) over (partition by emp_id order by salary_date) as next_salary
from cleaned_salaries;

--2. growth analysis(compare current salary with next salary)
select emp_id, salary, next_salary, (next_salary - salary) as salary_growth
from (
    select emp_id, salary, 
    lead(salary) over (partition by emp_id order by salary_date) as next_salary
    from cleaned_salaries
) subquery
where next_salary is not null;

--3. trend prediction (today vs next day attendance)
SELECT emp_id, attendance_date, status,
    LEAD(status) OVER (PARTITION BY emp_id ORDER BY attendance_date) AS next_status,
    CASE
    WHEN status = 'Absent' AND LEAD(status) OVER (PARTITION BY emp_id ORDER BY attendance_date) IN ('Present', 'WFH') THEN 'Improved'
    WHEN status IN ('Present', 'WFH') AND LEAD(status) OVER (PARTITION BY emp_id ORDER BY attendance_date) = 'Absent' THEN 'Declined'
    WHEN status = LEAD(status) OVER (PARTITION BY emp_id ORDER BY attendance_date) THEN 'No Change'
    ELSE 'Changed'
    END AS attendance_trend
FROM cleaned_attendance;

--Alternative query

WITH attendance_trend AS (
    SELECT emp_id, attendance_date, status,
        LEAD(status) OVER (PARTITION BY emp_id ORDER BY attendance_date) AS next_status
    FROM cleaned_attendance
)

SELECT *,
       CASE
           WHEN status = next_status THEN 'No Change'
           ELSE 'Changed'
       END AS status_change
FROM attendance_trend;