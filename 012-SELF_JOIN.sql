-- SELF JOIN --

USE EcommerceDB;

-- SELF JOIN --
	-- joining a table with itself
    -- we treat the same table as two different tables
    -- used when rows in a table are related to other rows in the same table
		-- Exa: Employee table (manager is also an employee)
    -- SELF JOIN is emulated using:
		-- INNER JOIN
        -- Alias (to differentiate between instances of the same table)

-- Find customers in same location
SELECT 
    C1.CUSTOMER_NAME,
    C2.CUSTOMER_NAME,
    C1.CITY
FROM Customers C1
JOIN Customers C2
ON C1.CITY = C2.CITY
AND C1.CUSTOMER_ID <> C2.CUSTOMER_ID; -- <> : Not equal to

-- Find orders with same amount
SELECT
	O1.ORDER_ID,
    O2.ORDER_ID,
    O1.TOTAL_AMOUNT
FROM Orders O1
INNER JOIN Orders O2
ON O1.TOTAL_AMOUNT = O2.TOTAL_AMOUNT
AND O1.ORDER_ID <> O2.ORDER_ID;

-- Products in same category
SELECT
	P1.PRODUCT_NAME,
    P2.PRODUCT_NAME,
    P1.CATEGORY
FROM Products P1
INNER JOIN Products P2
ON P1.CATEGORY = P2.CATEGORY
AND P1.PRODUCT_NAME <> P2.PRODUCT_NAME;

-- Remove mirror pairs
SELECT
	P1.PRODUCT_NAME,
    P2.PRODUCT_NAME,
    P1.CATEGORY
FROM Products P1
INNER JOIN Products P2
ON P1.CATEGORY = P2.CATEGORY
AND P1.PRODUCT_NAME < P2.PRODUCT_NAME;