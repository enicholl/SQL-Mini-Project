USE Northwind
SELECT ProductName, CompanyName, Country FROM Products AS P
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
WHERE QuantityPerUnit LIKE '%bottles%';
