CREATE FUNCTION CalculateTotalPrice (
    p_price DECIMAL(10, 2),
    p_quantity INT
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN p_price * p_quantity;
END;

SELECT CalculateTotalPrice(50.00, 3) AS TotalPrice;
