
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
('B1', 'MG Road', 'Pune', '411001'),
('B2', 'Main Street', 'Mumbai', '400001'),
('B3', 'Park Avenue', 'Bangalore', '560001');

-- Insert sample data into Staff
INSERT INTO Staff (staffno, fname, lname, position, sex, dob, salary, branchno)
VALUES
('S101', 'Amit', 'Sharma', 'Manager', 'M', '1985-02-15', 75000, 'B1'),
('S102', 'Priya', 'Desai', 'Sales', 'F', '1990-07-25', 50000, 'B2'),
('S103', 'John', 'Doe', 'Agent', 'M', '1987-12-05', 60000, 'B1'),
('S104', 'Anita', 'D\'Souza', 'Clerk', 'F', '1995-03-14', 40000, 'B3'),
('S105', 'Rahul', 'Kapoor', 'Sales', 'M', '1983-06-17', 55000, 'B2'),
('S106', 'Sita', 'Joshi', 'Agent', 'F', '1991-11-11', 62000, 'B1');

-- Insert sample data into PropertyforRent
INSERT INTO PropertyforRent (propertyNo, street, city, postcode, type, rooms, rent, staffno, branchno)
VALUES
('P001', 'Palm Street', 'Pune', '411001', 'Apartment', 3, 15000, 'S101', 'B1'),
('P002', 'Hilltop', 'Mumbai', '400001', 'Villa', 5, 30000, 'S102', 'B2'),
('P003', 'Green Valley', 'Bangalore', '560001', 'Apartment', 2, 12000, 'S104', 'B3'),
('P004', 'Sea View', 'Mumbai', '400001', 'Condo', 4, 28000, 'S105', 'B2'),
('P005', 'Riverside', 'Pune', '411001', 'House', 3, 18000, 'S103', 'B1'),
('P006', 'Garden Lane', 'Pune', '411041', 'House', 4, 20000, 'S106', 'B1');

UPDATE Staff
SET lname = 'Shinde'
WHERE staffno = 'S106';

DELETE FROM Branch
WHERE postcode = '411041';

SELECT *
FROM Staff
WHERE fname LIKE '%A%A%' OR lname LIKE '%A%A%';

SELECT branchno, MAX(salary) AS max_salary
FROM Staff
GROUP BY branchno
ORDER BY max_salary DESC;

SELECT *
FROM PropertyforRent
WHERE staffno = 'S123';

SELECT AVG(rent) AS average_rent
FROM PropertyforRent
WHERE city = 'Pune';

SELECT branchno, COUNT(propertyNo) AS property_count
FROM PropertyforRent
GROUP BY branchno;
