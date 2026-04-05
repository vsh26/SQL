-- SET OPERATIONS --
	-- combine results of multiple SELECT queries row-wise
    -- may return distinct rows depending on operation
    
		-- UNION
        -- UNION ALL
        -- INTERSECTION
        -- MINUS
    
-- JOIN → combine columns (combine tables horizontally)
-- SET  → combine rows (combine results vertically)


	-- UNION
		-- Combines results and removes duplicates
        
        SELECT CUSTOMER_ID FROM Customers
        UNION
        SELECT REF_CUSTOMER_ID FROM Orders;
        
        
	-- UNION ALL
		-- Combines results and keeps duplicates
        
        SELECT CUSTOMER_ID FROM Customers
        UNION ALL
        SELECT REF_CUSTOMER_ID FROM Orders;
        
        
	-- INTERSECTION
		-- Returns rows that exist in both queries
        -- Emulated
        -- Exa: Customers who placed orders
        
			-- Method 1: Using IN
				SELECT CUSTOMER_ID FROM Customers
                WHERE CUSTOMER_ID IN (
					SELECT REF_CUSTOMER_ID FROM Orders
                    );
            
            -- Method 2: Using INNER JOIN (-- INTERSECTION can be emulated using INNER JOIN on matching columns
												-- DISTINCT is used to remove duplicate results if needed)
				SELECT DISTINCT C.CUSTOMER_ID
				FROM Customers C
				INNER JOIN Orders O
                ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;
                
			-- Method 3: If DB supports INTERSECT
				SELECT CUSTOMER_ID FROM Customers
                INTERSECT
                SELECT REF_CUSTOMER_ID FROM Orders;
    
    
    -- MINUS
		-- Returns rows in first query but NOT in second
        -- Emulated
        -- Exa: Customers who never placed orders
        
			-- Method 1: Using NOT IN
				SELECT CUSTOMER_ID
                FROM Customers
                WHERE CUSTOMER_ID NOT IN (
					SELECT REF_CUSTOMER_ID FROM Orders
				);
                    
				-- This is risky if NULL exists
                
			-- Method 2: Using NOT EXISTS
				SELECT CUSTOMER_ID
				FROM Customers C
				WHERE NOT EXISTS (
					SELECT 1
					FROM Orders O
					WHERE O.REF_CUSTOMER_ID = C.CUSTOMER_ID
				);
			
            -- Method 3: Using LEFT JOIN
				SELECT C.CUSTOMER_ID
				FROM Customers C
				LEFT JOIN Orders O
				ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID
				WHERE O.REF_CUSTOMER_ID IS NULL;
                
			
            -- Method 4: If DB supports EXCEPT
				SELECT CUSTOMER_ID FROM Customers
				EXCEPT
				SELECT REF_CUSTOMER_ID FROM Orders;