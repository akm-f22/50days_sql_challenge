use sql_challenge;

--had to update the hire_date column in cleaned_employees with the original data from employees table
UPDATE cleaned_employees ce
JOIN employees e
ON ce.emp_id = e.emp_id
SET ce.hire_date = e.hire_date;

-- remove invalid months from cleaned employees table
update cleaned_employees
set hire_date = null
where 
cast (substring_index(substring_index(hire_date,'-', 2),'-', -1) as unsigned) > 12;

-- convert dd-mm-yyyy to yyyy-mm-dd 
update cleaned_employees
set hire_date = concat
(
    RIGHT(hire_date,4),'-',substring(hire_date,4,2),'-',left(hire_date,2)    
)
where hire_date like '__-__-____';

--remove invalid dates
update cleaned_employees
set hire_date = null
where cast(right(hire_date,2) as unsigned) > 31;

alter table cleaned_employees
modify hire_date date;

select distinct hire_date from cleaned_employees;

--replace null and empty value with 2024-02-25
UPDATE cleaned_employees
SET hire_date = '2024-02-25'
WHERE hire_date IS NULL;
   
select * from cleaned_employees
WHERE hire_date LIKE '%2024-02-25%';




-- remove invalid months from cleaned salaries table
update cleaned_salaries
set salary_date = null
where 
cast (substring_index(substring_index(salary_date,'-', 2),'-', -1) as unsigned) > 12;

-- convert dd-mm-yyyy to yyyy-mm-dd 
update cleaned_salaries
set salary_date = concat
(
    RIGHT(salary_date,4),'-',substring(salary_date,4,2),'-',left(salary_date,2)    
)
where salary_date like '__-__-____';

--remove invalid dates
update cleaned_salaries
set salary_date = null
where cast(right(salary_date,2) as unsigned) > 31;

alter table cleaned_salaries
modify salary_date date;

select distinct salary_date from cleaned_salaries;

--replace null and empty value with 2024-02-25
UPDATE cleaned_salaries
SET salary_date = '2024-02-25'
WHERE salary_date IS NULL;
   
select * from cleaned_salaries
WHERE salary_date LIKE '%2024-02-25%';




-- remove invalid months from cleaned attendance table
update cleaned_attendance
set attendance_date = null
where 
cast (substring_index(substring_index(attendance_date,'-', 2),'-', -1) as unsigned) > 12;

-- convert dd-mm-yyyy to yyyy-mm-dd 
update cleaned_attendance
set attendance_date = concat
(
    RIGHT(attendance_date,4),'-',substring(attendance_date,4,2),'-',left(attendance_date,2)    
)
where attendance_date like '__-__-____';

--remove invalid dates
update cleaned_attendance
set attendance_date = null
where cast(right(attendance_date,2) as unsigned) > 31;

alter table cleaned_attendance
modify attendance_date date;

select distinct attendance_date from cleaned_attendance;

--replace null and empty value with 2024-02-25
UPDATE cleaned_attendance
SET attendance_date = '2024-02-25'
WHERE attendance_date IS NULL;
   
select * from cleaned_attendance
WHERE attendance_date LIKE '%2024-02-25%';