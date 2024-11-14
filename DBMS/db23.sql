-- Create the tables
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Ename VARCHAR(50),
    Salary DECIMAL(10, 2),
    Contactno VARCHAR(15),
    City VARCHAR(50),
    DeptID INT
);

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    Dname VARCHAR(50),
    Location VARCHAR(50)
);

-- Insert sample data
INSERT INTO Employee (EmpID, Ename, Salary, Contactno, City, DeptID) VALUES
(1, 'Alice', 50000, '1234567890', 'New York', 10),
(2, 'Bob', 60000, '1234567891', 'Los Angeles', 20),
(3, 'Charlie', 55000, '1234567892', 'Chicago', 10),
(4, 'David', 70000, '1234567893', 'Houston', 30),
(5, 'Eve', 48000, '1234567894', 'Phoenix', NULL);

INSERT INTO Department (DeptID, Dname, Location) VALUES
(10, 'IT', 'New York'),
(20, 'HR', 'Los Angeles'),
(30, 'Finance', 'Houston'),
(40, 'Marketing', 'San Francisco');

SELECT E.Ename, D.Dname
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID;

SELECT E.Ename, D.Dname, D.Location
FROM Employee E
INNER JOIN Department D ON E.DeptID = D.DeptID;

SELECT E.Ename, D.Location, D.Dname
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID;

SELECT E.Ename, E.Salary, D.Location, D.Dname
FROM Employee E
RIGHT JOIN Department D ON E.DeptID = D.DeptID;

SELECT E.Ename, D.Dname, D.Location
FROM Employee E
LEFT JOIN Department D ON E.DeptID = D.DeptID

UNION

SELECT E.Ename, D.Dname, D.Location
FROM Employee E
RIGHT JOIN Department D ON E.DeptID = D.DeptID;

SELECT E.Ename, D.Dname
FROM Employee E
CROSS JOIN Department D;

SELECT E1.Ename AS Employee1, E2.Ename AS Employee2, E1.DeptID
FROM Employee E1
JOIN Employee E2 ON E1.DeptID = E2.DeptID AND E1.EmpID <> E2.EmpID;

CREATE VIEW Employee_Department AS
SELECT E.Ename, D.Dname, E.Salary
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID;

CREATE VIEW HighSalaryEmployees AS
SELECT E.Ename, E.Salary, D.Dname, D.Location
FROM Employee E
JOIN Department D ON E.DeptID = D.DeptID
WHERE E.Salary > 50000;

UPDATE Employee_Department
SET Salary = Salary + 5000
WHERE Ename = 'Alice';

DROP VIEW Employee_Department;
DROP VIEW HighSalaryEmployees;
