USE HelloWorld;

-- DECLARE @i INT
-- SET @i= 0
-- WHILE ( @i <= 10) BEGIN
--     PRINT 'The counter value is = ' + CONVERT(VARCHAR,@i)
--     SET @i  = @i  + 1
-- END
SELECT * FROM Employee;
SELECT * FROM Employee_personal;

ALTER TABLE Employee_personal
ALTER COLUMN GENDER VARCHAR(50) NULL;

EXEC sp_columns Employee_personal;

UPDATE Employee_personal
SET GENDER=NULL WHERE EMPID=1;
UPDATE Employee_personal
SET GENDER=NULL WHERE EMPID=3;
UPDATE Employee_personal
SET GENDER=NULL WHERE EMPID=8;


-- Question 38 - Read all data row by row with the help of the WHILE loop 
--	and display the table contents from table: Employee_personal.
DECLARE @count INT = 1
WHILE (@count <= @@ROWCOUNT)
	BEGIN
		SELECT * FROM Employee_personal;
		SET @count = @count + 1
	END;

-- Question 39 - Display the data from the table with the following condition 
    -- using while loop:
-- a.	The salary is greater than 300000
DECLARE @count2 INT = 1
WHILE (@count2 <= @@ROWCOUNT)
	BEGIN
		SELECT * FROM Employee WHERE BASIC_PAY > 300000
		SET @count2 = @count2 + 1
	END;

-- b.	The employee name while the employee gender is not null.
DECLARE @count3 INT = 1
WHILE (@count3 <= @@ROWCOUNT)
	BEGIN
		SELECT * FROM Employee_personal WHERE GENDER IS NOT NULL
		SET @count3 = @count3 + 1
	END;
