USE SQL_Puzzles_DB;


IF OBJECT_ID('tempdb.dbo.#SampleData', 'U') IS NOT NULL 
DROP TABLE #SampleData;

CREATE TABLE #SampleData
(
    IntegerValue INTEGER IDENTITY(1,1),
    RowID UNIQUEIDENTIFIER
); 
GO

INSERT INTO #SampleData
VALUES
    (NEWID()); 
GO
1000

ALTER TABLE #SampleData DROP COLUMN IntegerValue; 
GO

-- Write an SQL statement that retrieves records 10 to 20 ordered by the RowID column
SELECT *
FROM #SampleData
ORDER BY RowID
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;