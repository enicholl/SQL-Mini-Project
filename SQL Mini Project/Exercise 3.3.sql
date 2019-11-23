USE Northwind
--Which year is latest year in Orders file?
--SELECT ShippedDate FROM Orders
--ORDER BY ShippedDate DESC;
--Latest year = 1998

SELECT TOP(10) CompanyName, SUM([Total Value of Orders Shipped YTD]) AS 'Total Value Shipped in 1998' FROM
(SELECT Orders.OrderID, ShippedDate, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)),0) AS 'Total Value of Orders Shipped YTD'  
FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Orders.OrderID, ShippedDate
HAVING YEAR(ShippedDate) = 1998) AS A
JOIN 
(SELECT OrderID, CompanyName FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID) AS B
ON A.OrderID = B.OrderID
GROUP BY CompanyName 
ORDER BY SUM([Total Value of Orders Shipped YTD]) DESC;