-- 003-DRL_(DATA_RETRIEVAL_LANGUAGE) --

	-- DESC 
    -- SELECT
    -- WHERE
    -- BETWEEN
    -- IN
    -- AND, OR, NOT
    -- IS NULL
    -- Wildcard/ Pattern Searching ('%', '_')
    -- ORDER BY
    -- DISTINCT
    -- GROUP BY
    -- HAVING
    
USE ORG;


-- SELECT

	SELECT * FROM Worker;

	SELECT SALARY FROM Worker;

	SELECT FIRST_NAME, LAST_NAME, SALARY FROM Worker;

	-- Order of Execution: RIGHT to LEFT

	-- Can we use SELECT keyword without using FROM clause?
	-- Yes, using dual tables
	-- Dual Tables are dummy tables created by MySQL, helps user to do certain obvious actions
	-- without referring to user defined tables
	-- MySQL always answers in table

	SELECT 55+11;

	SELECT now();
	SELECT ucase('Vishal');
    
    
-- WHERE
	-- reduce rows based on given conditions
    
    SELECT * FROM Worker
		WHERE SALARY >= 100000;
        
	SELECT * FROM Worker
		WHERE DEPARTMENT = 'HR';
        
	SELECT * FROM Worker
		WHERE (SALARY > 100000 AND DEPARTMENT = 'HR');
        
	SELECT * FROM Worker
		WHERE SALARY > 100000 OR DEPARTMENT = 'HR';
    
    
-- BETWEEN
	-- range based
    -- (inclusive values)
    
    SELECT * FROM Worker
		WHERE SALARY BETWEEN 200000 AND 300000;
  
  
-- IN
	-- reduce OR statements
    
    SELECT * FROM Worker
		WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin' OR DEPARTMENT = 'Account';
        
	SELECT * FROM Worker
		WHERE DEPARTMENT IN ('HR', 'Admin', 'Account'); -- better way
  
  
-- AND, OR, NOT

	SELECT * FROM Worker
		WHERE DEPARTMENT NOT IN ('HR', 'Admin');

        
-- IS NULL
	SELECT * FROM Worker
		WHERE DEPARTMENT IS NULL;
        
	SELECT * FROM Worker
		WHERE DEPARTMENT IS NOT NULL;
 
 
-- Wildcard: Pattern Searching ('%', '_')

	SELECT * FROM Worker
		WHERE FIRST_NAME LIKE '%i%';
        
	SELECT * FROM Worker
		WHERE FIRST_NAME LIKE '_i%';
        
	SELECT * FROM Worker
		WHERE FIRST_NAME LIKE 'Vi%';

        
-- Sorting: ORDER BY

	SELECT * FROM Worker
		ORDER BY SALARY;
        
	SELECT * FROM Worker
		ORDER BY SALARY DESC;
        
	SELECT * FROM Worker
		WHERE DEPARTMENT IN ('Admin', 'HR')
        ORDER BY SALARY DESC;
  
  
-- DISTINCT
	
    SELECT DEPARTMENT FROM Worker;
    
	SELECT DISTINCT (DEPARTMENT) FROM Worker;


-- Grouping: GROUP BY
	
    -- GROUP BY clause is used to collect data from multiple records and group the result
    -- by one or more columns.
    
    -- Groups into category based on cloumn given
    
    -- All column names mentioned after SELECT statement shall be repeated in GROUP BY,
    -- in order to successfully execute the query
    
    -- Different aggregation functions
		-- COUNT()
        -- SUM()
        -- AVG()
        -- MIN()
        -- MAX()
    
	-- Find no. of employees in different departments
		-- HR -> ?
        -- Account -> ?
        -- Admin --> ?
    
	SELECT DEPARTMENT FROM Worker
		GROUP BY DEPARTMENT;
        
	-- By default, SQL treats GROUP BY as DISTINCT, if no aggregation functions are used
    
    SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker
		GROUP BY DEPARTMENT;	-- department wise aggregation
        
	SELECT DEPARTMENT, COUNT(DEPARTMENT) AS COUNT FROM Worker
		GROUP BY DEPARTMENT;
        
	-- Find avg. salary per department
    
    SELECT DEPARTMENT, AVG(SALARY) FROM Worker
		GROUP BY DEPARTMENT;
        
	-- Find minimum salary per department
    
    SELECT DEPARTMENT, MIN(SALARY) FROM Worker
		GROUP BY DEPARTMENT;
        
	-- Find maximum salary per department
    
    SELECT DEPARTMENT, MAX(SALARY) FROM Worker
		GROUP BY DEPARTMENT;
	
    -- Sum of all salaries in each department
    
    
    
-- GROUP BY HAVING

	-- Out of the categories made by GROUP BY, we would like to know only particular thing (condition)
    
    -- Similar to WHERE
    
    -- WHERE vs HAVING
		
        -- Both have same function of filtering rows based on conditions
        -- WHERE clause is used to filter rows from table based on specified conditions
        -- HAVING clause is used to filter rows from groups based on specified conditions
        -- HAVING is used after GROUP BY, while WHERE is used before GROUP BY
		-- For using HAVING, GROUP BY is necessary
        -- WHERE can be used with SELECT, DELETE and UPDATE
        -- GROUP BY is used with SELECT
        
	-- List all departments having more than 2 workers, also give count
    
    SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker
		GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;
