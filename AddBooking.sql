DELIMITER $$
CREATE PROCEDURE CancelBooking (IN p_bookingID INT)
BEGIN
DELETE FROM bookings
WHERE bookingID = p_bookingID;
END$$
DELIMITER ;

CALL CancelBooking(9);