CREATE PROCEDURE PlaceOrder (
    IN p_customerID INT,
    IN p_storeID INT,
    IN p_paymentID INT,
    IN p_totalSum DECIMAL(10, 2),
    IN p_productID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE temp_orderID INT;

    INSERT INTO Orders (customerID, storeID, sum, paymentID)
    VALUES (p_customerID, p_storeID, p_totalSum, p_paymentID);

    SET temp_orderID = LAST_INSERT_ID();

    INSERT INTO OrderDetails (orderID, productID, quantity)
    VALUES (temp_orderID, p_productID, p_quantity);

    UPDATE StoreInventory
    SET quantity = quantity - p_quantity
    WHERE storeID = p_storeID AND productID = p_productID;

END;

CALL PlaceOrder(1, 2, 1, 150.00, 3, 2);


