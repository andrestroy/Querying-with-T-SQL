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
SELECT ord_add_date, COUNT(ord_number)
FROM ac_order
WHERE ord_status = 'Open'
Group By ord_add_date
HAVING COUNT(ord_number) > 2
ORDER BY ord_add_date

---------------- Order of execution of Select statement
--5 SELECT <select list>
--1 FROM <table source>
--2 WHERE <search condition>
--3 GROUP BY <group by list>
--4 HAVING <search condition>

-- Concatonate in SQL
SELECT prd_type + prd_description as TypeDesc
FROM ac_product 

-- something + NULL = NULL
-- cannot add one type to another data type, i.e. int + nvarchar

--- WORKING WITH DATA TYPES ---------------------
--DataTypes: Exact Numeric ( tinyint, smallint, int, bigint), Approximate Numeric (float, real), Character( char, varchar, text), Date/Time, Binary, Other.
-- Implicit conversion: Compatible data types can be automatically converted.
-- Explicit Conversion: 
-- CAST, TRY_CAST, CONVERT, TRY_CONVERT, PARSE, TRY_PARSE, STR
-- CAST
select cast(prd_code as varchar(2)) + ': ' + prd_name as ProductName 
FROM ac_product

-- CONVERT
select convert(varchar(2), prd_code) + ': ' + prd_name as ProductName
FROM ac_product

-- CONVERT DATES
SELECT prd_add_date,
	CONVERT(nvarchar(30), prd_add_date) as ConvertedDate,
	CONVERT(nvarchar(30), prd_add_date, 126) as ISO8601FormatDate
FROM ac_product

-- TRY to CAST
SELECT prd_name, TRY_CAST (prd_code AS INTEGER) as NumericSize
FROM ac_product