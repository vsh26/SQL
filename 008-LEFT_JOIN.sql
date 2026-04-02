-- LEFT JOIN --

USE ECommerceDB;

-- LEFT JOIN:
	-- returns a resulting table with all data from left table and matched data from right table
    -- if no matching row exists in right table, its columns are returned as NULL
    
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
	FROM Customers C
    LEFT JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;