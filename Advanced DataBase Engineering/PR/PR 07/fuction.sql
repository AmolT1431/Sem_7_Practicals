DELIMITER //
CREATE FUNCTION get_grade(m INT)
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(2);
    IF m >= 90 THEN
        SET grade = 'A+';
    ELSEIF m >= 80 THEN
        SET grade = 'A';
    ELSEIF m >= 70 THEN
        SET grade = 'B';
    ELSEIF m >= 60 THEN
        SET grade = 'C';
    ELSE
        SET grade = 'F';
    END IF;
    RETURN grade;
END;
//

DELIMITER ;

SELECT name, marks, get_grade(marks) AS grade FROM students;

