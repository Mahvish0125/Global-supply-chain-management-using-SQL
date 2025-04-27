CREATE DATABASE Global_Supply_Chain_Management_System;
USE Global_Supply_Chain_Management_System;

CREATE TABLE Categories (  
    CategoryID INT PRIMARY KEY,  
    CategoryName VARCHAR(100) NOT NULL,  
    Description TEXT  
);  

CREATE TABLE Products (  
    ProductID INT PRIMARY KEY,  
    Name VARCHAR(100) NOT NULL,  
    Description TEXT,  
    Price DECIMAL(10,2) NOT NULL,  
    StockQuantity INT NOT NULL,  
    CategoryID INT,  
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)  
);  

CREATE TABLE Suppliers (  
    SupplierID INT PRIMARY KEY,  
    SupplierName VARCHAR(100) NOT NULL,  
    ContactName VARCHAR(100),  
    Phone VARCHAR(15),  
    Email VARCHAR(100),  
    Address TEXT  
);  

CREATE TABLE Customers (  
    CustomerID INT PRIMARY KEY,  
    CustomerName VARCHAR(100) NOT NULL,  
    ContactName VARCHAR(100),  
    Phone VARCHAR(15),  
    Email VARCHAR(100),  
    Address TEXT  
);  

CREATE TABLE Orders (  
    OrderID INT PRIMARY KEY,  
    OrderDate DATE NOT NULL,  
    CustomerID INT,  
    TotalAmount DECIMAL(10,2),  
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  
);  

CREATE TABLE OrderDetails (  
    OrderDetailID INT PRIMARY KEY,  
    OrderID INT,  
    ProductID INT,  
    Quantity INT NOT NULL,  
    UnitPrice DECIMAL(10,2) NOT NULL,  
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),  
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  
);  

CREATE TABLE Shipments (  
    ShipmentID INT PRIMARY KEY,  
    OrderID INT,  
    ShipmentDate DATE NOT NULL,  
    ShippingAddress TEXT,  
    TrackingNumber VARCHAR(50),  
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)  
);  

CREATE TABLE Warehouses (  
    WarehouseID INT PRIMARY KEY,  
    WarehouseName VARCHAR(100) NOT NULL,  
    Location VARCHAR(100),  
    Capacity INT  
);  

CREATE TABLE Inventory (  
    InventoryID INT PRIMARY KEY,  
    ProductID INT,  
    WarehouseID INT,  
    QuantityOnHand INT NOT NULL,  
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),  
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)  
);  

CREATE TABLE Payments (  
    PaymentID INT PRIMARY KEY,  
    OrderID INT,  
    PaymentDate DATE NOT NULL,  
    Amount DECIMAL(10,2) NOT NULL,  
    PaymentMethod VARCHAR(50),  
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)  
);

/* Drop command*/-- it will be used for delete any table in database
Drop table products;
/*DML Commands*/

INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES 
(1, 'Electronics', 'Devices with electrical components'),
(2, 'Home Appliances', 'Electronics for household use'),
(3, 'Fashion', 'Clothing, shoes, and accessories'),
(4, 'Furniture', 'Household furniture and fixtures'),
(5, 'Sports Equipment', 'Sporting goods and equipment'),
(6, 'Books', 'Printed and digital reading material'),
(7, 'Toys', 'Children’s toys and games'),
(8, 'Beauty Products', 'Cosmetics and personal care items'),
(9, 'Office Supplies', 'Stationery and office equipment'),
(10, 'Automotive', 'Car parts and accessories');

INSERT INTO Products (ProductID, Name, Description, Price, StockQuantity, CategoryID) VALUES 
(101, 'Smartphone', 'Latest model smartphone', 699.99, 50, 1),
(102, 'Washing Machine', 'Energy-efficient washing machine', 499.99, 20, 2),
(103, 'Laptop', 'High performance gaming laptop', 1299.99, 15, 1),
(104, 'Sneakers', 'Comfortable running shoes', 89.99, 50, 3),
(105, 'Sofa', 'Three-seat leather sofa', 899.99, 10, 4),
(106, 'Treadmill', 'Foldable electric treadmill', 599.99, 5, 5),
(107, 'Novel', 'Best-selling fiction book', 19.99, 100, 6),
(108, 'Puzzle', '1000-piece jigsaw puzzle', 14.99, 30, 7),
(109, 'Shampoo', 'Herbal hair care product', 7.99, 75, 8),
(110, 'Notebook', 'Pack of 3 spiral notebooks', 5.99, 40, 9);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Phone, Email, Address) VALUES 
(1, 'Tech Supplies Inc.', 'Naruto', '123-456-7890', 'contact@techsupplies.com', '123 Tech St, Tech City'),
(2, 'Home Goods Wholesale', 'Luffy', '321-654-9870', 'info@homegoods.com', '789 Appliance Rd, Home City'),
(3, 'Fashion Suppliers Co.', 'Ichigo', '456-789-1230', 'contact@fashionsuppliers.com', '101 Fashion St, Style City'),
(4, 'Toys Kingdom', 'Goku', '567-890-1234', 'sales@toysk.com', '456 Play Ave, Funville'),
(5, 'Book World', 'Light', '678-901-2345', 'orders@bookworld.com', '789 Novel Ln, Storyville'),
(6, 'Beauty Pro', 'Hinata', '789-012-3456', 'info@beautypro.com', '101 Glam St, Beautyville'),
(7, 'OfficeMart', 'Eren', '890-123-4567', 'contact@officemart.com', '234 Paper Rd, Worktown'),
(8, 'CarParts Co.', 'Mikasa', '901-234-5678', 'support@carparts.com', '567 Auto Ln, Motown'),
(9, 'Sporty Supplies', 'Zoro', '012-345-6789', 'info@sportysupplies.com', '890 Playfield St, Sportstown'),
(10, 'Kitchen Essentials', 'Sanji', '123-456-7891', 'sales@kitchenessentials.com', '345 Cook Rd, Cheftown');

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Phone, Email, Address) VALUES 
(1, 'Tharun Reddy', 'Tharun', '123-456-7890', 'tharunreddy@gmail.com', '4941 6th avenue, Niagara Falls'),
(2, 'Sai Kumar', 'Sai', '234-567-8901', 'saikumar@gmail.com', '234 Second St, Niagara Falls'),
(3, 'Mahvi Kouniane', 'Mahvi', '567-890-1234', 'mahvi.kouniane@gmail.com', '567 Third St, St.Catherins'),
(4, 'Kaveri Yellala', 'Kaveri', '890-123-4567', 'kaveri.yella@gmail.com', '890 Fourth St, Toronto'),
(5, 'Lakshmi Prasanna', 'Prasanna', '901-234-5678', 'lakshmi.prasanna@gmail.com', '345 Fifth St, Kingston'),
(6, 'Baanu Vasudhara', 'Baanu', '123-890-4567', 'baanu.vasudhara@gmail.com', '456 Sixth Ave, Ottawa'),
(7, 'Vishnu Uday', 'Vishnu', '789-123-0456', 'vishnu.uday@gmail.com', '567 Seventh St, Vancouver'),
(8, 'Vijay Ch', 'Vijay', '345-678-9012', 'vijay.ch@gmail.com', '678 Eighth Ave, Calgary'),
(9, 'Karunakar Reddy', 'Karunakar', '123-567-8904', 'karunakar.reddy@gmail.com', '789 Ninth St, Montreal'),
(10, 'Dinku Reddy', 'Dinku', '234-789-0123', 'dinku.reddy@gmail.com', '890 Tenth Ave, Edmonton');
 
INSERT INTO Orders (OrderID, OrderDate, CustomerID, TotalAmount) VALUES 
(1, '2024-11-29', 1, 699.99),
(2, '2024-11-29', 2, 499.99),
(3, '2024-11-30', 3, 89.99),
(4, '2024-12-01', 4, 1299.99),
(5, '2024-12-02', 5, 19.99),
(6, '2024-12-03', 6, 599.99),
(7, '2024-12-04', 7, 14.99),
(8, '2024-12-05', 8, 7.99),
(9, '2024-12-06', 9, 5.99),
(10, '2024-12-07', 10, 899.99);
   
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 101, 1, 699.99),
(2, 2, 102, 1, 499.99),
(3, 3, 104, 1, 89.99),
(4, 4, 103, 1, 1299.99),
(5, 5, 107, 1, 19.99),
(6, 6, 106, 1, 599.99),
(7, 7, 108, 1, 14.99),
(8, 8, 109, 1, 7.99),
(9, 9, 110, 1, 5.99),
(10, 10, 105, 1, 899.99);

INSERT INTO Shipments (ShipmentID, OrderID, ShipmentDate, ShippingAddress, TrackingNumber) VALUES 
(1, 1, '2024-11-30', '4941 6th avenue, Niagara Falls', 'TRACK123'),
(2, 2, '2024-11-30', '234 Second St, Niagara Falls', 'TRACK234'),
(3, 3, '2024-11-30', '567 Third St, St.Catherins', 'TRACK345'),
(4, 4, '2024-12-01', '890 Fourth St, Toronto', 'TRACK456'),
(5, 5, '2024-12-02', '345 Fifth St, Kingston', 'TRACK567'),
(6, 6, '2024-12-03', '456 Sixth Ave, Ottawa', 'TRACK678'),
(7, 7, '2024-12-04', '567 Seventh St, Vancouver', 'TRACK789'),
(8, 8, '2024-12-05', '678 Eighth Ave, Calgary', 'TRACK890'),
(9, 9, '2024-12-06', '789 Ninth St, Montreal', 'TRACK901'),
(10, 10, '2024-12-07', '890 Tenth Ave, Edmonton', 'TRACK012');
  
INSERT INTO Warehouses (WarehouseID, WarehouseName, Location, Capacity) VALUES
(1, 'Main Warehouse', 'Warehouse District', 5000),
(2, 'East Coast Warehouse', 'East Coast Logistics', 7000),
(3, 'West Coast Warehouse', 'West Coast Logistics', 6000),
(4, 'Central Warehouse', 'Central Industrial Zone', 8000),
(5, 'North Warehouse', 'Northern Hub', 4500),
(6, 'South Warehouse', 'Southern Logistics Park', 4000),
(7, 'Overseas Warehouse', 'International Trade Center', 3000),
(8, 'Suburban Warehouse', 'Suburban Area', 3500),
(9, 'Urban Warehouse', 'City Center', 5500),
(10, 'Remote Warehouse', 'Mountain Logistics Hub', 2500);

INSERT INTO Inventory (InventoryID, ProductID, WarehouseID, QuantityOnHand) VALUES
(1, 101, 1, 50),
(2, 102, 2, 30),
(3, 103, 3, 15),
(4, 104, 4, 45),
(5, 105, 5, 20),
(6, 106, 6, 10),
(7, 101, 7, 25),
(8, 102, 8, 35),
(9, 103, 9, 5),
(10, 104, 10, 12);

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod) VALUES 
(1, 1, '2024-11-29', 699.99, 'Credit Card'),
(2, 2, '2024-11-29', 499.99, 'PayPal'),
(3, 3, '2024-11-30', 89.99, 'Debit Card'),
(4, 4, '2024-12-01', 1299.99, 'Credit Card'),
(5, 5, '2024-12-02', 19.99, 'Gift Card'),
(6, 6, '2024-12-03', 599.99, 'PayPal'),
(7, 7, '2024-12-04', 14.99, 'Cash'),
(8, 8, '2024-12-05', 7.99, 'Debit Card'),
(9, 9, '2024-12-06', 5.99, 'Credit Card'),
(10, 10, '2024-12-07', 899.99, 'Bank Transfer');

/*udating more rows in table*/
/*products*/
INSERT INTO Products VALUES 
(111, 'Toy Car', 'Miniature toy car for kids', 19.99, 200, 6),
(112, 'Car Tires', 'All-weather car tires', 99.99, 50, 7),
(113, 'Novel', 'Thrilling mystery novel', 12.99, 100, 8),
(1140, 'Organic Apples', 'Fresh organic apples', 3.99, 500, 9),
(115, 'Shampoo', 'Herbal shampoo for daily use', 7.99, 150, 10);

/* customers*/
INSERT INTO Customers  VALUES 
(11, 'Rajesh Singh', 'Rajesh', '876-543-2109', 'rajesh.singh@gmail.com', '321 New Rd, Delhi'),
(12, 'Anjali Sharma', 'Anjali', '543-210-9876', 'anjali.sharma@gmail.com', '654 Sunset Blvd, Mumbai'),
(13, 'Pooja Patel', 'Pooja', '210-987-6543', 'pooja.patel@gmail.com', '123 Moonlight Ave, Pune'),
(14, 'Aditya Rao', 'Aditya', '345-678-9012', 'aditya.rao@gmail.com', '987 Evergreen St, Chennai'),
(15, 'Neha Mehta', 'Neha', '567-890-1234', 'neha.mehta@gmail.com', '234 Oak Rd, Bangalore');

/* suppliers*/
INSERT INTO Suppliers VALUES 
(11, 'Toy World Ltd.', 'Tanjiro', '321-654-9871', 'contact@toyworld.com', '123 Toy St, Kid City'),
(12, 'Auto Parts Pro', 'Rengoku', '654-321-0987', 'info@autopartspro.com', '456 Car Ave, Mechanic City'),
(13, 'Books Galore', 'Jimbei', '987-654-3210', 'books@books.com', '789 Read Blvd, Lit City'),
(14, 'Green Grocers', 'Ace', '654-987-1230', 'info@greengrocers.com', '101 Organic Ln, Fresh Town'),
(15, 'Beauty Essentials', 'Sabo', '321-987-6542', 'support@beautyessentials.com', '202 Beauty Rd, Glam City');

/*orders*/
INSERT INTO Orders VALUES 
(11, '2024-12-05', 5, 19.99), 
(12, '2024-12-06', 6, 99.99), 
(13, '2024-12-07', 7, 12.99), 
(14, '2024-12-07', 8, 3.99), 
(15, '2024-12-08', 9, 7.99);

/*orderdetails*/
INSERT INTO OrderDetails  VALUES 
(11, 11, 107, 6, 19.99),
(12, 12, 108, 8, 99.99),
(13,13, 109, 3, 12.99),
(14, 14, 110, 13, 3.99),
(15, 15, 111, 12, 7.99);

/*shipments*/
INSERT INTO Shipments VALUES 
(11, 11, '2024-12-06', '321 New Rd, Delhi', 'TRACK112'),
(12, 12, '2024-12-07', '654 Sunset Blvd, Mumbai', 'TRACK223'),
(13, 13, '2024-12-08', '123 Moonlight Ave, Pune', 'TRACK334'),
(14, 14, '2024-12-09', '987 Evergreen St, Chennai', 'TRACK445'),
(15, 15, '2024-12-10', '234 Oak Rd, Bangalore', 'TRACK556');


/*inventory*/
INSERT INTO Inventory VALUES 
(11, 107, 4, 150),
(12, 108, 5, 30),
(13, 109, 6, 80),
(14, 110, 7, 400),
(15, 111, 8, 100);

/*payments*/
INSERT INTO Payments VALUES 
(11, 11, '2024-12-05', 19.99, 'Credit Card'),
(12, 12, '2024-12-06', 99.99, 'PayPal'),
(13, 13, '2024-12-07', 12.99, 'Debit Card'),
(14, 14, '2024-12-08', 3.99, 'Credit Card'),
(15, 15, '2024-12-09', 7.99, 'Debit Card');




 
/* update command for DML*/
/* product*/
UPDATE Products 
SET Description = 'High-quality sound system for home use' 
WHERE ProductID = 107;

UPDATE Customers 
SET ContactName = 'Sai Kumar', 
    Email = 'sai.kumar.gurram@gmail.com' 
WHERE CustomerID = 2;

UPDATE Orders 
SET TotalAmount = 899.99 
WHERE OrderID = 5;

UPDATE Orders 
SET TotalAmount = 1299.99 
WHERE OrderID = 6;

UPDATE Inventory 
SET QuantityOnHand = QuantityOnHand + 10 
WHERE ProductID = 105 AND WarehouseID = 1;

UPDATE Warehouses 
SET Location = 'East Coast Hub', 
    Capacity = 7500 
WHERE WarehouseID = 2;
/* Delete command*/

DELETE FROM Suppliers 
WHERE SupplierID NOT IN (
    SELECT DISTINCT SupplierID 
    FROM Inventory
);

/* DQL commands*/

/*Simple Select Query*/
SELECT * FROM Products;

/*Select with Filtering (WHERE Clause)*/
SELECT Name, Price 
FROM Products 
WHERE Price > 500;

/*Sorting Data (ORDER BY Clause)*/
SELECT CustomerName, Phone, Email 
FROM Customers 
ORDER BY CustomerName ASC;

/*Grouping Data (GROUP BY Clause)*/
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts 
FROM Products p 
JOIN Categories c ON p.CategoryID = c.CategoryID 
GROUP BY c.CategoryName;

/*Aggregate Functions*/
SELECT AVG(Price) AS AveragePrice 
FROM Products;

/*Join Queries*/
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.TotalAmount 
FROM Orders o 
JOIN Customers c ON o.CustomerID = c.CustomerID;

/*Retrieve products and their warehouse quantities:*/
SELECT p.Name AS ProductName, w.WarehouseName, i.QuantityOnHand 
FROM Inventory i 
JOIN Products p ON i.ProductID = p.ProductID 
JOIN Warehouses w ON i.WarehouseID = w.WarehouseID;

/*Using Subqueries*/
SELECT Name 
FROM Products 
WHERE ProductID IN (
    SELECT ProductID 
    FROM OrderDetails od 
    JOIN Orders o ON od.OrderID = o.OrderID 
    WHERE o.CustomerID = 1
);

/*Using Aliases*/
SELECT p.Name AS ProductName, c.CategoryName 
FROM Products p 
JOIN Categories c ON p.CategoryID = c.CategoryID;

/*Combining Data (UNION)*/
SELECT Name AS ProductName, 'In Stock' AS StockStatus 
FROM Products 
WHERE StockQuantity > 0
UNION
SELECT Name AS ProductName, 'Out of Stock' AS StockStatus 
FROM Products 
WHERE StockQuantity = 0;

/*Using CASE Statements*/
SELECT Name, Price, 
    CASE 
        WHEN Price < 100 THEN 'Budget' 
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid-Range' 
        ELSE 'Premium' 
    END AS PriceCategory 
FROM Products;

/*DDL AND DMLcommand for table*/
ALTER TABLE Products 
ADD SupplierID INT,
ADD FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

INSERT INTO Products (ProductID, Name, Description, Price, StockQuantity, CategoryID, SupplierID) VALUES
(116, 'Washing Machine', 'High-efficiency washing machine', 499.99, 30, 2, 2),  
(117, 'Bluetooth Speaker', 'Portable wireless speaker', 79.99, 40, 1, 1),    
(118, 'Leather Jacket', 'Stylish leather jacket', 199.99, 10, 3, 3),        
(119, 'LED TV', 'Smart 50-inch LED TV', 799.99, 15, 1, 2),         
(120, 'Sports Shoes', 'Durable running shoes', 129.99, 25, 5, 3);
