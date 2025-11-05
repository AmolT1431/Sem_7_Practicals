DELIMITER //

CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.marks > 100 THEN
        SET NEW.marks = 100;
    END IF;
END;
//

CREATE TRIGGER before_student_update
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN
    IF NEW.marks > 100 THEN
        SET NEW.marks = 100;
    END IF;
END;
//

DELIMITER ;

INSERT INTO students (name, department, marks, admission_date) VALUES ('Amit', 'CSE', 120, '2020-06-01');
SELECT * FROM students;
