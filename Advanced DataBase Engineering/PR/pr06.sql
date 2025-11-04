 
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    emp_salary NUMBER(10,2),
    hire_date DATE DEFAULT SYSDATE
);

CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

 
INSERT INTO employees VALUES (emp_seq.NEXTVAL, 'John', 25000, SYSDATE);
INSERT INTO employees VALUES (emp_seq.NEXTVAL, 'Alice', 30000, SYSDATE);
INSERT INTO employees VALUES (emp_seq.NEXTVAL, 'Bob', 27000, SYSDATE);
COMMIT;

CREATE SYNONYM emp FOR employees;
SELECT * FROM emp;

CREATE SYNONYM emp_sequence FOR emp_seq;
ALTER SEQUENCE emp_sequence INCREMENT BY 2;
SELECT * FROM emp;

 

SELECT emp_seq.CURRVAL AS current_value FROM dual;
SELECT emp_seq.NEXTVAL AS next_value FROM dual;



 


 


 
