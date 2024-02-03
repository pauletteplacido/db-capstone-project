CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN p_bookingID INT)
BEGIN
DELETE FROM bookings
WHERE bookingID = p_bookingID;
END