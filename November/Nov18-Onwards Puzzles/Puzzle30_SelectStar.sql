USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Stars;
CREATE TABLE Stars
(
    Product_ID INT,
    Product_Name VARCHAR(255)
);

-- Queries
-- write a query to modified the CREATE TABLE statement 
-- to return an error when SELECT * FROM Stars is executed
BEGIN TRY
    SELECT *
FROM Stars;
END TRY
BEGIN CATCH
    PRINT(" * IS PRESENT IN THE CREATE TABLE STATEMENT");
    THROW;
    SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

