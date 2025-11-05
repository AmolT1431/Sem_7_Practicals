CREATE TABLE STUDENT_ORDERS (
    order_id INT NOT NULL,
    student_name VARCHAR(50),
    order_date DATE,
    order_status VARCHAR(20),
    order_year INT GENERATED ALWAYS AS (YEAR(order_date)) STORED,
    order_month INT GENERATED ALWAYS AS (MONTH(order_date)) STORED
)
PARTITION BY RANGE (order_year)
SUBPARTITION BY HASH(order_month)
SUBPARTITIONS 2 (
    PARTITION p0 VALUES LESS THAN (2022),
    PARTITION p1 VALUES LESS THAN (2023),
    PARTITION p2 VALUES LESS THAN (2024)
);

-- Insert sample data
INSERT INTO STUDENT_ORDERS (order_id, student_name, order_date, order_status)
VALUES
(1, 'Ramesh', '2021-03-15', 'Shipped'),
(2, 'Khilan', '2019-01-10', 'Delivered'),
(3, 'Kaushik', '2023-01-10', 'Delivered'),
(4, 'Chaitali', '2020-01-10', 'Delivered');

-- Display partition information
SELECT PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME='STUDENT_ORDERS'
  AND TABLE_SCHEMA=DATABASE();

-- Query a specific partition
SELECT * FROM STUDENT_ORDERS PARTITION (p2);