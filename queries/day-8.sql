use sql_challenge;

update cleaned_employees
set emp_name = trim(emp_name);

-- datatype conversion
--1. cleaned employees
alter table cleaned_employees
modify emp_id int,
modify emp_name varchar(255),
modify age int,
modify city varchar(255),
modify dept_id int,
modify hire_date date;

DESCRIBE cleaned_employees;

--2. cleaned departments
alter table cleaned_departments
modify dept_id int,
modify dept_name varchar(255);

DESCRIBE cleaned_departments;

--3. cleaned salaries
alter table cleaned_salaries
modify emp_id int,
modify salary_id int,
modify salary_date date,
modify salary decimal(10,2);

DESCRIBE cleaned_salaries;

--4. cleaned attendance
alter table cleaned_attendance
modify emp_id int,
modify attendance_id int,
modify attendance_date date,
modify status varchar(50);

DESCRIBE cleaned_attendance;

--5. cleaned performance
alter table cleaned_performance
modify emp_id int,
modify rating_2022 int,
modify rating_2023 int,
modify rating_2024 int;

DESCRIBE cleaned_performance;