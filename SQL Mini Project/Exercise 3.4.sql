USE Northwind

SELECT STR(MONTH(OrderDate)) + ' - ' + RIGHT(STR(YEAR(OrderDate)), 2) AS 'Month And Year', (SUM(DATEDIFF(d, OrderDate, ShippedDate)) / COUNT(OrderID)) AS 'Average Ship Time' 
FROM Orders
GROUP BY MONTH(OrderDate), YEAR(OrderDate);