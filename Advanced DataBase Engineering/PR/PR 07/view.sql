CREATE VIEW student_grades AS
SELECT student_id, name, department, marks, get_grade(marks) AS grade
FROM students;

SELECT * FROM student_grades;
