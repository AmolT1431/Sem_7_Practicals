CREATE TABLE customers (
    id NUMBER,
    name VARCHAR2(50),
    age NUMBER,
    address VARCHAR2(100),
    salary NUMBER(10,2)
)
PARTITION BY RANGE (age) (
    PARTITION p1 VALUES LESS THAN (20),
    PARTITION p2 VALUES LESS THAN (30),
    PARTITION p3 VALUES LESS THAN (40),
    PARTITION p4 VALUES LESS THAN (50)
);

-- Insert sample data
INSERT INTO customers VALUES (1, 'Ramesh', 19, 'Ahmedabad', 2000);
INSERT INTO customers VALUES (2, 'Khilan', 25, 'Delhi', 1500);
INSERT INTO customers VALUES (3, 'Kaushik', 23, 'Kota', 2000);
INSERT INTO customers VALUES (4, 'Chaitali', 31, 'Mumbai', 6500);
INSERT INTO customers VALUES (5, 'Hardik', 35, 'Bhopal', 8500);
INSERT INTO customers VALUES (6, 'Komal', 47, 'MP', 4500);
INSERT INTO customers VALUES (7, 'Muffy', 43, 'Indore', 10000);
COMMIT;








CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(50),
    department VARCHAR2(50),
    department_id NUMBER
)
PARTITION BY LIST (department_id) (
    PARTITION p1 VALUES (3,5,6,7,9),
    PARTITION p2 VALUES (13,15,16,17,20),
    PARTITION p3 VALUES (23,25,26,27,30),
    PARTITION p4 VALUES (33,35,36,37,40)
);

INSERT INTO students VALUES (1,'Ramesh','CSE',5);
INSERT INTO students VALUES (2,'Khilan','MECH',20);
INSERT INTO students VALUES (3,'Kaushik','ECE',17);
INSERT INTO students VALUES (4,'Chaitali','EEE',33);
INSERT INTO students VALUES (5,'Hardik','IT',36);
COMMIT;

CREATE TABLE employees (
    id NUMBER,
    name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER
)
PARTITION BY RANGE (id) (
    PARTITION e1 VALUES LESS THAN (2),
    PARTITION e2 VALUES LESS THAN (3),
    PARTITION e3 VALUES LESS THAN (4),
    PARTITION e4 VALUES LESS THAN (5)
);

INSERT INTO employees VALUES (1, 'Varun', 'Sales', 50000);
INSERT INTO employees VALUES (2, 'Aarohi', 'Marketing', 60000);
INSERT INTO employees VALUES (3, 'Paul', 'IT', 70000);
INSERT INTO employees VALUES (4, 'Vaidhya', 'Finance', 80000);
COMMIT;




CREATE TABLE employees (
    id NUMBER,
    name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER
)
PARTITION BY RANGE (id) (
    PARTITION e1 VALUES LESS THAN (2),
    PARTITION e2 VALUES LESS THAN (3),
    PARTITION e3 VALUES LESS THAN (4),
    PARTITION e4 VALUES LESS THAN (5)
);

INSERT INTO employees VALUES (1, 'Varun', 'Sales', 50000);
INSERT INTO employees VALUES (2, 'Aarohi', 'Marketing', 60000);
INSERT INTO employees VALUES (3, 'Paul', 'IT', 70000);
INSERT INTO employees VALUES (4, 'Vaidhya', 'Finance', 80000);
COMMIT;




CREATE TABLE customer_orders (
    order_id NUMBER,
    customer_name VARCHAR2(50),
    order_date DATE,
    order_status VARCHAR2(20)
)
PARTITION BY RANGE (EXTRACT(YEAR FROM order_date)) (
    PARTITION p0 VALUES LESS THAN (2022),
    PARTITION p1 VALUES LESS THAN (2023),
    PARTITION p2 VALUES LESS THAN (2024)
);




-- Main product info
CREATE TABLE inventory_main (
    id NUMBER,
    product_name VARCHAR2(50)
);

-- Stock info
CREATE TABLE inventory_stock (
    id NUMBER,
    product_quantity NUMBER,
    product_price NUMBER
);

INSERT INTO inventory_main VALUES (1,'Headphones');
INSERT INTO inventory_stock VALUES (1,5,50);
COMMIT;












 Customers table (RANGE Partitioning – supported in XE)
CREATE TABLE customers (
    id NUMBER,
    name VARCHAR2(50),
    age NUMBER,
    address VARCHAR2(100),
    salary NUMBER(10,2)
)
PARTITION BY RANGE (age) (
    PARTITION p1 VALUES LESS THAN (20),
    PARTITION p2 VALUES LESS THAN (30),
    PARTITION p3 VALUES LESS THAN (40),
    PARTITION p4 VALUES LESS THAN (50)
);

-- Insert sample data
INSERT INTO customers VALUES (1, 'Ramesh', 19, 'Ahmedabad', 2000);
INSERT INTO customers VALUES (2, 'Khilan', 25, 'Delhi', 1500);
INSERT INTO customers VALUES (3, 'Kaushik', 23, 'Kota', 2000);
INSERT INTO customers VALUES (4, 'Chaitali', 31, 'Mumbai', 6500);
INSERT INTO customers VALUES (5, 'Hardik', 35, 'Bhopal', 8500);
INSERT INTO customers VALUES (6, 'Komal', 47, 'MP', 4500);
INSERT INTO customers VALUES (7, 'Muffy', 43, 'Indore', 10000);
COMMIT;

✅ Compatible with XE.

2️⃣ Students table (LIST Partitioning – supported in XE)
CREATE TABLE students (
    id NUMBER,
    name VARCHAR2(50),
    department VARCHAR2(50),
    department_id NUMBER
)
PARTITION BY LIST (department_id) (
    PARTITION p1 VALUES (3,5,6,7,9),
    PARTITION p2 VALUES (13,15,16,17,20),
    PARTITION p3 VALUES (23,25,26,27,30),
    PARTITION p4 VALUES (33,35,36,37,40)
);

INSERT INTO students VALUES (1,'Ramesh','CSE',5);
INSERT INTO students VALUES (2,'Khilan','MECH',20);
INSERT INTO students VALUES (3,'Kaushik','ECE',17);
INSERT INTO students VALUES (4,'Chaitali','EEE',33);
INSERT INTO students VALUES (5,'Hardik','IT',36);
COMMIT;

✅ Compatible with XE.

3️⃣ Employees table (HASH Partitioning – not supported in XE)
Workaround: Use a normal table or RANGE/LIST partitioning.
Example using RANGE on id:
CREATE TABLE employees (
    id NUMBER,
    name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER
)
PARTITION BY RANGE (id) (
    PARTITION e1 VALUES LESS THAN (2),
    PARTITION e2 VALUES LESS THAN (3),
    PARTITION e3 VALUES LESS THAN (4),
    PARTITION e4 VALUES LESS THAN (5)
);

INSERT INTO employees VALUES (1, 'Varun', 'Sales', 50000);
INSERT INTO employees VALUES (2, 'Aarohi', 'Marketing', 60000);
INSERT INTO employees VALUES (3, 'Paul', 'IT', 70000);
INSERT INTO employees VALUES (4, 'Vaidhya', 'Finance', 80000);
COMMIT;

✅ Works in XE.

4️⃣ Customer Orders table (SUBPARTITIONING – not supported in XE)
Workaround: Use only RANGE partitioning by year:
CREATE TABLE customer_orders (
    order_id NUMBER,
    customer_name VARCHAR2(50),
    order_date DATE,
    order_status VARCHAR2(20)
)
PARTITION BY RANGE (EXTRACT(YEAR FROM order_date)) (
    PARTITION p0 VALUES LESS THAN (2022),
    PARTITION p1 VALUES LESS THAN (2023),
    PARTITION p2 VALUES LESS THAN (2024)
);

✅ Compatible with XE.

5️⃣ Vertical Partitioning (normal tables – fully supported)
-- Main product info
CREATE TABLE inventory_main (
    id NUMBER,
    product_name VARCHAR2(50)
);

-- Stock info
CREATE TABLE inventory_stock (
    id NUMBER,
    product_quantity NUMBER,
    product_price NUMBER
);

INSERT INTO inventory_main VALUES (1,'Headphones');
INSERT INTO inventory_stock VALUES (1,5,50);
COMMIT;

✅ Works in XE.

💡 Summary of changes for XE:


HASH partitioning → replaced with RANGE.


Subpartitioning → removed.


RANGE and LIST partitions are fully supported.



If you want, I can rewrite the whole script in a single block fully ready to run in Oracle XE with all tables and sample data so you can paste it directly.
Do you want me to do that?