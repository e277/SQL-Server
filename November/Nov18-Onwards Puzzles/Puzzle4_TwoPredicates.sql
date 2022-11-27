USE SQL_Puzzles_DB

DROP TABLE IF EXISTS TwoPreds;
CREATE TABLE TwoPreds (
	Customer_ID INT,
	Order_ID VARCHAR(25),
	Delivery_State VARCHAR(25),
	Amount VARCHAR(25)
)
INSERT TwoPreds
	(Customer_ID, Order_ID, Delivery_State, Amount)
VALUES
	(1001, 'Ord936254', 'CA', '$340'),
	(1001, 'Ord143876', 'TX', '$950'),
	(1001, 'Ord654876', 'TX', '$670'),
	(1001, 'Ord814356', 'TX', '$860'),
	(2002, 'Ord342176', 'WA', '$320'),
	(3003, 'Ord265789', 'CA', '$650'),
	(3003, 'Ord387654', 'CA', '$830'),
	(4004, 'Ord476126', 'TX', '$120');

--Queries
SELECT * FROM TwoPreds;

SELECT *
FROM TwoPreds
WHERE 
	Delivery_State = 'TX' AND (
		Customer_ID IN (
			SELECT Customer_ID
			FROM TwoPreds
			WHERE Delivery_State IN ('CA')
		)
	)
