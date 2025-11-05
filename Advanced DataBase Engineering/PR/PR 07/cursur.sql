DELIMITER //

CREATE PROCEDURE print_students()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_id INT;
    DECLARE s_name VARCHAR(50);
    DECLARE s_marks INT;

    DECLARE cur CURSOR FOR SELECT student_id, name, marks FROM students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO s_id, s_name, s_marks;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Student: ', s_name, ', Marks: ', s_marks) AS info;
    END LOOP;

    CLOSE cur;
END;
//

DELIMITER ;

CALL print_students();
