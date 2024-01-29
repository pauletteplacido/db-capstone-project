SET @customerID = 1;

PREPARE GetOrderDetail FROM 'SELECT orderID, quantity, totalCost FROM orders WHERE customerID = ?';

EXECUTE GetOrderDetail USING @customerID;

DEALLOCATE PREPARE GetOrderDetail;
