use sql_challenge;

--1.employees whose average performance ratings > 4
select e.emp_id, e.emp_name, d.dept_name, (p.rating_2022+p.rating_2023+p.rating_2024)/3 as avg_rating
from cleaned_employees e
join cleaned_performance p on e.emp_id = p.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where (p.rating_2022+p.rating_2023+p.rating_2024)/3 > 4;

--2. employees with more than 2 present days
select e.emp_id, e.emp_name, count(a.attendance_id) as present_days
from cleaned_employees e
join cleaned_attendance a on e.emp_id = a.emp_id
where a.status = 'Present'
group by e.emp_id, e.emp_name
having count(a.attendance_id) > 2;

--3. departments where total salary paid > 200000
select d.dept_id, d.dept_name, sum(s.salary) as total_salary
from cleaned_departments d
join cleaned_employees e on d.dept_id = e.dept_id
join cleaned_salaries s on e.emp_id = s.emp_id
group by d.dept_id, d.dept_name
having sum(s.salary) > 200000;

--4. employees whose total salary is greater than department average salary
SELECT e.emp_id, e.emp_name, d.dept_name, SUM(s.salary) AS total_salary
FROM cleaned_employees e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
JOIN cleaned_departments d ON e.dept_id = d.dept_id
GROUP BY e.emp_id, e.emp_name, d.dept_name, e.dept_id
HAVING SUM(s.salary) >
(
    SELECT AVG(emp_total_salary)
    FROM
    (
        SELECT e2.emp_id, SUM(s2.salary) AS emp_total_salary
        FROM cleaned_employees e2
        JOIN cleaned_salaries s2 ON e2.emp_id = s2.emp_id
        WHERE e2.dept_id = e.dept_id
        GROUP BY e2.emp_id
    ) dept_avg
);
