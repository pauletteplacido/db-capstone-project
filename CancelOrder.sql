CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN orderIDParam INT)
BEGIN
    -- Verificar si la orden existe
    IF EXISTS (SELECT 1 FROM orders WHERE orderID = orderIDParam) THEN
        -- Actualizar el estado de la orden a "cancelada"
        UPDATE orders
        SET orderStatus = 'Canceled'
        WHERE orderID = orderIDParam;

        SELECT 'Order canceled.' AS Result;
    ELSE
        SELECT 'Order not found.' AS Result;
    END IF;
END