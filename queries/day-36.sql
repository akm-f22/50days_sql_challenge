use sql_challenge;

--stored procedure
--1. creating a procedure to get employee data


create procedure get_all_emp()
begin
    select * from cleaned_employees;
end;

call get_all_emp();

--2. store a procedure with input parameter(find employee by emp_id)
create procedure get_emp_by_id(IN emp_id_input INT)
begin
    select * from cleaned_employees 
    where emp_id = emp_id_input;
end;

call get_emp_by_id(120);

--3. procedure with join(emp and salary details)
create procedure get_emp_salary_details()
begin
    select e.emp_id, e.emp_name, s.salary
    from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id;
end;    

call get_emp_salary_details();

--4.procedure for salary report(generate report for salary > 50000)
create procedure get_high_salary_employees()
begin
    select e.emp_id, e.emp_name, s.salary
    from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
    where s.salary > 50000;
end;    

call get_high_salary_employees();