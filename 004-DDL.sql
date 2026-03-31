-- 004-DDL_(DATA_DEFINITION_LANGUAGE) --

-- Constraints
	-- PRIMARY KEY
    -- FOREIGN KEY
    -- UNIQUE
    -- CHECK
    -- DEFAULT
    
-- ALTER Operations: Changes schema
	-- ADD
    -- MODIFY
    -- CHANGE COLUMN
    -- RENAME COLUMN
    -- DROP COLUMN
    -- RENAME TO
    
CREATE DATABASE IF NOT EXISTS CustomerDemo;

USE CustomerDemo;

-- Constraints

	-- 1. PRIMARY KEY
    -- 2. FOREIGN KEY: FK refers to PK of other table
    -- 3. UNIQUE (Exa: Email)
    -- 4. CHECK (Exa: check if age > 18)
    -- 5. DEFAULT (Exa: prime status = no)
    
	CREATE TABLE Customer (
		CUSTOMER_ID INT PRIMARY KEY,
		FIRST_NAME VARCHAR(50) NOT NULL,
		LAST_NAME VARCHAR(50),
		EMAIL VARCHAR(100) UNIQUE,
		AGE INT CHECK (AGE > 18)
	);

	INSERT INTO Customer VALUES
		(1, 'Rahul', 'Sharma', 'rahul@gmail.com', 25),
		(2, 'Sneha', 'Patil', 'sneha@gmail.com', 30),
		(3, 'Amit', 'Verma', 'amit@gmail.com', 22);

	SELECT * FROM Customer;
	
	CREATE TABLE Orders (
		ORDER_ID INT,
		REF_CUSTOMER_ID INT,
		PRODUCT_NAME VARCHAR(100) NOT NULL,
		AMOUNT DECIMAL(10,2) CHECK (AMOUNT > 0),
    
		PRIMARY KEY (ORDER_ID),
		FOREIGN KEY (REF_CUSTOMER_ID)
			REFERENCES Customer(CUSTOMER_ID)
            ON UPDATE CASCADE
			ON DELETE CASCADE
	);

	INSERT INTO Orders
		(ORDER_ID, REF_CUSTOMER_ID, PRODUCT_NAME, AMOUNT) VALUES
			(101, 1, 'Laptop', 55000),
			(102, 2, 'Mobile', 20000),
			(103, 1, 'Headphones', 2000);
        
	SELECT * FROM Orders;


	-- Invalid cases to test constraints


	-- PK

		-- Error: Duplicate entry '1' for key 'customer.PRIMARY'
		INSERT INTO Customer
			VALUES (1, 'Test', 'User', 'testuser@test.com', 28);
    
		SELECT * FROM Customer;


	-- FK
	
		-- Error: Cannot add or update a child row: a foreign key constraint fails
		INSERT INTO Orders VALUES
			(104, 99, 'Tablet', 15000);

		SELECT * FROM Customer;


	-- NULL

		-- Executed: Empty string '' is not same as NULL    
		INSERT INTO Customer
			VALUES (4, '', 'User', 'testuser@test.com', 28);
    
		-- Error: Column 'FIRST_NAME' cannot be null
		INSERT INTO Customer
			VALUES (5, NULL, 'User', 'testuser01@test.com', 28);

		-- Error: Field 'FIRST_NAME' doesn't have a default value (SQL tries to instert DEFAULT_VALUE or NULL)
		INSERT INTO Customer
			(CUSTOMER_ID, LAST_NAME, EMAIL, AGE) VALUES
				(5, 'User01', 'testuser01@test.com', 28);
    
	SELECT * FROM Customer;


	-- UNIQUE

		-- Error: Duplicate entry 'rahul@gmail.com' for key 'customer.EMAIL'
		INSERT INTO Customer VALUES
			(6, 'Test', 'User', 'rahul@gmail.com', 26);
    
	SELECT * FROM Customer;


	-- CHECK

		-- Error: Check constraint 'customer_chk_1' is violated.
		INSERT INTO Customer VALUES
			(6, 'Kid', 'User', 'kid@gmail.com', 16);
	
		-- Error: Check constraint 'orders_chk_1' is violated.
		INSERT INTO Orders VALUES
			(105, 1, 'Mouse', -500);
    
	SELECT * FROM Customer;


	-- DEFAULT

		ALTER TABLE Customer
			ADD STATUS VARCHAR(20) DEFAULT 'ACTIVE';
        
		-- By default all existing records automatically get STATUS = 'ACTIVE'
    
		-- New insert (DEFAULT value)
		INSERT INTO Customer (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, AGE)
			VALUES (10, 'Neha', 'Patil', 'neha@test.com', 24);
        
		-- Overriding DEFAULT Value
		INSERT INTO Customer
			VALUES (11, 'Aman', 'Khan', 'aman@test.com', 26, 'INACTIVE');
    
		-- Explicit DEFAULT usage
		INSERT INTO Customer
			VALUES (12, 'Riya', 'Shah', 'riya@test.com', 23, DEFAULT);
        
	SELECT * FROM Customer;
    

-- ALTER Operations: Changes schema
	-- ADD
    -- MODIFY
    -- CHANGE COLUMN
    -- DROP COLUMN
    -- RENAME TO
    
    DESC Customer;
    
    -- ADD: Add new column
    ALTER TABLE Customer
		ADD PRIME_CUSTOMER VARCHAR(3) DEFAULT 'NO';
    
    ALTER TABLE Customer
		ADD ELIGILBE_FOR_PRIME VARCHAR(3) DEFAULT 'YES';
        
	-- MODIFY: Change datatype of an attribute
    ALTER TABLE Customer
		MODIFY EMAIL VARCHAR(80);
        
	ALTER TABLE Customer
		MODIFY PRIME_CUSTOMER CHAR(3);
        
	-- CHANGE COLUMN: Rename Column
    ALTER TABLE Customer
		CHANGE COLUMN ELIGILBE_FOR_PRIME PRIME_ELIGIBLE VARCHAR(3);
        
	-- RENAME COLUMN: Rename Column (Modern Syntax)
    ALTER TABLE Customer
		RENAME COLUMN EMAIL TO EMAIL_ID;
        
	-- DROP COLUMN: Delete a column permenantly
	ALTER TABLE Customer
		DROP COLUMN PRIME_ELIGIBLE;
        
	-- RENAME TO: Rename table
    ALTER TABLE Customer
		RENAME TO Customer_Details;

	DESC Customer_Details;
    
SELECT * FROM Customer_Details;
