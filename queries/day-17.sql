use sql_challenge;

--• List employees with more than 2 salary records
select emp_id, count(*) as total_records
from cleaned_salaries   
group by emp_id
having count(*) > 2;

--• List departments with more than 3 employees
select dept_id, count(*) as employee_count
from cleaned_employees
group by dept_id
having count(*) > 3;

--• List employees with total salary greater than 100000
SELECT emp_id, SUM(salary) as total_salary
FROM cleaned_salaries
GROUP BY emp_id
HAVING SUM(salary) > 100000;

--• List departments with high average salary (greater than 50000)
SELECT dept_id, AVG(salary) as avg_salary
FROM cleaned_employees e
JOIN cleaned_salaries s ON e.emp_id = s.emp_id
GROUP BY dept_id
HAVING AVG(salary) > 50000;