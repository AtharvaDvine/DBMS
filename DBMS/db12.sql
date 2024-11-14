

-- Create Branch table
CREATE TABLE Branch (
    bname VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- Create Customers table
CREATE TABLE Customers (
    cname VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- Create Deposit table
CREATE TABLE Deposit (
    actno INT PRIMARY KEY,
    cname VARCHAR(50),
    bname VARCHAR(50),
    amount DECIMAL(10, 2),
    adate DATE,
    FOREIGN KEY (cname) REFERENCES Customers(cname),
    FOREIGN KEY (bname) REFERENCES Branch(bname)
);

-- Create Borrow table
CREATE TABLE Borrow (
    loanno INT PRIMARY KEY,
    cname VARCHAR(50),
    bname VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (cname) REFERENCES Customers(cname),
    FOREIGN KEY (bname) REFERENCES Branch(bname)
);

-- Insert data into Branch table
INSERT INTO Branch (bname, city) VALUES
('Branch1', 'Bombay'),
('Branch2', 'Pune'),
('Branch3', 'Delhi');

-- Insert data into Customers table
INSERT INTO Customers (cname, city) VALUES
('Anil', 'Pune'),
('Rohit', 'Mumbai'),
('Neha', 'Bombay');

-- Insert data into Deposit table
INSERT INTO Deposit (actno, cname, bname, amount, adate) VALUES
(101, 'Anil', 'Branch1', 10000, '2024-01-15'),
(102, 'Rohit', 'Branch2', 5000, '2024-02-20'),
(103, 'Neha', 'Branch3', 2000, '2024-03-10');

-- Insert data into Borrow table
INSERT INTO Borrow (loanno, cname, bname, amount) VALUES
(201, 'Anil', 'Branch1', 3000),
(202, 'Rohit', 'Branch2', 4500),
(203, 'Neha', 'Branch3', 6000);

SELECT bname
FROM Branch
WHERE city = 'Bombay';

SELECT actno, amount
FROM Deposit;

UPDATE Customers
SET city = 'Mumbai'
WHERE cname = 'Anil' AND city = 'Pune';

SELECT COUNT(DISTINCT cname) AS num_depositors
FROM Deposit;

SELECT MIN(amount) AS min_amount, MAX(amount) AS max_amount
FROM Deposit;

CREATE INDEX idx_deposit_actno ON Deposit(actno);

CREATE VIEW BorrowView AS
SELECT loanno, cname, bname, amount
FROM Borrow;

SELECT * FROM BorrowView
