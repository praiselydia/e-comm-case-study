DROP DATABASE cloths_ecomm;

CREATE DATABASE cloths_ecomm;

USE cloths_ecomm;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL,
    Description VARCHAR(255)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY, 
    SupplierName VARCHAR(255) NOT NULL, 
    ContactName VARCHAR(255) NOT NULL, 
    ContactEmail VARCHAR(255) NOT NULL, 
    Phone VARCHAR(15) NOT NULL, 
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description VARCHAR(255),
    Price float NOT NULL,
    CategoryID INT,
    SupplierID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY, 
    ProductID INT NOT NULL, 
    StockLevel INT, 
    ReorderLevel INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(50) NOT NULL,
    DepartmentID INT, 
    ManagerID INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate TIMESTAMP,
    ShippedDate TIMESTAMP,
    TotalAmount float,
    Status VARCHAR(255),
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Orders_Products (
    OrderID INT,
    ProductID INT,
    Quantity INT DEFAULT 1,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    PRIMARY KEY (OrderID, ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate TIMESTAMP,
    PaymentMethod VARCHAR(255),
    Amount float,
    PaymentStatus VARCHAR(255),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into Categories
INSERT INTO Categories VALUES(100, 'Male_Tshirts', 'Tshirts for Adult Male includes sizes XS, S, M, L, XL, XXL, 3XL, 4XL');
INSERT INTO Categories VALUES(101, 'Female_Tshirts', 'Tshirts for Adult Female includes sizes XS, S, M, L, XL, XXL, 3XL, 4XL');
INSERT INTO Categories VALUES(102, 'Male_Trousers', 'Trousers for Adult Male includes sizes XS, S, M, L, XL, XXL, 3XL, 4XL');
INSERT INTO Categories VALUES(103, 'Female_Trousers', 'Trousers for Adult Female includes sizes XS, S, M, L, XL, XXL, 3XL, 4XL');
INSERT INTO Categories VALUES(104, 'Male_Shirts', 'Shirts for Adult Male includes sizes XS, S, M, L, XL, XXL, 3XL, 4XL');
INSERT INTO Categories VALUES(105, 'Female_Shirts', 'Shirts for Adult Female includes sizes XS, S, M, L, XL, XXL, 3XL, 4XL');

-- Insert into Customers
INSERT INTO Customers VALUES (500100, 'Alex', 'Roberts', 'alex.roberts92@email.com', '(403) 555-1234', '204 4 St NE', 'Calgary', 'Alberta', 'T2E 3S2', 'Canada');
INSERT INTO Customers VALUES (500101, 'Jennifer', 'Kirk', 'jenny.k_85@inbox.net', '(587) 555-5678', '823 6 Ave SW', 'Calgary', 'Alberta', 'T2P 0V3', 'Canada');
INSERT INTO Customers VALUES (500102, 'Michael', 'Traveler', 'michael.traveler@webmail.org', '(825) 555-9101', '1632 14 Ave NW #1799', 'Calgary', 'Alberta', 'T2N 1M7', 'Canada');
INSERT INTO Customers VALUES (500103, 'Sophia', 'Grace', 'sophia.grace77@mailbox.co', '(403) 555-2468', '8500 Macleod Trail', 'Calgary', 'Alberta', 'T2H 2N1', 'Canada');
INSERT INTO Customers VALUES (500104, 'Henry', 'Powell', 'random.user1234@fastmail.com', '(587) 555-7890', '202 6 Ave SW #104', 'Calgary', 'Alberta', 'T2P 2R9', 'Canada');

-- Insert into Suppliers
INSERT INTO Suppliers VALUES (200, 'ABC Clothing Co.', 'John Doe', 'john.doe@abcclothing.com', '(403) 555-0001', '123 Fashion St, Calgary, AB, T2P 1K2');
INSERT INTO Suppliers VALUES (201, 'Trendy Wear Inc.', 'Sarah Smith', 'sarah.smith@trendywear.com', '(403) 555-0002', '456 Trendy Ave, Calgary, AB, T2P 2A3');

-- Insert into Products (Related to Categories and Suppliers)
INSERT INTO Products VALUES (300, 'Men Black T-shirt', 'Comfortable cotton T-shirt', 25.99, 100, 200);
INSERT INTO Products VALUES (301, 'Women Red T-shirt', 'Stylish red cotton T-shirt', 22.50, 101, 201);
INSERT INTO Products VALUES (302, 'Men Blue Jeans', 'Slim fit blue jeans', 40.00, 102, 200);
INSERT INTO Products VALUES (303, 'Women Black Jeans', 'Skinny black jeans', 38.75, 103, 201);
INSERT INTO Products VALUES (304, 'Men Formal Shirt', 'White long-sleeve formal shirt', 30.00, 104, 200);
INSERT INTO Products VALUES (305, 'Women Blouse', 'Elegant office blouse', 28.50, 105, 201);

-- Insert into Inventory (Related to Products)
INSERT INTO Inventory VALUES (400, 300, 50, 10);
INSERT INTO Inventory VALUES (401, 301, 60, 15);
INSERT INTO Inventory VALUES (402, 302, 40, 8);
INSERT INTO Inventory VALUES (403, 303, 30, 5);
INSERT INTO Inventory VALUES (404, 304, 45, 12);
INSERT INTO Inventory VALUES (405, 305, 35, 7);


-- Insert into Employees (Related to Departments and Managers, assuming DepartmentID and ManagerID exist)
INSERT INTO Employees VALUES (600, 'Emma', 'Johnson', 'Sales Manager', 1, NULL);
INSERT INTO Employees VALUES (601, 'Liam', 'Brown', 'Sales Associate', 1, 600);
INSERT INTO Employees VALUES (602, 'Olivia', 'Davis', 'Inventory Manager', 2, NULL);
INSERT INTO Employees VALUES (603, 'Noah', 'Wilson', 'Warehouse Staff', 2, 602);
INSERT INTO Employees VALUES (604, 'Ava', 'Miller', 'Customer Service', 3, 600);
INSERT INTO Employees VALUES (605, 'Ethan', 'Anderson', 'Accountant', 4, NULL);

-- Insert into Orders (Related to Customers and Employees)
INSERT INTO Orders VALUES (700, 500100, '2024-01-10 14:30:00', '2024-01-11 10:00:00', 48.49, 'Shipped', 601);
INSERT INTO Orders VALUES (701, 500101, '2024-01-11 10:15:00', '2024-01-12 12:00:00', 80.00, 'Delivered', 604);
INSERT INTO Orders VALUES (702, 500102, '2024-01-12 16:45:00', NULL, 40.00, 'Processing', 603);
INSERT INTO Orders VALUES (703, 500103, '2024-01-13 13:10:00', '2024-01-14 09:30:00', 60.50, 'Shipped', 601);
INSERT INTO Orders VALUES (704, 500104, '2024-01-14 11:55:00', '2024-01-15 14:20:00', 28.50, 'Delivered', 604);
INSERT INTO Orders VALUES (705, 500100, '2024-01-20 15:00:00', '2024-01-21 11:30:00', 55.99, 'Shipped', 601);
INSERT INTO Orders VALUES (706, 500103, '2024-01-22 14:45:00', NULL, 75.00, 'Processing', 603);

-- Insert into Orders_Products (Related to Orders and Products)
INSERT INTO Orders_Products VALUES (700, 300, 1);
INSERT INTO Orders_Products VALUES (700, 305, 1);
INSERT INTO Orders_Products VALUES (701, 302, 2);
INSERT INTO Orders_Products VALUES (702, 303, 1);
INSERT INTO Orders_Products VALUES (703, 304, 2);
INSERT INTO Orders_Products VALUES (704, 305, 1);
INSERT INTO Orders_Products VALUES (705, 301, 1); 
INSERT INTO Orders_Products VALUES (705, 303, 1); 
INSERT INTO Orders_Products VALUES (706, 300, 1);
INSERT INTO Orders_Products VALUES (706, 304, 1);

-- Insert into Payments (Related to Orders)
INSERT INTO Payments VALUES (800, 700, '2024-01-10 15:00:00', 'Credit Card', 48.49, 'Completed');
INSERT INTO Payments VALUES (801, 701, '2024-01-11 10:30:00', 'PayPal', 80.00, 'Completed');
INSERT INTO Payments VALUES (802, 702, '2024-01-12 17:00:00', 'Debit Card', 40.00, 'Pending');
INSERT INTO Payments VALUES (803, 703, '2024-01-13 14:00:00', 'Credit Card', 60.50, 'Completed');
INSERT INTO Payments VALUES (804, 704, '2024-01-14 12:10:00', 'PayPal', 28.50, 'Completed');
INSERT INTO Payments VALUES (805, 705, '2024-01-20 15:30:00', 'Credit Card', 55.99, 'Completed');
INSERT INTO Payments VALUES (806, 706, '2024-01-22 15:00:00', 'PayPal', 75.00, 'Pending');

-- 3 Sample Queries

-- Revenue trend from Jan 2024
    SELECT 
        cat.CategoryName, 
        SUM(o.TotalAmount) AS TotalRevenue,
        COUNT(DISTINCT o.OrderID) AS TotalOrders
    FROM Orders o
    JOIN Orders_Products op ON o.OrderID = op.OrderID
    JOIN Products p ON op.ProductID = p.ProductID
    JOIN Categories cat ON p.CategoryID = cat.CategoryID
    WHERE o.OrderDate >= '2024-01-01'
    GROUP BY cat.CategoryName
    ORDER BY TotalRevenue DESC;

-- Returning Customers vs. One-Time Buyers
SELECT 
    CASE 
        WHEN order_count > 1 THEN 'Returning Customer'
        ELSE 'One-Time Buyer'
    END AS CustomerType,
    COUNT(*) AS TotalCustomers
FROM (
    SELECT CustomerID, COUNT(OrderID) AS order_count
    FROM Orders
    GROUP BY CustomerID
) AS OrderSummary
GROUP BY CustomerType;

-- Employee Order Management from Jan 2024
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    COUNT(o.OrderID) AS TotalOrdersHandled
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate >= '2024-01-01'
GROUP BY e.EmployeeID, EmployeeName
ORDER BY TotalOrdersHandled DESC;

-- 3 Views useful for Business

CREATE VIEW Low_Stock_Products_View AS
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    i.StockLevel,
    s.SupplierName
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE i.StockLevel < 50
ORDER BY i.StockLevel ASC;

CREATE VIEW Top_Selling_Products_View AS
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    SUM(op.Quantity) AS total_quantity_sold,
    SUM(op.Quantity * p.Price) AS total_revenue
FROM Orders_Products op
JOIN Products p ON op.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Orders o ON op.OrderID = o.OrderID
WHERE o.Status = 'Delivered'
GROUP BY p.ProductID, p.ProductName, c.CategoryName
ORDER BY total_revenue DESC;

CREATE VIEW Order_Fulfillment_Performance_View AS
SELECT 
    o.OrderID,
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS customer_name,
    o.OrderDate,
    o.ShippedDate,
    DATEDIFF(o.ShippedDate, o.OrderDate) AS processing_time_days,
    o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Status IN ('Delivered', 'Shipped')
ORDER BY processing_time_days DESC;
