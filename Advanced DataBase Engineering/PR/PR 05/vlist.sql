CREATE TABLE STUDENT_DEPARTMENT (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    admission_date DATE
)
PARTITION BY LIST COLUMNS(department) (
    PARTITION p_science VALUES IN ('CSE', 'ECE'),
    PARTITION p_arts VALUES IN ('Fashion', 'Hotel Mgmt'),
    PARTITION p_management VALUES IN ('IT', 'EEE')
);

INSERT INTO STUDENT_DEPARTMENT VALUES
(1, 'Ramesh', 'CSE', '2020-01-01'),
(2, 'Khilan', 'MECH', '2020-02-01'),
(3, 'Kaushik', 'ECE', '2020-03-01'),
(4, 'Chaitali', 'EEE', '2020-04-01'),
(5, 'Hardik', 'IT', '2020-05-01');

-- Display partition info
SELECT PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME='STUDENT_DEPARTMENT';
