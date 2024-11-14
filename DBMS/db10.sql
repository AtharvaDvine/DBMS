

-- Create Branch table
CREATE TABLE Branch (
    branchno VARCHAR(10) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10)
);

-- Create Staff table with a foreign key referencing Branch
CREATE TABLE Staff (
    staffno VARCHAR(10) PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    position VARCHAR(50),
    sex CHAR(1),
    dob DATE,
    salary DECIMAL(10, 2),
    branchno VARCHAR(10),
    FOREIGN KEY (branchno) REFERENCES Branch(branchno)
);

-- Create PropertyforRent table with foreign keys referencing Staff and Branch
CREATE TABLE PropertyforRent (
    propertyNo VARCHAR(10) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode VARCHAR(10),
    type VARCHAR(50),
    rooms INT,
    rent DECIMAL(10, 2),
    staffno VARCHAR(10),
    branchno VARCHAR(10),
    FOREIGN KEY (staffno) REFERENCES Staff(staffno),
    FOREIGN KEY (branchno) REFERENCES Branch(branchno)
);

-- Insert sample data into Branch
INSERT INTO Branch (branchno, street, city, postcode)
VALUES
('1001', 'MG Road', 'Pune', '411001'),
('1002', 'Main Street', 'Mumbai', '400001'),
('1003', 'Park Avenue', 'Bangalore', '560001');

-- Insert sample data into Staff
INSERT INTO Staff (staffno, fname, lname, position, sex, dob, salary, branchno)
VALUES
('S101', 'Amit', 'Sharma', 'Manager', 'M', '1985-02-15', 75000, '1001'),
('S102', 'Priya', 'Desai', 'Saleswoman', 'F', '1990-07-25', 50000, '1002'),
('S103', 'John', 'Doe', 'Agent', 'M', '1987-12-05', 60000, '1001'),
('S104', 'Anita', 'D\'Souza', 'Saleswoman', 'F', '1995-03-14', 40000, '1003'),
('S105', 'Rahul', 'Kapoor', 'Salesman', 'M', '1983-06-17', 55000, '1002'),
('S106', 'Sita', 'Joshi', 'Agent', 'F', '1991-11-11', 62000, '1001');

-- Insert sample data into PropertyforRent
INSERT INTO PropertyforRent (propertyNo, street, city, postcode, type, rooms, rent, staffno, branchno)
VALUES
('P001', 'Palm Street', 'Pune', '411001', 'Apartment', 3, 15000, 'S101', '1001'),
('P002', 'Hilltop', 'Mumbai', '400001', 'Flat', 5, 30000, 'S102', '1002'),
('P003', 'Green Valley', 'Bangalore', '560001', 'Apartment', 2, 12000, 'S104', '1003'),
('P004', 'Sea View', 'Mumbai', '400001', 'Flat', 4, 28000, 'S105', '1002'),
('P005', 'Riverside', 'Pune', '411001', 'House', 3, 18000, 'S103', '1001'),
('P006', 'Garden Lane', 'Pune', '411001', 'Flat', 4, 20000, 'S106', '1001');

UPDATE Branch
SET street = 'MG'
WHERE branchno = '1001';

SELECT fname, lname
FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff);

SELECT type, rooms
FROM PropertyforRent
WHERE city = 'Pune';

SELECT fname, lname
FROM Staff
WHERE position IN ('Salesman', 'Saleswoman');

SELECT COUNT(*) AS flat_count
FROM PropertyforRent
WHERE type = 'Flat';

SELECT fname, lname, dob
FROM Staff
WHERE dob < '2004-01-01';

SELECT branchno, COUNT(staffno) AS total_staff
FROM Staff
GROUP BY branchno;
