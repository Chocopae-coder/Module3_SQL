use classicmodels;
select * from customers c where customerName='Land of Toys Inc .';
DELIMITER //

CREATE PROCEDURE findallcustomer()
BEGIN
    SELECT * FROM customers;
END //

DELIMITER ;

