-- Creating Sales_Representative table
CREATE TABLE Sales_Representative (
    Rep_no INT PRIMARY KEY,
    Name VARCHAR(50),
    Re_office VARCHAR(20),
    Quota DECIMAL(10, 2),
    Sales DECIMAL(10, 2)
);

-- Creating Customers table
CREATE TABLE Customers (
    Cust_No INT PRIMARY KEY,
    Company VARCHAR(50),
    Cust_Rep INT,
    Credit_Limit DECIMAL(10, 2),
    FOREIGN KEY (Cust_Rep) REFERENCES Sales_Representative(Rep_no)
);

-- Creating Orders table
CREATE TABLE Orders (
    Order_no INT PRIMARY KEY,
    Cust INT,
    Product VARCHAR(50),
    Quantity INT,
    Amount DECIMAL(10, 2),
    Disc DECIMAL(5, 2),
    FOREIGN KEY (Cust) REFERENCES Customers(Cust_No)
);

-- Sample data for Sales_Representative
INSERT INTO Sales_Representative (Rep_no, Name, Re_office, Quota, Sales) VALUES
(101, 'Alice Johnson', 'Office 1', 50000.00, 30000.00),
(102, 'Bob Smith', 'Office 2', 60000.00, 45000.00),
(103, 'Carol White', 'Office 3', 70000.00, 70000.00);

-- Sample data for Customers
INSERT INTO Customers (Cust_No, Company, Cust_Rep, Credit_Limit) VALUES
(201, 'TCS', 101, 100000.00),
(202, 'Infosys', 102, 120000.00),
(203, 'Wipro', 103, 90000.00);

-- Sample data for Orders
INSERT INTO Orders (Order_no, Cust, Product, Quantity, Amount, Disc) VALUES
(301, 201, 'Laptops', 10, 30000.00, 5.00),
(302, 202, 'Software', 15, 15000.00, 10.00),
(303, 203, 'Desktops', 8, 20000.00, 8.00);

SELECT 
    Customers.Company AS Customer_Name,
    Customers.Credit_Limit,
    Sales_Representative.Name AS Rep_Name,
    Sales_Representative.Sales
FROM 
    Customers
JOIN 
    Sales_Representative ON Customers.Cust_Rep = Sales_Representative.Rep_no;

SELECT 
    Orders.Order_no,
    Orders.Amount,
    Customers.Company AS Customer_Name,
    Customers.Credit_Limit
FROM 
    Orders
JOIN 
    Customers ON Orders.Cust = Customers.Cust_No;


SELECT 
    Product,
    SUM(Amount) AS Total_Sale_Amount
FROM 
    Orders
GROUP BY 
    Product
HAVING 
    SUM(Amount) > 12000;


SELECT 
    Orders.Amount,
    Customers.Company AS Customer_Name,
    Sales_Representative.Name AS Rep_Name
FROM 
    Orders
JOIN 
    Customers ON Orders.Cust = Customers.Cust_No
JOIN 
    Sales_Representative ON Customers.Cust_Rep = Sales_Representative.Rep_no
WHERE 
    Orders.Product = 'Software';


SELECT 
    Customers.Company AS Customer_Name,
    Customers.Credit_Limit,
    SUM(Orders.Disc) AS Total_Discount
FROM 
    Customers
JOIN 
    Orders ON Customers.Cust_No = Orders.Cust
GROUP BY 
    Customers.Company, Customers.Credit_Limit;


SELECT 
    A.Name AS Rep_Name1,
    B.Name AS Rep_Name2,
    A.Re_office
FROM 
    Sales_Representative A
JOIN 
    Sales_Representative B ON A.Re_office = B.Re_office 
                         AND A.Rep_no < B.Rep_no;

