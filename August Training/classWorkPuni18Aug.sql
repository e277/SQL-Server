-- SQL Query to find the second highest salary of Employee - JAVA Program
-- From Trainer Two to Everyone 02:00 PM
-- Write an SQL Query to find the number of employees according to gender whose DOB is between 01/01/1960 to 31/12/1975.
-- SQL Query to find the second highest salary of Employee
-- write a java programming to do the same in a single dimension array
-- make it fast

USE HelloWorld;
SELECT * FROM Employee;
SELECT * FROM Employee_personal;

-- Write an SQL Query to find the number of employees according to gender whose DOB is between 01/01/1960 to 31/12/1975.
ALTER TABLE Employee
ADD DOB VARCHAR(50);

UPDATE Employee SET DOB = '02/01/1957' WHERE EMPID = 1;
UPDATE Employee SET DOB = '05/07/1970' WHERE EMPID = 2;
UPDATE Employee SET DOB = '23/04/1944' WHERE EMPID = 3;
UPDATE Employee SET DOB = '31/12/1965' WHERE EMPID = 4;
UPDATE Employee SET DOB = '23/04/1962' WHERE EMPID = 5;
UPDATE Employee SET DOB = '23/04/1934' WHERE EMPID = 6;
UPDATE Employee SET DOB = '23/04/1963' WHERE EMPID = 7;
UPDATE Employee SET DOB = '29/05/1991' WHERE EMPID = 8;

-- SELECT CONVERT(DATETIME, e.DOB, 103) AS DateConverted, ep.GENDER
-- FROM Employee e
--     INNER JOIN Employee_Personal ep 
-- 	ON e.EMPID = ep.EMPID
-- WHERE e.DOB BETWEEN '01/01/1960' AND '31/12/1975'

SELECT ep.NAME, CONVERT(DATETIME, e.DOB, 103) DateC, ep.GENDER
FROM Employee e
    INNER JOIN Employee_Personal ep 
	ON e.EMPID = ep.EMPID
WHERE e.DOB IN (
    SELECT e.DOB AS DateConverted
    FROM Employee_personal
    WHERE e.DOB BETWEEN '01/01/1960' AND '31/12/1975'
)



-- SQL Query to find the second highest salary of Employee
SELECT NAME, BASIC_PAY
FROM Employee
ORDER BY BASIC_PAY DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY
	