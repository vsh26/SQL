-- FULL JOIN --

USE ECommerceDB;

-- FULL JOIN:
	-- returns all rows from both tables, when there is a match on either table
		-- Matching rows -> combined
		-- Left-only rows -> NULL on right
		-- Right-only rows -> NULL on left
        
	-- Emulated using LEFT and RIGHT JOINS
		-- (...LEFT JOIN... UNION ... RIGHT JOIN ...)
        
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
	FROM Customers C
    LEFT JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID
    
    UNION
    
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
	FROM Customers C
    RIGHT JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
    
-- Both queries (LEFT JOIN Query and RIGHT JOIN Query) must have:
	-- Same number of columns
	-- Same order of columns
	-- Compatible data types

-- UNION vs UNION ALL
	-- UNION: Remove duplicates
	-- UNION ALL: Keep duplicates
    
    -- Example:
        -- LEFT JOIN returns 6 rows
        -- RIGHT JOIN returns 5 rows
        -- 5 rows are common
        
        -- Total rows = 6 + 5 = 11
        -- Duplicate rows = 5
        -- Final result using UNION = 11 - 5 = 6 rows
	
-- A direct join between Customers and Products is not meaningful
	-- because there is no direct relationship or foreign key between them.
-- However, they can be joined indirectly through intermediate tables:
		-- Customers → Orders → OrderItems → Products
-- This indirect relationship allows us to retrieve meaningful data,
    -- such as which products were purchased by which customers.