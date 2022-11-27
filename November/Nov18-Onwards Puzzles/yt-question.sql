USE HelloWorld;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
    Emp_Name VARCHAR(25),
    Dept_ID INT,
    Salary INT
);
INSERT INTO Department
VALUES
    ('Siva', 1, 30000);
INSERT INTO Department
VALUES
    ('Prasad', 1, 50000);
INSERT INTO Department
VALUES
    ('Sai', 2, 20000);
INSERT INTO Department
VALUES
    ('Ravi', 2, 40000);

-- Queries
SELECT *
FROM Department;

-- print the Dept_ID, Emp_Name with the highest salary in each department, Emp_Name with the lowest salary in each department
-- using rank, aggregation and case when
WITH
    CTE
    AS
    (
        SELECT Dept_ID, Emp_Name, Salary,
            RANK() OVER(PARTITION BY Dept_ID ORDER BY Salary DESC) AS Rank_Salary
        FROM Department
    )
SELECT Dept_ID,
    MAX(CASE WHEN Rank_Salary = 1 THEN Emp_Name END) AS emp_name_max_salary,
    MIN(CASE WHEN Rank_Salary = 2 THEN Emp_Name END) AS emp_name_min_salary
FROM CTE
GROUP BY Dept_ID;

-- using join, aggregation and case when
WITH
    CTE
    AS
    (
        SELECT Dept_ID, MAX(Salary) AS max_salary, MIN(Salary) AS min_salary
        FROM Department
        GROUP BY Dept_ID
    )
SELECT d.Dept_ID
    -- , max_salary
    -- , min_salary
    , CASE WHEN Salary=max_salary THEN Emp_Name ELSE NULL END AS emp_name_max_salary
    , CASE WHEN Salary=min_salary THEN Emp_Name ELSE NULL END AS emp_name_min_salary
FROM Department d
    INNER JOIN CTE
    ON d.Dept_ID = CTE.Dept_ID
GROUP BY d.Dept_ID;