CREATE DATABASE BaluvanaStore

USE BaluvanaStore


-- Customers Table
CREATE TABLE Customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    isLogin BOOLEAN DEFAULT FALSE,
    city VARCHAR(100) NOT NULL
);

CREATE INDEX idx_customers_email ON Customers(email);


-- Payments Table
CREATE TABLE Payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    paymentType ENUM('Google Pay', 'Apple Pay', 'cash') NOT NULL,
    isApproved BOOLEAN DEFAULT FALSE
);

CREATE INDEX idx_payments_isApproved ON Payments(isApproved);


-- Suppliers Table
CREATE TABLE Suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    storeID INT NOT NULL,
    position VARCHAR(100) NOT NULL
);

-- ProductsCatalog Table
CREATE TABLE ProductsCatalog (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES Suppliers(id)
);

-- Stores Table
CREATE TABLE Stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    storeManagerID INT UNIQUE, 
    FOREIGN KEY (storeManagerID) REFERENCES Employees(id)
);

-- StoreInventory Table
CREATE TABLE StoreInventory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    storeID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (storeID) REFERENCES Stores(id),
    FOREIGN KEY (productID) REFERENCES ProductsCatalog(id)
);

-- Orders Table
CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT NOT NULL,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    storeID INT NOT NULL,
    sum DECIMAL(10, 2) NOT NULL,
    paymentID INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(id),
    FOREIGN KEY (storeID) REFERENCES Stores(id),
    FOREIGN KEY (paymentID) REFERENCES Payments(id)
);
CREATE INDEX idx_orders_storeID ON Orders(storeID);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    orderID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (orderID, productID),
    FOREIGN KEY (orderID) REFERENCES Orders(id),
    FOREIGN KEY (productID) REFERENCES ProductsCatalog(id)
);