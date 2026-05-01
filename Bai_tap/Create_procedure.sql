use classicmodels;
select * from customers c where customerName='Land of Toys Inc .';
DELIMITER //

CREATE PROCEDURE findallcustomer()
BEGIN
    SELECT * FROM customers;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE getCusById (IN cusNum INT(11))
BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;
call getCusByID(175);
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(
    IN  in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END//

DELIMITER ;
call GetCustomersCountByCity('Lyon',@total);
select @total;

