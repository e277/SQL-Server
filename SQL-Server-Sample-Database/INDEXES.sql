USE BikeStores;

-- clustered
CREATE TABLE production.parts(
	part_id INT NOT NULL,
	part_name VARCHAR(100)
);

INSERT INTO
	production.parts(part_id, part_name)
VALUES
	(1, 'Frame'),
	(2, 'Head Tube'),
	(3, 'Handlebar Grip'),
	(4, 'Shock Absorber'),
	(5, 'Fork');

SELECT
	part_id,
	part_name
FROM
	production.parts
WHERE
	part_id = 5;

-- with primary key - clustered index is automatically created
CREATE TABLE production.part_prices(
	part_id INT,
	valid_from date,
	price DECIMAL(10,4) NOT NULL,
	PRIMARY KEY(part_id, valid_from)
);

ALTER TABLE production.parts
ADD PRIMARY KEY(part_id);

SELECT
	customer_id,
	city
FROM
	sales.customers
WHERE
	city = 'Atwater';

-- one column
CREATE INDEX ix_customer_city
ON sales.customers(city);

-- multiple column
SELECT
	customer_id, first_name, last_name
FROM
	sales.customers
WHERE
	last_name = 'Berg' AND first_name = 'Monika';

CREATE INDEX ix_customers_name
ON sales.customers(last_name, first_name);

SELECT
	customer_id, first_name, last_name
FROM
	sales.customers
WHERE
	-- last_name = 'Albert';
	first_name = 'Adam';

-- Rename Index
EXEC sp_rename
	N'sales.customers.ix_customers_name',
	N'ix_customers_fname_lname',
	N'INDEX';