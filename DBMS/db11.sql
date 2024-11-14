
-- Create Department table
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(50),
    location VARCHAR(50)
);

-- Create Employee table with a foreign key referencing Department
CREATE TABLE emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    hiredate DATE,
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

-- Insert sample data into dept
INSERT INTO dept (deptno, deptname, location)
VALUES
(10, 'HR', 'New York'),
(20, 'Sales', 'Los Angeles'),
(30, 'Dev', 'San Francisco');

-- Insert sample data into emp
INSERT INTO emp (eno, ename, job, hiredate, salary, commission, deptno)
VALUES
(1, 'Alice', 'Manager', '1980-12-17', 8000, NULL, 10),
(2, 'Bob', 'Salesman', '1981-09-28', 5000, 500, 20),
(3, 'Carol', 'Salesman', '1981-06-20', 4500, 400, 20),
(4, 'Dave', 'Developer', '1982-01-12', 6000, NULL, 30),
(5, 'Irene', 'Clerk', '1983-03-03', 3000, NULL, 10);

SELECT MAX(salary) AS max_salary
FROM emp
WHERE job = 'Salesman';

SELECT ename
FROM emp
WHERE ename LIKE 'I%';

SELECT *
FROM emp
WHERE hiredate < '1981-09-30';

SELECT *
FROM emp
ORDER BY salary DESC;

SELECT COUNT(*) AS num_employees, AVG(salary) AS avg_salary
FROM emp
WHERE deptno = 20;

SELECT hiredate, AVG(salary) AS avg_salary, MIN(salary) AS min_salary
FROM emp
WHERE deptno = 10
GROUP BY hiredate;

SELECT emp.ename, dept.deptname
FROM emp
JOIN dept ON emp.deptno = dept.deptno;

SELECT deptno, SUM(salary) AS total_salary
FROM emp
GROUP BY deptno;

SELECT emp.*
FROM emp
JOIN dept ON emp.deptno = dept.deptno
WHERE dept.deptname = 'Dev';

UPDATE emp
SET salary = salary * 1.05
WHERE deptno = 10;

