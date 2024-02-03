CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN p_bookingID INT, IN p_bookingDate DATE)
BEGIN
UPDATE bookings SET bookingDate = p_bookingDate
WHERE bookingID = p_bookingID;
END