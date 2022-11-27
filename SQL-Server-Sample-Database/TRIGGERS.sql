USE BikeStores;

SELECT * FROM production.products;

DROP TABLE IF EXISTS production.product_audits;
CREATE TABLE production.product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);

-- Creating Trigger
CREATE TRIGGER production.trg_product_audit
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO production.product_audits (
		product_id
		,product_name
		,brand_id
		,category_id
		,model_year
		,list_price
		,updated_at
		,operation
	)
	SELECT
		i.product_id
		,product_name
		,brand_id
		,category_id
		,model_year
		,i.list_price
		,GETDATE()
		,'INS'
	FROM
		inserted AS i
	UNION ALL
	SELECT
		d.product_id
		,product_name
		,brand_id
		,category_id
		,model_year
		,d.list_price
		,GETDATE()
		,'DEL'
	FROM
		deleted AS d;
END

-- Testing the trigger
INSERT INTO production.products
	(product_name, brand_id, category_id, model_year, list_price)
VALUES
	('Test Product', 1, 1, 2018, 599);

DELETE FROM
	production.products
WHERE
	product_id = 322;


SELECT * FROM production.products WHERE product_name='Test Product';
SELECT * FROM production.product_audits;


-- INSTEAD OF Trigger
-- how to create an INSTEAD OF trigger for 
-- inserting data into an underlying table via a view.
DROP TABLE IF EXISTS production.brand_approvals;
CREATE TABLE production.brand_approvals (
	brand_id INT IDENTITY PRIMARY KEY,
	brand_name VARCHAR(255) NOT NULL
);

-- VIEW
CREATE VIEW production.vw_brands
AS
SELECT
	brand_name, 'Approved' approval_status
FROM
	production.brands
UNION
SELECT
	brand_name, 'Pending Approval' approval_status
FROM
	production.brand_approvals;

-- Trigger with View
CREATE TRIGGER production.trg_vw_brands
ON production.vw_brands
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO production.brand_approvals
		(brand_name)
	SELECT
		i.brand_name
	FROM
		inserted i
	WHERE
		i.brand_name NOT IN (
			SELECT
				brand_name
			FROM
				production.brands
		);
END

-- Testing Trigger
INSERT INTO production.vw_brands
	(brand_name)
VALUES
	('John Wick');


SELECT * FROM production.vw_brands; -- default Approved
SELECT * FROM production.brand_approvals;


-- SQL Server Disable/Enable Triggers


-- SQL Server Drop Trigger