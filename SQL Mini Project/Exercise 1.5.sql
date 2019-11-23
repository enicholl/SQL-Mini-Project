USE Northwind
SELECT (TitleOfCourtesy + ' ' + FirstName + ' ' + LastName) AS 'Name', City 
FROM Employees
WHERE Country = 'UK';
