USE Northwind
SELECT COUNT(OrderID) AS 'Orders with freight over 100.00' 
FROM Orders
WHERE Freight > 100.00 AND (ShipCountry = 'USA' or ShipCountry = 'UK');
