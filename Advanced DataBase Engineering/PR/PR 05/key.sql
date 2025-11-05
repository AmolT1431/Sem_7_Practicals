 CREATE TABLE STUDENTS_KEY (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    PRIMARY KEY (id)
)
PARTITION BY KEY(id) PARTITIONS 4;

INSERT INTO STUDENTS_KEY VALUES
(1, 'Ramesh', 'ramesh@mail.com'),
(2, 'Khilan', 'khilan@mail.com'),
(3, 'Kaushik', 'kaushik@mail.com'),
(4, 'Chaitali', 'chaitali@mail.com'),
(5, 'Hardik', 'hardik@mail.com'),
(6, 'Komal', 'komal@mail.com'),
(7, 'Muffy', 'muffy@mail.com');

-- Display partition info
SELECT PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME='STUDENTS_KEY';

SELECT * FROM STUDENTS_KEY PARTITION (p1);