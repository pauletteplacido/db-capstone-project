CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `ordersview` AS
    SELECT 
        `orders`.`orderID` AS `orderID`,
        `orders`.`quantity` AS `quantity`,
        `orders`.`totalCost` AS `totalCost`
    FROM
        `orders`
    WHERE
        (`orders`.`quantity` > 2)
    ORDER BY `orders`.`orderID`