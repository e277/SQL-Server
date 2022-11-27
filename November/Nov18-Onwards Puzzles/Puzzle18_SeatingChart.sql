USE SQL_Puzzles_DB;

DROP TABLE IF EXISTS StChrt;
CREATE TABLE StChrt
(
    Seat_Number INT,
);
INSERT INTO StChrt
VALUES
    (7),
    (13),
    (14),
    (15),
    (27),
    (28),
    (29),
    (30),
    (31),
    (32),
    (33),
    (34),
    (35),
    (52),
    (53),
    (54);

--Queries
SELECT *
FROM StChrt;

-- Soln 1
-- Output 1

-- SELECT 1 AS gap_start, 6 AS gap_end UNION ALL SELECT 8, 12 UNION ALL SELECT 16, 26 UNION ALL SELECT 36, 51


-- using a cte to get the start gap (seat_number + 1) and end gap (seat_number - 1) for the column values
-- if seat number is not consecutive then it is a gap
-- print the start gap and end gap with their respective start and end gaps
-- if gap is zero then there is no gap, first start gap should be 1

WITH
    Seat
    AS
    (
        SELECT Seat_Number
        FROM StChrt
    )
SELECT
    CASE WHEN Seat_Number = 1 THEN 1 ELSE Seat_Number + 1 END AS gap_start,
    CASE WHEN Seat_Number = (SELECT MAX(Seat_Number)
    FROM Seat) THEN 100 ELSE Seat_Number - 1 END AS gap_end
FROM Seat
WHERE Seat_Number + 1 NOT IN (SELECT Seat_Number
FROM Seat)
ORDER BY gap_start





-- Output 2
-- comparing a range 1-54 against the table values, if the value is not in the table then count it as a gap and return as Total_Missing_Numbers
SELECT MAX(Seat_Number) - COUNT(Seat_Number) AS Total_Missing_Numbers
FROM StChrt
WHERE Seat_Number BETWEEN 1 AND 54


-- Output 3
-- count the number of add numbers and even numbers, return in rows with column Type, Count
SELECT CASE WHEN Seat_Number % 2 = 0 THEN 'Even Numbers' ELSE 'Odd Numbers' END AS Type, COUNT(Seat_Number) AS Count
FROM StChrt
GROUP BY CASE WHEN Seat_Number % 2 = 0 THEN 'Even Numbers' ELSE 'Odd Numbers' END
ORDER BY Type

