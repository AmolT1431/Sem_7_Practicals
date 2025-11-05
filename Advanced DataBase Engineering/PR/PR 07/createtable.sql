CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    marks INT,
    admission_date DATE
);

INSERT INTO students (name, department, marks, admission_date) VALUES
('Ramesh', 'CSE', 85, '2020-01-01'),
('Khilan', 'MECH', 90, '2020-02-01'),
('Kaushik', 'ECE', 75, '2020-03-01'),
('Chaitali', 'EEE', 80, '2020-04-01'),
('Suresh', 'CSE', 95, '2020-05-01');