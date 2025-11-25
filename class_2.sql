-- Querying data

-- fully qualified naming
-- [BikeStores].[sales].[customers]
-- [database].[schema].[table/view]

SELECT * FROM [BikeStores].[sales].[customers];

SELECT first_name FROM [BikeStores].[sales].[customers];

SELECT first_name,last_name FROM [BikeStores].[sales].[customers];


-- Conditions (WHERE)

SELECT * FROM [BikeStores].[sales].[customers] WHERE state = 'NY';

SELECT * FROM [BikeStores].[sales].[customers] WHERE customer_id > 100;

SELECT * FROM [BikeStores].[sales].[customers] WHERE state <> 'NY';

-- operators(AND, OR, NOT, BETWEEN)

SELECT * FROM [BikeStores].[sales].[customers] WHERE customer_id >  100 AND state = 'NY';

SELECT * FROM [BikeStores].[sales].[customers] WHERE phone IS NOT NULL; -- recommended
SELECT * FROM [BikeStores].[sales].[customers] WHERE phone <> 'NULL';
-- IS NOT NULL and <> 'NULL' both are same.

SELECT * 
FROM [BikeStores].[sales].[customers]
WHERE customer_id BETWEEN 101 AND 155;     

-- get
-- last_name : Bates
-- first_name : Marget

SELECT * 
FROM [BikeStores].[sales].[customers]
WHERE last_name = 'Bates' OR first_name= 'Marget';

-- The primary SQL wildcard characters are:

-- 1) % (Percent Sign): Represents zero or more characters.

-- 1.1) SELECT ProductName FROM Products WHERE ProductName LIKE 'A%'; -- Finds products starting with 'A'
-- 1.2) SELECT ProductName FROM Products WHERE ProductName LIKE '%apple%'; -- Finds products containing 'apple'
-- 1.3) SELECT ProductName FROM Products WHERE ProductName LIKE '%e'; -- Finds products ending with 'e'

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  'Aa%';

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  '%x';

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  '%Aaron%';
-- % is called wildcard means milta julta 

-- 2) _ (Underscore): Represents a single character.

-- 2.1)  SELECT City FROM Customers WHERE City LIKE 'L_ndon'; -- Finds 'London' but also 'Landon'
-- 2.2)  SELECT ProductCode FROM Products WHERE ProductCode LIKE 'P_001'; -- Finds 'PA001', 'PB001', etc.

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  'Aa_on';

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  'Da_yl';

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  'Aa%on';

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  'Ch%tte';

-- 3) [] (Square Brackets): Represents any single character within the specified set or range. (Note: Support for [] can vary between different SQL database systems, such as SQL Server.)

-- 3.1) SELECT Name FROM Employees WHERE Name LIKE '[AEIOU]%'; -- Finds names starting with a vowel
-- 3.2) SELECT PartNumber FROM Inventory WHERE PartNumber LIKE '[A-C]%'; -- Finds part numbers starting with A, B, or C

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  '[A-C]%';

-- 4) [^] (Caret within Square Brackets): Represents any single character not within the specified set or range. (Similarly, support can vary.)

-- 4.1)     SELECT Name FROM Employees WHERE Name LIKE '[^AEIOU]%'; -- Finds names not starting with a vowel

SELECT * 
FROM [BikeStores].[sales].[customers]                          
WHERE first_name LIKE  '[^A-C]%';

-- sorting ORDER BY, ASC/DESC(optional but in default will do asc)

SELECT * FROM [BikeStores].[sales].[customers] ORDER BY first_name;
SELECT * FROM [BikeStores].[sales].[customers] ORDER BY first_name, state;
SELECT * FROM [BikeStores].[sales].[customers] ORDER BY state, first_name;

SELECT *
FROM [BikeStores].[sales].[customers]
ORDER BY state DESC, first_name ASC;


SELECT *
FROM [BikeStores].[sales].[customers]
ORDER BY state DESC, first_name DESC;

-- limiting (TOP, OFFSET/FETCH)
-- offset use only with order by
-- OFFSET offset_row_count {ROW | ROWS}
-- FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY

SELECT TOP(15) *
FROM [BikeStores].[sales].[customers];

SELECT *
FROM [BikeStores].[sales].[customers]
ORDER BY first_name
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

-- order by query
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name;

-- offset query
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS;

-- fetch query
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;
