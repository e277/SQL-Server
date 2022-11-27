USE HelloWorld;

CREATE PROC usr_divide(
	@a decimal,
	@b decimal,
	@c decimal output
) AS
BEGIN
	BEGIN TRY
		SET @c = @a / @b;
	END TRY
	BEGIN CATCH
		SELECT
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;
GO

DECLARE @r decimal;
EXEC usr_divide 10, 2, @r output;
PRINT @r;

--Throw exceptions
DECLARE @r2 decimal;
EXEC usr_divide 5, 0, @r2 output;
PRINT @r2;