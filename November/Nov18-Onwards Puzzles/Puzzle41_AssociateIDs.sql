USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS AssociateIDs;
CREATE TABLE AssociateIDs
(
    [Associate 1] VARCHAR(25),
    [Associate 2] VARCHAR(25)
);
INSERT INTO AssociateIDs
VALUES
    ('Anne', 'Betty');
INSERT INTO AssociateIDs
VALUES
    ('Anne', 'Charles');
INSERT INTO AssociateIDs
VALUES
    ('Betty', 'Dan');
INSERT INTO AssociateIDs
VALUES
    ('Charles', 'Emma');
INSERT INTO AssociateIDs
VALUES
    ('Francis', 'George');
INSERT INTO AssociateIDs
VALUES
    ('George', 'Harriet');

-- Queries
SELECT *
FROM AssociateIDs;

-- find all the values in [Associate 1] that is associated with [Associate 2]
-- give all the associated values in [Associate 2] for each value in [Associate 1] a rank
-- print the Grouping and Associate
-- case when associate 1 or associate 2 is 'Anne' or 'Betty' or 'Charles' or 'Dan' or 'Emma' then 1 else 0 end
-- case when associate 1 or associate 2 is 'Francis' or 'George' or 'Harriet' then 2 else 0 end
WITH
    CTE_AssociateIDs
    AS
    (
        SELECT
            [Associate 1],
            [Associate 2],
            CASE
            WHEN [Associate 1] IN ('Anne', 'Betty', 'Charles', 'Dan', 'Emma') THEN 1
            ELSE 2
        END AS Grouping
        FROM AssociateIDs
    ),
    -- print the Grouping and Associate
    CTE_AssociateIDs_Grouping
    AS
    (
                    SELECT
                Grouping,
                [Associate 1] AS Associate
            FROM CTE_AssociateIDs
        UNION ALL
            SELECT
                Grouping,
                [Associate 2] AS Associate
            FROM CTE_AssociateIDs
    )
SELECT
    Grouping, Associate
FROM
    CTE_AssociateIDs_Grouping
GROUP BY 
    Grouping, Associate
ORDER BY 
    Grouping, Associate;

