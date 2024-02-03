CREATE DEFINER=`root`@`localhost` PROCEDURE `chekBookings`(in bokkingDate Date, in tableNumber int)
BEGIN
select bookingDate, tableNumber from bookings;
END