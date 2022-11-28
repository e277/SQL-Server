USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS Occurs;
CREATE TABLE Occurs
(
    Workflow VARCHAR(25),
    Message_Output VARCHAR(255),
    Occurences INT
);
INSERT INTO Occurs
VALUES
    ('Alpha', 'Error: Conversion Failed', 5);
INSERT INTO Occurs
VALUES
    ('Alpha', 'Status Complete', 8);
INSERT INTO Occurs
VALUES
    ('Alpha', 'Error: Unidentified error occurred', 9);
INSERT INTO Occurs
VALUES
    ('Bravo', 'Error: Cannot Divide by 0', 3);
INSERT INTO Occurs
VALUES
    ('Bravo', 'Error: Unidentified error occurred', 1);
INSERT INTO Occurs
VALUES
    ('Charlie', 'Error: Unidentified error occurred', 10);
INSERT INTO Occurs
VALUES
    ('Charlie', 'Error: Conversion Failed', 7);
INSERT INTO Occurs
VALUES
    ('Charlie', 'Status Complete', 6);

-- Queries
SELECT *
FROM Occurs;

-- Write an SQL statement that returns all distinct process log messages by workflow and the workflow where the 
-- message occurred the most often.
-- The output should be ordered by the workflow name and the message output.
-- The output should be in the following format:
-- Workflow	Message_Output
-- Alpha	Status Complete
-- Bravo     Error: Cannot Divide by 0
-- Charlie	Error: Conversion Failed
-- Charlie	Error: Unidentified error occurred
WITH
    CTE
    AS
    (
        SELECT Workflow, Message_Output, Occurences,
            ROW_NUMBER() OVER (PARTITION BY Message_Output ORDER BY Occurences DESC) AS RowNum
        FROM Occurs
    )
SELECT Workflow, Message_Output
FROM CTE
WHERE RowNum = 1
ORDER BY Workflow, Message_Output;

