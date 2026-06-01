use sql_challenge;

--1. current salary and prev salary
select emp_id, salary,salary_date,
LAG(salary) over (Partition by emp_id order by salary_date) as prev_salary
from cleaned_salaries ;


--2. difference between current salary and prev salary
select emp_id, salary,salary_date,
LAG(salary) over (Partition by emp_id order by salary_date) as prev_salary,
salary - LAG(salary) over (Partition by emp_id order by salary_date) as salary_diff
from cleaned_salaries ;

--3. attendance trend(check if attendance improved or declined)
select emp_id, attendance_date, status,
LAG(status) over (Partition by emp_id order by attendance_date) as prev_attendance_status,
CASE
    WHEN status = 'Present' AND LAG(status) over (Partition by emp_id order by attendance_date) = 'Absent' THEN 'Improved'
    WHEN status = 'WFH' AND LAG(status) over (Partition by emp_id order by attendance_date) = 'Absent' THEN 'Improved'
    WHEN status = 'Present' AND LAG(status) over (Partition by emp_id order by attendance_date) IS NULL THEN 'Improved'
    WHEN status = 'WFH' AND LAG(status) over (Partition by emp_id order by attendance_date) IS NULL THEN 'Improved'
    WHEN status = 'Absent' AND LAG(status) over (Partition by emp_id order by attendance_date) = 'Present' THEN 'Declined'
    WHEN status = 'Absent' AND LAG(status) over (Partition by emp_id order by attendance_date) IS NULL THEN 'Declined'
    WHEN status = 'Absent' AND LAG(status) over (Partition by emp_id order by attendance_date) = 'WFH' THEN 'Declined'
    ELSE 'No Change'
END as attendance_trend
from cleaned_attendance ;


WITH attendance_history AS (
    SELECT
        emp_id, attendance_date, status,
        LAG(status) OVER (PARTITION BY emp_id ORDER BY attendance_date) AS prev_attendance_status
    FROM cleaned_attendance
)

SELECT
    emp_id, attendance_date, status, prev_attendance_status,
    CASE
        WHEN status IN ('Present', 'WFH') AND prev_attendance_status = 'Absent' THEN 'Improved'
        WHEN status IN ('Present', 'WFH') AND prev_attendance_status IS NULL THEN 'Improved'
        WHEN status = 'Absent' AND prev_attendance_status IN ('Present', 'WFH') THEN 'Declined'
        WHEN status = 'Absent' AND prev_attendance_status IS NULL THEN 'Declined'
        ELSE 'No Change'
    END AS attendance_trend
FROM attendance_history;