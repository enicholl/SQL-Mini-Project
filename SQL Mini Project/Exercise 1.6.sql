USE Northwind
--Selects the total order value for every region
SELECT RegionDescription, SUM(RegionOrders.TotalValueOfOrder) AS RegionTotalOrderValue FROM
(SELECT OrderID, OrderValues.EmployeeID, TotalValueOfOrder, R.RegionID, R.RegionDescription  
FROM
(SELECT O.EmployeeID, O.OrderID, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)), 0) AS TotalValueOfOrder FROM Orders AS O
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
GROUP BY O.EmployeeID, O.OrderID) AS OrderValues
JOIN EmployeeTerritories AS ET ON ET.EmployeeID = OrderValues.EmployeeID
JOIN Territories AS T ON T.TerritoryID = ET.TerritoryID
JOIN Region AS R ON R.RegionID = T.RegionID
GROUP BY OrderID, OrderValues.EmployeeID, TotalValueOfOrder, R.RegionID, R.RegionDescription) AS RegionOrders
GROUP BY RegionDescription;

--Regions with total sales over 1,000,000
SELECT RegionDescription, SUM(RegionOrders.TotalValueOfOrder) AS RegionTotalOrderValue FROM
(SELECT OrderID, OrderValues.EmployeeID, TotalValueOfOrder, R.RegionID, R.RegionDescription  
FROM
(SELECT O.EmployeeID, O.OrderID, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)), 0) AS TotalValueOfOrder FROM Orders AS O
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
GROUP BY O.EmployeeID, O.OrderID) AS OrderValues
JOIN EmployeeTerritories AS ET ON ET.EmployeeID = OrderValues.EmployeeID
JOIN Territories AS T ON T.TerritoryID = ET.TerritoryID
JOIN Region AS R ON R.RegionID = T.RegionID
GROUP BY OrderID, OrderValues.EmployeeID, TotalValueOfOrder, R.RegionID, R.RegionDescription) AS RegionOrders
GROUP BY RegionDescription 
HAVING SUM(RegionOrders.TotalValueOfOrder) > 1000000;
--No region has a sales total greater than 1,000,000