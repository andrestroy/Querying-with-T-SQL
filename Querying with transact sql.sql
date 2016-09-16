-- Schemas are namespaces for database objects.
-- Fully-qualified names:
-- [server_name.][database_name.][schema_name.]object_name
-- at least specify the schema_name.object_name
-----------------------------------------------------------
-- Data Manipulation Language (DML)
-- SELECT, INSERT, UPDATE, DELETE
-- Data Definition Language (DDL)
-- CREATE
-- ALTER
-- DROP
-- Data Control Language (DCL)
-- GRANT
-- REVOKE
-- DENY
------------------------- SELECT Basis ----------------------------------
-- WHERE filter before we grouped it up.
-- HAVING filters after you aggregated it.
SELECT SellEndDate, COUNT(Size)
FROM SalesLT.Product
WHERE Color = 'Red'
Group By SellEndDate
Having SellEndDate IS NOT NULL
ORDER BY SellEndDate


---------------- Order of execution of Select statement
--5 SELECT <select list>
--1 FROM <table source>
--2 WHERE <search condition>
--3 GROUP BY <group by list>
--4 HAVING <search condition>

-- Concatonate in SQL
SELECT Name +  ProductNumber as ProductDescription FROM SalesLT.Product

-- something + NULL = NULL
-- cannot add one type to another data type, i.e. int + nvarchar

--- WORKING WITH DATA TYPES ---------------------
--DataTypes: Exact Numeric ( tinyint, smallint, int, bigint), Approximate Numeric (float, real), Character( char, varchar, text), Date/Time, Binary, Other.
-- Implicit conversion: Compatible data types can be automatically converted.
-- Explicit Conversion: 
-- CAST, TRY_CAST, CONVERT, TRY_CONVERT, PARSE, TRY_PARSE, STR
-- CAST

SELECT CAST(ProductID as varchar(3)) + ':' + Name as ProductName, ProductID
FROM SalesLT.Product

-- CONVERT
SELECT CONVERT(varchar(3), ProductID) + ':' + Name as ProductName, ProductID
FROM SalesLT.Product

-- CONVERT DATES

SELECT SellEndDate, 
	CONVERT(nvarchar(30), SellEndDate) as ConvertedDate,
	CONVERT(nvarchar(30), SellStartDate, 126) as ISO8601FormatDate 
FROM SalesLT.Product

-- TRY to CAST
SELECT Name, TRY_CAST(Size as INTEGER) as NumericSize, *
FROM SalesLT.Product

=========== Working with NULLs ================
--2 + NULL = NULL
--'MyString' + NULL = NULL
-- using compare
-- IF NULL = NULL returns false
-- IF NULL IS NULL returns true
------------- NULL functions -------
-- ISNULL(column/variable, value)
-- returns value if the column or variable is NULL, otherwise return the column value.

SELECT ISNULL(SizeIds, 0)
FROM Product

-- NULLIF(column/variable, value)
-- Returns NULL if the column or variable is value.

SELECT NULLIF(HasOptions, 0)
FROM Product


-- COALESCE(column/variable1, column/variable2,..)
-- Returns the value of the first non-NULL column or variable in the list

SELECT COALESCE(SizeIds, Image)
FROM Product

-- REMOVE DUPLICATES In Transact SQL
-- Using of DISCTINCT Keyword.
-- ORDER BY, by default is ASC
-- TOP keywork
-- OFFSET keyword

SELECT * FROM ProductSize
ORDER BY Price DESC
OFFSET 4 ROWS -- Start selecting by jumping 4 rows
FETCH NEXT 5 ROWS ONLY -- select only 5 rows from the start index (4)

-- TOP WITH TIES returns also the additional items that honor the order by clause
-- of the last item returned.
-- i.e.
SELECT TOP 8 WITH TIES * FROM dbo.ProductOption
ORDER BY Type

Id  Type    Name    Factor  IsPizzaOption   IsSaladOption
13  cheese  Feta    1   1   1
14  cheese  Fontina & Swiss 1   1   1
15  cheese  Soy 1   1   1
16  cheese  Cheddar 1   1   1
17  cheese  Ricotta 1   1   1
18  cheese  Gorgonzola  1   1   1
19  cheese  Mozzarella  1   1   1
1   crust   Classic Crust   0   1   0
2   crust   Wheat Crust 0   1   0
3   crust   Gluten-free Crust   0   1   0

-- this should return only 8 results, but since there are 2 additional items
-- that has the same type (crust) those are also returned.

-- Filtering and Using Predicates.
-- =<> compares values for equality
-- IN Deermines whether a specified value matches any value in a subquery or a list.
-- BETWEEN Specifies an inclusive range to test.

SELECT SellStartDate FROM SalesLT.Product WHERE SellStartDate BETWEEN '1998/06/01' AND '2001/07/01'

-- LIKE Determines whether a specific character string matches a specified pattern
-- which can include wildcards.

SELECT * FROM SalesLT.Product WHERE ProductNumber LIKE 'FR-_[0-9]%'
-- the _ means any literal
-- the [0-9] specifies that a number between 0 and 9 is required.


-- AND Combines two Boolean expressions and returns TRUE only when 
-- both are TRUE
-- OR  Combines two Boolean expression and returns OR if either is TRUE
-- NOT Reverses the result of a search condition.


