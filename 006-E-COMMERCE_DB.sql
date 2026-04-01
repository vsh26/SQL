-- DESIGNING A DB --

CREATE DATABASE IF NOT EXISTS ECommerceDB;

USE ECommerceDB;

CREATE TABLE IF NOT EXISTS Customers (
	CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50) UNIQUE NOT NULL,
    CITY VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Orders (
	ORDER_ID INT PRIMARY KEY,
	REF_CUSTOMER_ID INT NULL,
    ORDER_DATE DATETIME NOT NULL,
    TOTAL_AMOUNT DECIMAL(10,2) NOT NULL CHECK(TOTAL_AMOUNT > 0),
    
    FOREIGN KEY(REF_CUSTOMER_ID)
		REFERENCES Customers(CUSTOMER_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Products (
	PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    PRICE DECIMAL(10,2) NOT NULL CHECK(PRICE > 0),
    CATEGORY VARCHAR(50) NOT NULL
);

-- We assume that we keep this table --
CREATE TABLE IF NOT EXISTS OrderItems (
	ORDER_ITEM_ID INT PRIMARY KEY,
	REF_PRODUCT_ID INT NOT NULL,
    REF_ORDER_ID INT NOT NULL,
    QUANTITY INT NOT NULL CHECK(QUANTITY > 0),
    
    FOREIGN KEY(REF_PRODUCT_ID)
		REFERENCES Products(PRODUCT_ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
        
	FOREIGN KEY(REF_ORDER_ID)
		REFERENCES Orders(ORDER_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Customers
	VALUES
		(1, 'Vishal', 'vishal@email.com', 'Pune'),     -- 2 orders (201, 203)
		(2, 'Amit', 'amit@email.com', 'Mumbai'),       -- 1 order (202)
		(3, 'Sara', 'sara@email.com', 'Delhi'),        -- 0 orders
		(4, 'Neha', 'neha@email.com', 'Bangalore'),    -- 0 orders
		(5, 'Raj', 'raj@email.com', 'Hyderabad'),      -- 2 orders (204, 205)
		(6, 'Anya', 'anya@email.com', 'Chennai');      -- 0 orders
        
INSERT INTO Orders
	VALUES
		(201, 1, '2025-03-01 10:00:00', 90000),
		(202, 2, '2025-03-02 12:00:00', 30000),
		(203, 1, '2025-03-05 15:30:00', 2000),
		(204, 5, '2025-03-06 09:00:00', 60000),
		(205, 5, '2025-03-07 18:45:00', 5000);
        
INSERT INTO Products
	VALUES
		(101, 'Laptop', 60000, 'Electronics'),   		-- used 2 times (201, 204)
		(102, 'Phone', 30000, 'Electronics'),    		-- used 2 times (201, 202)
		(103, 'Shoes', 2000, 'Fashion'),         		-- used 2 times (203, 205)
		(104, 'Watch', 5000, 'Accessories'),     		-- 0 times (not ordered)
		(105, 'Headphones', 3000, 'Electronics'),		-- used 1 time (204)
		(106, 'Bag', 1500, 'Fashion');           		-- 0 times (not ordered)
        
INSERT INTO OrderItems
	VALUES
		(1, 101, 201, 1),
		(2, 102, 201, 1),
		(3, 102, 202, 1),
		(4, 103, 203, 1),
		(5, 101, 204, 1),
		(6, 105, 204, 2),
		(7, 103, 205, 1);