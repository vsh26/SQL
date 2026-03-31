-- 005-DML_(DATA_MANIPULATION_LANGUAGE) --

	-- INSERT
    -- UPDATE
    -- ON UPDATE CASCASE
    -- DELETE
    -- ON DELETE CASCADE
    -- ON DELETE NULL
    -- REPLACE
    
	USE CustomerDemo;

	-- INSERT: Add data to tables
    INSERT INTO Customer_Details
		(CUSTOMER_ID, FIRST_NAME, EMAIL_ID) VALUES
			(101, 'Tony', 'tony@test.com'),
			(201, 'Bruce', 'bruce@test.com');
            
	INSERT INTO Orders
		(ORDER_ID, REF_CUSTOMER_ID, PRODUCT_NAME, AMOUNT) VALUES 
		(104, 3, 'Laptop', 80000),
		(105, 4, 'Mouse', 500);
        
        
	-- UPDATE: Update the existing data
    UPDATE Customer_Details
		SET
			FIRST_NAME = 'IronMan',
            EMAIL_ID = 'ironman@test.com'
		WHERE CUSTOMER_ID = 101;
        
        SELECT * FROM Customer_Details;
        
        -- Update multiple rows (DO NOT EXECUTE, just for reference)
			SET SQL_SAFE_UPDATES = 0;
            
			UPDATE Customer_Details
				SET AGE = 25;
                
			SET SQL_SAFE_UPDATES = 1;
     
     
	-- ON UPDATE CASCADE: 
    
		-- Applied to table while creating constraints
        -- Suppose there is a situation where we have two tables such that
			-- primary key of one table is the foreign key for another table,
            -- if we update the primary key of the first table then using ON UPDATE CASCADE
            -- foreign key of the second table gets automatically updated
		-- Keeps the relation consistent
        
	UPDATE Customer_Details
		SET CUSTOMER_ID = 111
		WHERE CUSTOMER_ID = 101;
        
		-- Order.REF_CUSTOMER_ID also becomes 111
     
	-- DELETE:
    
		-- DO NOT EXECUTE: To delete all rows from table
		DELETE FROM Customer_Details;
    
		DELETE FROM Customer_Details
			WHERE CUSTOMER_ID = 5;
            
	
    -- ON DELETE CASCADE:
    
		-- Applied to table while creating constraints
        -- Suppose there is a situation where we have two tables such that
			-- primary key of one table is the foreign key for another table,
            -- if we delete the primary key of the first table then using ON DELETE CASCADE
            -- foreign key of the second table gets automatically deleted
		-- Keeps the relation consistent
        -- Prevents orphan records
        
        -- Customer deleted (CUSTOMER_ID = 5)
		-- All related Orders deleted automatically
        
        
	-- ON DELETE SET NULL:
    
		-- Applied to table while creating constraints
		-- Order stays, but loses customer reference
        -- Can FK has NULL values? - Yes, because of ON DELETE SET NULL
        
        
	-- REPLACE: (MySQL Specific)
		-- Used for laready present tuple in a table
        
        REPLACE INTO Customer_Details
			(CUSTOMER_ID, FIRST_NAME, EMAIL_ID) VALUES
				(1, 'NewRahul', 'newrahul@test.com');
            
		-- If CUSTOMER_ID = 1 exists → DELETE that row + INSERT new row
		-- If not → INSERT new row
        -- The values we don't specify will be set to NULL
        
        -- UPDATE will not do anything if tuple is not present