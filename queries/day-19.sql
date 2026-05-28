use sql_challenge;

--1. salary category (<30000 low, 30000-60000 medium, >60000 high)
SELECT 
    emp_id,
    salary,
    CASE 
        WHEN salary < 30000 THEN 'low'
        WHEN salary BETWEEN 30000 AND 60000 THEN 'medium'
        ELSE 'high'
    END AS category
FROM cleaned_salaries;


--2. performance category (avg rating >= 4 good, >=3 average, else poor)
SELECT 
    emp_id,
    CASE 
        WHEN (rating_2022 + rating_2023 + rating_2024)/3 >= 4 THEN 'good'
        WHEN (rating_2022 + rating_2023 + rating_2024)/3 >= 3 THEN 'average'
        ELSE 'poor'
    END AS performance_category
FROM cleaned_performance;

--3. attendance status category (present - active, absent - inactive)
SELECT 
    emp_id,
    CASE 
        WHEN status = 'Present' THEN 'active'
        ELSE 'inactive'
    END AS attendance_status
FROM cleaned_attendance;

--4 experience category (experience < 2 years - fresher, 2-5 years - mid-level, >5 years - experienced)
SELECT 
    emp_id, year(curdate()) - year(hire_date) AS experience_years,
    CASE 
        WHEN year(curdate()) - year(hire_date) < 2 THEN 'fresher'
        WHEN year(curdate()) - year(hire_date) BETWEEN 2 AND 5 THEN 'mid-level'
        ELSE 'experienced'
    END AS experience_category
FROM cleaned_employees;

