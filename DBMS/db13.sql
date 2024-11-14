
CREATE TABLE Sales_Representative (
    Rep_no INT PRIMARY KEY,
    Name VARCHAR(50),
    Re_office VARCHAR(50),
    Quota DECIMAL(10, 2),
    Sales DECIMAL(10, 2)
);

-- Create Customers table
CREATE TABLE Customers (
    Cust_No INT PRIMARY KEY,
    Company VARCHAR(50),
    Cust_Rep INT,
    Credit_Limit DECIMAL(10, 2),
    FOREIGN KEY (Cust_Rep) REFERENCES Sales_Representative(Rep_no)
);


-- Create Orders table
CREATE TABLE Orders (
    Order_no INT PRIMARY KEY,
    cust INT,
    product VARCHAR(50),
    Quantity INT,
    amount DECIMAL(10, 2),
    Disc DECIMAL(10, 2),
    FOREIGN KEY (cust) REFERENCES Customers(Cust_No)
);

-- Insert data into Sales_Representative table
INSERT INTO Sales_Representative (Rep_no, Name, Re_office, Quota, Sales) VALUES
(1, 'Alice', 'Office1', 50000, 30000),
(2, 'Bob', 'Office1', 40000, 20000),
(3, 'Charlie', 'Office2', 45000, 25000);

-- Insert data into Customers table
INSERT INTO Customers (Cust_No, Company, Cust_Rep, Credit_Limit) VALUES
(100, 'TCS', 1, 100000),
(101, 'Infosys', 2, 120000),
(102, 'Wipro', 3, 90000);

-- Insert data into Orders table
INSERT INTO Orders (Order_no, cust, product, Quantity, amount, Disc) VALUES
(1, 100, 'ProductA', 5, 30000, 500),
(2, 101, 'ProductB', 2, 15000, 300),
(3, 100, 'ProductC', 10, 50000, 1000),
(4, 102, 'ProductD', 1, 20000, 200);

SELECT 
    c.Company AS CustomerName,
    sr.Name AS RepName,
    sr.Re_office AS RepOffice
FROM 
    Customers c
JOIN 
    Sales_Representative sr ON c.Cust_Rep = sr.Rep_no;

SELECT 
    o.Order_no, 
    c.Company AS CustomerName,
    sr.Name AS SalesRepName,
    o.amount
FROM 
    Orders o
JOIN 
    Customers c ON o.cust = c.Cust_No
JOIN 
    Sales_Representative sr ON c.Cust_Rep = sr.Rep_no
WHERE 
    o.amount > 25000;

SELECT 
    o.product
FROM 
    Orders o
JOIN 
    Customers c ON o.cust = c.Cust_No
WHERE 
    c.Company = 'TCS';

SELECT 
    c.Company,
    MAX(o.Disc) AS MaxDiscount
FROM 
    Orders o
JOIN 
    Customers c ON o.cust = c.Cust_No
GROUP BY 
    c.Company
ORDER BY 
    MaxDiscount DESC
LIMIT 1;

SELECT 
    Re_office,
    GROUP_CONCAT(Name) AS SalesReps
FROM 
    Sales_Representative
GROUP BY 
    Re_office
HAVING 
    COUNT(Rep_no) > 1;

SELECT 
    c.Company,
    c.Credit_Limit,
    SUM(o.Disc) AS TotalDiscountReceived
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.Cust_No = o.cust
GROUP BY 
    c.Company;

