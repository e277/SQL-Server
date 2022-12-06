USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS [Products A];
CREATE TABLE [Products A]
(
    [Product Name] VARCHAR(25),
    Quantity INT
);
INSERT INTO [Products A]
VALUES
    ('Widget', 7);
INSERT INTO [Products A]
VALUES
    ('Doodad', 9);
INSERT INTO [Products A]
VALUES
    ('Gizmo', 3);

DROP TABLE IF EXISTS [Products B];
CREATE TABLE [Products B]
(
    [Product Name] VARCHAR(25),
    Quantity INT
);
INSERT INTO [Products B]
VALUES
    ('Widget', 7);
INSERT INTO [Products B]
VALUES
    ('Doodad', 6);
INSERT INTO [Products B]
VALUES
    ('Dingbat', 9);

-- Queries
SELECT *
FROM [Products A];
SELECT *
FROM [Products B];

-- if product name are the same in both tables, then 'Matches in both tables'
-- if product name is not present in table then 'Product does not exist in table A' else 'Product does not exists in table B'
-- if product name are the same but differeent quantity , then 'Quantity in table A and table B do not match'
WITH
    Products_A_Ranked
    AS
    (
        SELECT
            a.[Product Name],
            a.Quantity,
            CASE
                WHEN b.[Product Name] IS NULL THEN 'Product does not exist in table B'
                WHEN a.Quantity = b.Quantity THEN 'Matches in both tables'
                ELSE 'Quantity in table A and table B do not match'
            END AS [Product Status]
        FROM [Products A] a
            LEFT JOIN [Products B] b
            ON a.[Product Name] = b.[Product Name]
    ),
    Products_B_Ranked
    AS
    (
        SELECT
            b.[Product Name],
            b.Quantity,
            CASE
                WHEN a.[Product Name] IS NULL THEN 'Product does not exist in table A'
                WHEN a.Quantity = b.Quantity THEN 'Matches in both tables'
                ELSE 'Quantity in table A and table B do not match'
            END AS [Product Status]
        FROM [Products B] b
            LEFT JOIN [Products A] a
            ON a.[Product Name] = b.[Product Name]
    )
    SELECT [Product Status] AS [Type], [Product Name]
    FROM Products_A_Ranked
    GROUP BY [Product Status], [Product Name]
UNION
    SELECT [Product Status] AS [Type], [Product Name]
    FROM Products_B_Ranked
    GROUP BY [Product Status], [Product Name]