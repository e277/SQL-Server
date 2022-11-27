USE HelloWorld;

SELECT * FROM Employee;
SELECT * FROM Employee_personal;

-- 41.	Use two different calls with same EmpID value.
-- a.	The first call executes without any error message and 
BEGIN TRY
    SELECT 
		e.EMPID, ep.AVAILABLE, ep.DEPARTMENT
	FROM Employee e
		INNER JOIN Employee_personal ep
		ON e.EMPID = ep.EMPID
	WHERE e.EMPID=4;

	PRINT 'Without Error messages';
END TRY
BEGIN CATCH
    
END CATCH;

-- b.	The second call execute with an error message.
DECLARE 
    @ErrorMessage2 NVARCHAR(4000), @ErrorSeverity2 INT, @ErrorState2 INT;
BEGIN TRY
    SELECT 
		e.EMPID, ep.AVAILABLE, ep.DEPARTMENT
	FROM Employee e
		INNER JOIN Employee_personal ep
		ON e.EMPID = ep.EMPID
	WHERE e.EMPID=4;

	--PRINT 'With Error messages'
    RAISERROR('With Error messages.', 17, 1);
END TRY
BEGIN CATCH
    SELECT 
        @ErrorMessage2 = ERROR_MESSAGE(), @ErrorSeverity2 = ERROR_SEVERITY(), @ErrorState2 = ERROR_STATE();
    RAISERROR(@ErrorMessage2, @ErrorSeverity2, @ErrorState2);
END CATCH;