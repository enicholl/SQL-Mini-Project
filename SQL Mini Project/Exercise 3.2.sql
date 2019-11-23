USE Northwind
SELECT S.CompanyName, ROUND(SUM(OD.UnitPrice * Quantity * (1 - Discount)),0) AS SupplierTotal FROM Products AS P
JOIN [Order Details] AS OD on OD.ProductID = P.ProductID
JOIN Suppliers AS S on S.SupplierID = P.SupplierID
GROUP BY S.CompanyName
HAVING ROUND(SUM(OD.UnitPrice * Quantity * (1 - Discount)),0) > 10000
ORDER BY SupplierTotal DESC;