use sql_challenge;

--1. before insert trigger (prevent negative salary)
CREATE TRIGGER before_salary_insert
BEFORE INSERT ON cleaned_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END;

insert INTO cleaned_salaries (salary_id, emp_id, salary, salary_date) VALUES (501, 901, -50000, '2024-01-01');

select * FROM cleaned_salaries where emp_id = 901;

--2. after update trigger (salary change log)
create table salary_logs
(
    emp_id INT,
    old_salary INT,
    new_salary INT,
    change_date DATETIME
);

CREATE TRIGGER salary_update_trigger
AFTER UPDATE ON cleaned_salaries
FOR EACH ROW
BEGIN
    INSERT INTO salary_logs (emp_id, old_salary, new_salary, change_date)
    VALUES (OLD.emp_id, OLD.salary, NEW.salary, NOW());
END;

update cleaned_salaries
set salary = 70000
where emp_id = 463;

select * FROM salary_logs where emp_id = 463;