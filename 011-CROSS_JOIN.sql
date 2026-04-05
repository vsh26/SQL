-- CROSS JOIN --

USE ECommerceDB;

-- CROSS JOIN --
	-- returns all possible combinations of rows from both tables (Cartesian Product)
    -- No relationship between tables is required
    -- Useful in generating combinations, test data, etc.
    
SELECT C.CUSTOMER_NAME, P.PRODUCT_NAME
FROM Customers C
CROSS JOIN Products P;