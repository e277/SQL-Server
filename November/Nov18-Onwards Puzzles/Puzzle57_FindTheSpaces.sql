USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Spaces;
CREATE TABLE Spaces
(
    [Statement] VARCHAR(50)
);
INSERT INTO Spaces
VALUES
    ('SELECT EmpID FROM Emps;'),
    ('SELECT * FROM Trans;');

-- Queries
SELECT *
FROM Spaces;


-- split each statement into an array of words
-- print each word, the start position of each word, the position of each space in the statement
WITH
    CTE_Words
    AS
    (
                    SELECT
                [Statement],
                -- return the first space position and the first word
                CHARINDEX(' ', [Statement]) AS SpacePos,
                SUBSTRING([Statement], 1, CHARINDEX(' ', [Statement]) - 1) AS Word
            FROM Spaces
            -- recursively find the next space and word, return the last word and 0 as space position
        UNION ALL
            SELECT
                [Statement],
                CASE WHEN CHARINDEX(' ', [Statement], SpacePos + 1) = 0 AND SUBSTRING([Statement], LEN([Statement]), 1) = ';' THEN 0 ELSE CHARINDEX(' ', [Statement], SpacePos + 1) END AS SpacePos,
                SUBSTRING([Statement], SpacePos + 1, CHARINDEX(' ', [Statement], SpacePos + 1) - SpacePos - 1) AS Word
            FROM CTE_Words
            WHERE CHARINDEX(' ', [Statement], SpacePos + 1) > 0

    )
-- print RowNumber, QuoteId, String, Starts, Position, word, TotalSpace
SELECT
    ROW_NUMBER() OVER (PARTITION BY [Statement] ORDER BY [Statement]) AS RowNum,
    DENSE_RANK() OVER (ORDER BY [Statement] DESC) AS QuoteId,
    [Statement] AS String,
    CHARINDEX(Word, Statement) AS Starts,
    SpacePos,
    Word,
    (LEN([Statement]) - LEN(REPLACE([Statement], ' ', ''))) AS TotalSpaces
FROM CTE_Words
GROUP BY [Statement], SpacePos, Word
ORDER BY [Statement] DESC, QuoteId DESC, SpacePos;
