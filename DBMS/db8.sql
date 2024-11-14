-- Create Dept table
CREATE TABLE Dept (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

-- Create Emp table with constraints
CREATE TABLE Emp (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Dept(DeptID) ON DELETE SET NULL,
    CHECK (Salary > 0)
);
INSERT INTO Dept (DeptID, DeptName, Location)
VALUES (1, 'HR', 'New York'),
       (2, 'Engineering', 'San Francisco'),
       (3, 'Marketing', 'Chicago');

SELECT * FROM Dept;

INSERT INTO Emp (EmpID, EmpName, Salary, DeptID)
VALUES (1, 'Alice', 50000, 1),
       (2, 'Bob', 60000, 2),
       (3, 'Charlie', 55000, 3);

SELECT * FROM Emp;

CREATE VIEW HighSalaryEmp AS
SELECT EmpID, EmpName, Salary, DeptID
FROM Emp
WHERE Salary > 50000;

SELECT * FROM HighSalaryEmp;

CREATE VIEW EmpDeptInfo AS
SELECT e.EmpID, e.EmpName, d.DeptName, d.Location
FROM Emp e
JOIN Dept d ON e.DeptID = d.DeptID;

SELECT * FROM EmpDeptInfo;

INSERT INTO HighSalaryEmp (EmpID, EmpName, Salary, DeptID)
VALUES (4, 'John Doe', 60000, 2);

UPDATE HighSalaryEmp
SET Salary = 70000
WHERE EmpID = 1;

DELETE FROM HighSalaryEmp
WHERE EmpID = 1;

CREATE INDEX EmployeeId ON Dept(DeptID ASC);

DROP INDEX EmployeeId ON Dept;
