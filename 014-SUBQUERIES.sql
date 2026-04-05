-- SUBQUERIES --

-- Definition:
    -- A subquery is a query written inside another query
    -- The inner query executes first, and its result is used by the outer query


-- BASIC STRUCTURE

    SELECT ...
    FROM ...
    WHERE column OPERATOR (
        SELECT ...
    );


-- TYPES OF SUBQUERIES
	-- SINGLE-VALUE (SCALAR) SUBQUERY
    -- MULTI-VALUE SUBQUERY
    -- CORRELATED SUBQUERY


-- 1. SINGLE-VALUE (SCALAR) SUBQUERY
    -- Returns exactly one value

    -- Exa: Customers from same city as Vishal

    SELECT CUSTOMER_NAME
    FROM Customers
    WHERE CITY = (
        SELECT CITY
        FROM Customers
        WHERE CUSTOMER_NAME = 'Vishal'
    );


-- 2. MULTI-VALUE SUBQUERY
    -- Returns multiple values

    -- Exa: Customers who placed orders

    SELECT CUSTOMER_ID
    FROM Customers
    WHERE CUSTOMER_ID IN (
        SELECT REF_CUSTOMER_ID FROM Orders
    );


-- 3. CORRELATED SUBQUERY
    -- Inner query depends on outer query
    -- Runs once for each row of outer query

    -- Exa: Customers who never placed orders

    SELECT CUSTOMER_ID
    FROM Customers C
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders O
        WHERE O.REF_CUSTOMER_ID = C.CUSTOMER_ID
    );


-- KEY DIFFERENCE

    -- Normal subquery: runs once
    -- Correlated subquery: runs for each row


-- WHERE CAN SUBQUERIES BE USED?

	-- 1. IN WHERE CLAUSE

		SELECT *
		FROM Customers
		WHERE CUSTOMER_ID IN (
			SELECT REF_CUSTOMER_ID FROM Orders
		);


	-- 2. IN SELECT CLAUSE

		-- Exa: Get order count per customer

		SELECT 
			C.CUSTOMER_NAME,
			(
				SELECT COUNT(*)
				FROM Orders O
				WHERE O.REF_CUSTOMER_ID = C.CUSTOMER_ID
			) AS ORDER_COUNT
		FROM Customers C;


	-- 3. IN FROM CLAUSE (DERIVED TABLE)

		SELECT *
		FROM (
			SELECT REF_CUSTOMER_ID, COUNT(*) AS TOTAL_ORDERS
			FROM Orders
			GROUP BY REF_CUSTOMER_ID
		) AS T;


-- IMPORTANT OPERATORS

    -- =           : single value
    -- IN          : multiple values
    -- EXISTS      : checks if any row exists
    -- NOT EXISTS  : checks if no row exists

-- JOIN vs SUBQUERY

    -- JOIN:
        -- Combines tables (horizontal)
        -- Usually faster

    -- SUBQUERY:
        -- Filters based on another query (vertical logic)
        -- Sometimes easier to understand