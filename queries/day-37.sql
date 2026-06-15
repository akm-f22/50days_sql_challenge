use sql_challenge;

--1. procedure with if condition(find return message based on salary)
create procedure salary_check(IN emp INT)
begin
    declare sal INT;
    select salary into sal from cleaned_salaries where emp_id = emp
    limit 1;

    if sal is null then
        select 'Salary not found' as result;
    elseif sal > 50000 then
        select 'High salary' as result;
    else
        select 'Low Salary' as result;
    end if;
end;

call salary_check(210);

--2. procedure with case(categorize the employee, salary > 70000 high, 70000>salary>40000 medium, else low)
create procedure categorize_employee(IN emp INT)
begin
    declare sal INT;
    select salary into sal from cleaned_salaries where emp_id = emp
    limit 1;

    case 
        when sal is null then
            select 'Salary not found' as result;
        when sal > 70000 then
            select 'High salary' as result;
        when sal > 40000 then
            select 'Medium salary' as result;
        else
            select 'Low salary' as result;
    end case;
end;

call categorize_employee(210);

--3. procedure with aggregation(find total salary per employee)
create procedure total_salary_per_employee()
begin
    select e.emp_id, e.emp_name, sum(s.salary) as total_salary
    from cleaned_employees e
    join cleaned_salaries s on e.emp_id = s.emp_id
    group by e.emp_id, e.emp_name;
end;


call total_salary_per_employee();