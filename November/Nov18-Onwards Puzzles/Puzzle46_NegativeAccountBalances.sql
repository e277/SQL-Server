USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS NegAccBals;
CREATE TABLE NegAccBals
(
    Account_ID INT,
    Balance VARCHAR(25)
);
INSERT INTO NegAccBals
VALUES
    (1001, '$234.45');
INSERT INTO NegAccBals
VALUES
    (1001, '$-23.12');
INSERT INTO NegAccBals
VALUES
    (2002, '$-93.01');
INSERT INTO NegAccBals
VALUES
    (2002, '$-120.19');
INSERT INTO NegAccBals
VALUES
    (3003, '$186.76');
INSERT INTO NegAccBals
VALUES
    (3003, '$90.23');
INSERT INTO NegAccBals
VALUES
    (3003, '$10.11');

-- Queries
SELECT *
FROM NegAccBals;

-- Determine all accounts whose balance has never been positive
WITH
    CTE_NegAccBals
    AS
    (
        SELECT
            Account_ID,
            Balance,
            CASE
            WHEN CHARINDEX('$', Balance) > 0
            THEN
                CAST(SUBSTRING(Balance, CHARINDEX('$', Balance) + 1, LEN(Balance)) AS DECIMAL(10, 2))
            ELSE
                CAST(Balance AS DECIMAL(10, 2))
        END AS BalanceValue
        FROM NegAccBals
    )
-- Select Account_ID if all BalanceValues are negative
SELECT
    Account_ID
FROM CTE_NegAccBals
GROUP BY Account_ID
HAVING SUM(CASE WHEN BalanceValue > 0 THEN 1 ELSE 0 END) = 0;


-- Soln 2
-- Determine all accounts whose balance has never been positive using all