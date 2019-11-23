USE Northwind
SELECT CategoryName, COUNT(C.CategoryID) AS ProductsPerCategory
FROM Products AS P
JOIN Categories AS C on P.CategoryID = C.CategoryID
GROUP BY C.CategoryID, C.CategoryName
ORDER BY COUNT(C.CategoryID) DESC;
