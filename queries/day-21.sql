use sql_challenge;

--1. rank employees by salary
select emp_id, salary,
RANK() over (Order By salary desc) as salary_rank
from cleaned_salaries;

--2. department wise ranking (rank employee inside each department)
select e.emp_id, e.dept_id, s.salary,
dense_rank() over (Partition by e.dept_id Order By s.salary desc) as dept_rank
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;


--3. find the top performers( calculate avg rating then rank)

select emp_id,(rating_2022+rating_2023+rating_2024)/3 as avg_rating,
DENSE_RANK() over (Order By (rating_2022+rating_2023+rating_2024)/3 desc) as performance_rank
from cleaned_performance;

--4. salary ranking(top 3 employees)
SELECT *
FROM (
    SELECT emp_id, salary,
        RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM cleaned_salaries
) t
WHERE salary_rank <= 3;