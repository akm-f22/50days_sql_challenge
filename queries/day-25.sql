use sql_challenge;

--1. salary running total(cummulative salary for each employee over time)
SELECT emp_id, salary_date, salary,
       SUM(salary) OVER (PARTITION BY emp_id ORDER BY salary_date) AS running_salary
FROM cleaned_salaries;

--2. attendance running count(find total attendance count over time)
SELECT emp_id, attendance_date, status,
       COUNT(*) OVER (PARTITION BY emp_id ORDER BY attendance_date) AS running_attendance_count
FROM cleaned_attendance;

--3. department cumulative salary(total salary accumulative in each department over time)
SELECT d.dept_id, s.salary_date, s.salary,
       SUM(s.salary) OVER (PARTITION BY d.dept_id ORDER BY s.salary_date) AS department_running_salary
FROM cleaned_salaries s
JOIN cleaned_employees e ON s.emp_id = e.emp_id
JOIN cleaned_departments d ON e.dept_id = d.dept_id;