USE BikeStores;

BEGIN
	SELECT
		product_id,
		product_name
	FROM
		production.products
	WHERE
		list_price > 100000;

	IF @@ROWCOUNT = 0
		PRINT 'No product with price greater than 100000 found';
END;

-- Nesting BIGIN...END
BEGIN
	DECLARE @name VARCHAR(MAX);

	SELECT TOP 1
		@name = product_name
	FROM
		production.products
	ORDER BY
		list_price DESC;

	IF @@ROWCOUNT <> 0
		BEGIN
			PRINT 'The most expensive product is ' + @name
		END
	ELSE
		BEGIN
			PRINT 'No product found';
		END;
END;