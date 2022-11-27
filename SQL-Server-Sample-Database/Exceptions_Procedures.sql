USE BikeStores;

CREATE PROC usp_divide(
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
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;
GO

DECLARE @r decimal;
EXEC usp_divide 10, 2, @r output;
PRINT @r;

--Throw exceptions
DECLARE @r2 decimal;
EXEC usp_divide 5, 0, @r2 output;
PRINT @r2;


-- Using TRY CATCH with transactions
DROP TABLE IF EXISTS sales.deals;
DROP TABLE IF EXISTS sales.persons;

CREATE TABLE sales.persons (
	person_id INT PRIMARY KEY IDENTITY,
	first_name NVARCHAR(100) NOT NULL,
	last_name NVARCHAR(100) NOT NULL
);
CREATE TABLE sales.deals (
	deal_id INT PRIMARY KEY IDENTITY,
	person_id INT NOT NULL,
	deal_note NVARCHAR(100),
	FOREIGN KEY(person_id) REFERENCES sales.persons(
	person_id)
);

INSERT INTO 
    sales.persons(first_name, last_name)
VALUES
    ('John','Doe'), ('Jane','Doe');
INSERT INTO
    sales.deals(person_id, deal_note)
VALUES
    (1,'Deal for John Doe');

-- Query
SELECT * FROM sales.persons;
SELECT * FROM sales.deals;

-- Store Procedure usp_report_error
CREATE PROC usp_report_error
AS
	SELECT
		ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_LINE () AS ErrorLine  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_MESSAGE() AS ErrorMessage;  
GO

-- Store Procedure usp_delete_person
CREATE PROC usp_delete_person(
	@person_id INT
) AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DELETE FROM sales.persons
		WHERE person_id = @person_id;
		-- if DELETE success, commit the transaction
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- report exception
		EXEC usp_report_error;

		-- Test if the transaction is uncommitable
		IF (XACT_STATE()) = -1
		BEGIN
			PRINT N'The transaction is in an uncomiitable state.' +
					'Rolling back transaction.'
			ROLLBACK TRANSACTION;
		END;

		-- Test if the transaction is committable.
		IF (XACT_STATE()) = 1
		BEGIN
			PRINT N'The transaction is committable.' +
					'Committing transaction.'
			COMMIT TRANSACTION;
		END;
	END CATCH
END;
GO

-- execute procedure
EXEC usp_delete_person 2;
EXEC usp_delete_person 1;
