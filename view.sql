CREATE VIEW OrderSummary AS
SELECT 
    o.id AS orderID,
    CONCAT(c.name, ' ', c.surname) AS customerNameSurname,
    s.address AS storeAddress,
    o.sum AS totalSum,
    p.isApproved AS paymentStatus
FROM 
    Orders o
JOIN 
    Customers c ON o.customerID = c.id
JOIN 
    Stores s ON o.storeID = s.id
JOIN 
    Payments p ON o.paymentID = p.id;
   
