-- RIGHT JOIN --

USE ECommerceDB;

-- RIGHT JOIN:
	-- returns a table with all data from right table and matched data from left table
    -- if no matching row exists in left table, its columns are returned as NULL
    
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
	FROM Customers C
    RIGHT JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
    
-- In this particular DB (with current data), results may appear same as INNER JOIN
    -- because every order currently has a matching customer

-- However, in general:
    -- RIGHT JOIN can differ from INNER JOIN
    -- because Orders can exist without Customers (due to ON DELETE SET NULL)
    -- in such cases, RIGHT JOIN will include those rows with NULL customer data

-- However, just to understand how table will look, we can implement query in slightly different way
	-- (Left Table: Orders, Right Table: Customers)
SELECT O.ORDER_ID, O.TOTAL_AMOUNT, C.CUSTOMER_ID, C.CUSTOMER_NAME
	FROM Orders O
    RIGHT JOIN Customers C
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
    
-- So, we can imply
	-- (A LEFT JOIN B) ≡ (B RIGHT JOIN A), i.e., logically equivalent