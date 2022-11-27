USE HelloWorld;

SELECT * FROM Employee_2;

-- Procedure 1
CREATE PROC usr_emp_list
AS
BEGIN
	SELECT
		*
	FROM
		Employee_2;
END;

EXEC usr_emp_list;

-- Procedure  
ALTER PROC usr_emp_list
AS
BEGIN
	SELECT
		employee_name
		,location
		,domain
		,gender
	FROM
		Employee_2
	ORDER BY
		domain
END;

EXEC usr_emp_list;

-- Procedure 3 - With Parameters
ALTER PROC usr_emp_list(@min_name_len INT)
AS
BEGIN
	SELECT
		*
	FROM
		Employee_2
	WHERE
		LEN(employee_name) <= @min_name_len
END;

EXEC usr_emp_list 5;

-- Procedure 4 - 


