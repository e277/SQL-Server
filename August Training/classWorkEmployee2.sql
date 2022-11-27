USE HelloWorld;

SELECT * FROM Employee_personal;

-- Question 33 - Declare a variable Emp_API_Grade and assign
-- the value "Yes" where rank is 1 or 2 and print the values
-- Employee_name and Department
ALTER TABLE Employee_personal
ADD Emp_API_Grade VARCHAR(25)

DECLARE @Emp_API_Grade VARCHAR(25);
SET @Emp_API_Grade = 'Yes'

UPDATE Employee_personal
SET Emp_API_Grade = @Emp_API_Grade
WHERE Rank = 1 OR Rank = 2;


-- Question 34 - Declare the following variables and print the values:
-- a. variable Emp_dest_place and assign the value �India� where rank is 1
-- b. variable Emp_wrk_hrs and assign the value �5� where rank is 1.
-- c. Self Learn: Variable Types in SQL
DECLARE @Emp_dest_place VARCHAR(25);
SET @Emp_dest_place = 'India';

UPDATE Employee_personal
SET PLACE = @Emp_dest_place
WHERE Rank = 1;

PRINT 'The Place for rank 1 is: ' + @Emp_dest_place;

SELECT NAME, PLACE
FROM Employee_personal;


-- Question 35 - Implement the following and form SQL Query.
-- a. DECLARE
-- b. SET
-- c. SELECT
-- d. PRINT
DECLARE @pro_lang VARCHAR(25);
SET @pro_lang = 'Flutter'

SELECT NAME, Project_Platform
FROM Employee_personal
WHERE Project_Platform = @pro_lang;


-- Question 36 - Self Learn:
-- a. Nested blocks; What?, Scope?
-- b. Types of blocks
-- c. Structure
-- d. Example using the employee table
-- e. Nested loops



-- Question 37 - Using Nested blocks create a new column religion and add the following
-- a. Create a variable and assign the values like a="Islam", b="Hindu", c="Christian"
-- b. Inside the nested blocks create the conditional statements and check the nation and allocate the religion.
-- c. In next block count the number of people belongs to same religion.
-- d. Print the results.
