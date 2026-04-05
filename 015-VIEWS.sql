-- VIEWS --

-- Definition:
    -- A VIEW is a virtual table based on a SQL query
    -- It does not store data itself, it stores the query
    -- Data is fetched dynamically when the view is used


-- BASIC SYNTAX

    CREATE VIEW view_name AS
    SELECT ...
    FROM ...
    WHERE ...;


-- EXAMPLE

    -- Create a view for customers who placed orders

    CREATE VIEW CustomerOrders AS
    SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
    FROM Customers C
    JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;


-- USING A VIEW

    SELECT * FROM CustomerOrders;


-- What Happens

    -- The query inside the view runs every time you use it
    -- View always shows latest data


-- ADVANTAGES

    -- Simplifies complex queries
    -- Improves readability
    -- Provides abstraction (hide complexity)
    -- Can restrict access to specific data


-- EXAMPLE (ABSTRACTION)

    -- Instead of writing JOIN every time:

    SELECT * FROM CustomerOrders;

    -- instead of:

    SELECT C.CUSTOMER_NAME, O.ORDER_ID
    FROM Customers C
    JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;


-- UPDATABLE VIEWS (Important)

    -- Some views can be updated, but with restrictions

    -- Allowed if:
        -- Based on single table
        -- No GROUP BY
        -- No DISTINCT
        -- No aggregate functions


-- EXAMPLE (Updatable View)

    CREATE VIEW SimpleCustomers AS
    SELECT CUSTOMER_ID, CUSTOMER_NAME
    FROM Customers;

    -- You can do:

    UPDATE SimpleCustomers
    SET CUSTOMER_NAME = 'New Name'
    WHERE CUSTOMER_ID = 1;


-- NON-UPDATABLE VIEW

    -- If view contains:
        -- JOIN
        -- GROUP BY
        -- DISTINCT
        -- Aggregates (SUM, COUNT)

    -- Then it is not updatable


-- MODIFY VIEW

    CREATE OR REPLACE VIEW CustomerOrders AS
    SELECT C.CUSTOMER_NAME, O.ORDER_ID
    FROM Customers C
    JOIN Orders O
    ON C.CUSTOMER_ID = O.REF_CUSTOMER_ID;


-- DELETE VIEW

    DROP VIEW CustomerOrders;


-- VIEW vs TABLE

    -- TABLE:
        -- Stores actual data

    -- VIEW:
        -- Stores only query
        -- Data is not stored separately