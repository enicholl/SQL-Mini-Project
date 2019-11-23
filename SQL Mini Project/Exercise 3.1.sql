USE Northwind
SELECT A.EmployeeID, A.Name, B.Name AS 'Reports to' FROM
(SELECT EmployeeID, FirstName + ' ' + LastName AS 'Name', ReportsTo FROM Employees) AS A
LEFT JOIN
(SELECT EmployeeID, FirstName + ' ' + LastName AS 'Name', ReportsTo FROM Employees) AS B
ON A.ReportsTo = B.EmployeeID;