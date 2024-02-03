drop procedure AddValidBooking;
DELIMITER $$

CREATE PROCEDURE `AddValidBooking` (in bookingDate date, 
	in tableNumber int,
	out result varchar(255))
BEGIN
	DECLARE bookTable int;
    SELECT COUNT(*) INTO bookTable
    FROM bookings
    WHERE bookingDate = bookingDate AND tableNumber = tableNumber;
	if bookTable > 0 then
		set result = 'The table is already reserved on that date';
	else
		insert into bookings(bookingDate, tableNumber) values(p_bookingDate, p_tableNumber);
		set result ='Successful reservation';
	end if;
END$$
DELIMITER ; 

START TRANSACTION;

CALL AddValidBooking('2022-12-17', 3, @resultado);

SELECT @resultado AS resultado;

COMMIT;