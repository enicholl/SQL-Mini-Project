USE Northwind
SELECT TOP(1) [Order Details].OrderID, ROUND(SUM(UnitPrice*Quantity), 2) AS PriceTotal, ROUND(SUM((UnitPrice*Quantity)*Discount), 2) AS Reduction 
FROM [Order Details]
GROUP BY OrderID
Order BY Reduction DESC;
