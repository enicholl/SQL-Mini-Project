USE Northwind
SELECT CustomerID, CompanyName, Address + ', ' + City + ', ' + PostalCode + ', ' + Country AS CompanyAddress
FROM Customers
WHERE City = 'Paris' OR City = 'London';
