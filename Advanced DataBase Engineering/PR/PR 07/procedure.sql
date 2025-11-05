 67uy6
DELIMITER //

CREATE PROCEDURE increase_marks(dep_name VARCHAR(50), increment_value INT)
BEGIN
    UPDATE students
    SET marks = marks + increment_value
    WHERE department = dep_name;
END;
//

DELIMITER ;



SET SQL_SAFE_UPDATES = 0;

CALL increase_marks('CSE', 5);
SELECT * FROM students;

SET SQL_SAFE_UPDATES = 1;  

 
 
