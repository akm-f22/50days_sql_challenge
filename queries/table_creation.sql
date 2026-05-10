use sql_challenge;

create table departments (
    dept_id VARCHAR(40),
    dept_name VARCHAR(40)
);

create table employees (
    emp_id VARCHAR(40),
    emp_name VARCHAR(40),
    age varchar(40),
    city varchar(40),
    dept_id VARCHAR(40),
    hire_date varchar(40)
);

create table salaries(
    salary_id VARCHAR(40),
    emp_id VARCHAR(40),
    salary varchar(40),
    salary_date varchar(40)
);

create table attendance(
    attendance_id VARCHAR(40),
    emp_id VARCHAR(40),
    attendance_date varchar(40),
    status varchar(40)
);

create table performance(
    emp_id VARCHAR(40),
    rating_2022 varchar(40),
    rating_2023 varchar(40),
    rating_2024 varchar(40)
)