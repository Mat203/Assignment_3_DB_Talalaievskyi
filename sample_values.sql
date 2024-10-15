USE BaluvanaStore

-- Insert sample data into Stores
INSERT INTO Stores (address, storeManagerID) VALUES
('123 Main St, Cityville', 1),
('456 Oak Ave, Townsville', 2),
('789 Maple Blvd, Metropolis', 3),
('101 Pine St, Rivercity', 4),
('202 Cedar St, Hilltown', 5);

-- Insert some Employees who are store managers
INSERT INTO Employees (name, storeID, position) VALUES
('Alice', 1, 'Store Manager'),
('Bob', 2, 'Store Manager'),
('Charlie', 3, 'Store Manager'),
('David', 4, 'Store Manager'),
('Eva', 5, 'Store Manager');

-- Insert sample data into Payments
INSERT INTO Payments (paymentType, isApproved) VALUES
('Google Pay', TRUE),
('Apple Pay', TRUE),
('cash', FALSE),
('Google Pay', TRUE),
('Apple Pay', FALSE);

-- Insert sample data into ProductsCatalog
INSERT INTO ProductsCatalog (productName, price, supplierID) VALUES
('Laptop', 1000.00, 1),
('Mouse', 25.50, 1),
('Keyboard', 50.00, 2),
('Monitor', 200.00, 3),
('Printer', 150.00, 3),
('Desk Chair', 85.00, 4),
('Office Desk', 150.00, 5),
('Phone', 800.00, 2),
('Tablet', 400.00, 4),
('USB Cable', 10.00, 1);

-- Insert sample data into OrderDetails
INSERT INTO OrderDetails (orderID, productID, quantity) VALUES
(1, 1, 1),  
(2, 2, 2),  
(3, 3, 1),  
(4, 4, 1),  
(5, 5, 1),  
(6, 6, 2),  
(7, 7, 1),  
(8, 8, 1),  
(9, 9, 1),  
(10, 10, 5),
(1, 2, 3),  
(2, 3, 1);  

SELECT * FROM Stores;

INSERT INTO Orders (customerID, storeID, sum, paymentID) VALUES
(1, 1, 50.00, 1),
(2, 2, 75.50, 2),
(3, 3, 100.00, 3),
(4, 4, 25.99, 4),
(5, 4, 120.75, 5),
(1, 2, 80.40, 2);

INSERT INTO StoreInventory (storeID, productID, quantity) VALUES
(1, 1, 10),   
(1, 2, 25),   
(2, 3, 15),   
(2, 4, 5),    
(3, 5, 8),    
(3, 6, 12),   
(4, 7, 6),    
(4, 8, 10),  
(5, 9, 7),    
(5, 10, 50); 