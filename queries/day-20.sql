use sql_challenge;

--1. latest salary for each employee

select * from
(
    select *,
    ROW_NUMBER() over (partition by emp_id order By salary_date desc)
    as rn
    from cleaned_salaries) t
where rn = 1;

--2. employees first salary
select * from
(
    select *,
    ROW_NUMBER() over (partition by emp_id order By salary_date asc)
    as rn
    from cleaned_salaries) t
where rn = 1;

--3. ranking per employee (rank salary entry for each employee)
select emp_id, salary ,rn
FROM
(
    select *,
    ROW_NUMBER() over (partition by emp_id order By salary desc)
    as rn
    from cleaned_salaries) rank_number;

--4. get top 2 salary records per employee
select emp_id, salary ,rn
FROM
(
    select *,
    ROW_NUMBER() over (partition by emp_id order By salary desc)
    as rn
    from cleaned_salaries) rank_number
where rn <= 2;
