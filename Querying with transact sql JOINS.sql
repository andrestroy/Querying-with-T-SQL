--INNER JOINS (same than JOIN, INNER keyword is optional)

SELECT SalesLT.Product.Name AS ProductName, SalesLT.ProductCategory.Name As Category
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
    ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID

-- OUTER JOINs (OUTER keyword is optional)
-- returns all rows from one table and any matching rows from second table.
-- One table's rows are "preserved"
-- * designated with LEFT, RIGHT, FULL (unusual)
-- * All rows from preserved table output to result set.
-- NULLs added in places where attributes do not match

-- Get all customers, with sales orders for those who've bought anything
SELECT c.FirstName, c.LastName, ohead.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS ohead
ON c.CustomerID = ohead.CustomerID
ORDER BY c.CustomerID

-- Get all customers, with sales orders for those who haven't purchased anything
SELECT c.FirstName, c.LastName, ohead.SalesOrderNumber
FROM SalesLT.Customer AS c
 LEFT JOIN SalesLT.SalesOrderHeader AS ohead
ON c.CustomerID = ohead.CustomerID 
WHERE ohead.SalesOrderNumber IS  NULL

ORDER BY c.CustomerID
