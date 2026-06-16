use sql_challenge;

--1.create before update trigger(prevent negative salary)
CREATE TRIGGER prevent_negative_salary
BEFORE UPDATE ON cleaned_salaries
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = OLD.salary;
    END IF;
END;

select * from cleaned_salaries where emp_id = 164;

update cleaned_salaries 
set salary = -5000 
where emp_id = 164;

--2. after insert trigger(attendance login)
create table attendance_logs
(
    emp_id INT,
    attendance_date DATE,
    message VARCHAR(255)
);

create trigger attendance_insert_log
AFTER INSERT ON cleaned_attendance
FOR EACH ROW
BEGIN
    INSERT INTO attendance_logs (emp_id, attendance_date, message)
    VALUES (NEW.emp_id, NEW.attendance_date, 'attendance added');
END;

select * FROM attendance_logs;

insert INTO cleaned_attendance 
VALUES (202601, 101, '2026-08-06', 'present');

