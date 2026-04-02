-- INNER JOIN --

USE ECommerceDB;

-- INNER JOIN:
	-- It returns only the rows where matching data exists in both the tables
    
    -- Customers with orders (Vishal, Amit, Raj) -> included
	-- Customers without orders (Sara, Neha, Anya) -> excluded

-- Using Fully Qualified Naming
SELECT Customers.CUSTOMER_ID, Customers.CUSTOMER_NAME, Orders.ORDER_ID, Orders.TOTAL_AMOUNT
	FROM Customers
	INNER JOIN Orders
    ON Customers.CUSTOMER_ID = Orders.REF_CUSTOMER_ID;
    
-- Using Alias
    
    -- Change Table Name (To avoid repetitive writing)
	SELECT C.CUSTOMER_ID , C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
		FROM Customers AS C
		INNER JOIN Orders AS O
		ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
        
	-- AS is Optional
	SELECT C.CUSTOMER_ID , C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
		FROM Customers C
		INNER JOIN Orders O
		ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
        
	-- Change Column Name
    SELECT
		C.CUSTOMER_ID AS C_ID,
        C.CUSTOMER_NAME AS C_NAME,
        O.ORDER_ID AS O_ID,
        O.TOTAL_AMOUNT AS O_AMT
	FROM Customers C
    INNER JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
    
    -- Using AS is optional
    SELECT
		C.CUSTOMER_ID C_ID,
        C.CUSTOMER_NAME C_NAME,
        O.ORDER_ID O_ID,
        O.TOTAL_AMOUNT O_AMT
	FROM Customers C
    INNER JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;