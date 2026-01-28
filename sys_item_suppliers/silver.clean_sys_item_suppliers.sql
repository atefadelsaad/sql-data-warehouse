-- Create Silver Clean Table for ERP Items
-- Table name: clean_sys_item_suppliers
-- This table stores cleaned and standardized ERP item data
-- Data source: bronze.erp_sys_item_suppliers (Bronze Layer)
IF OBJECT_ID('silver.clean_sys_item_suppliers','U') IS NOT NULL
DROP TABLE silver.clean_sys_item_suppliers;
CREATE TABLE silver.clean_sys_item_suppliers(
itemean_number INT NOT NULL,
itemean CHAR(13) NOT NULL,
unit SMALLINT NOT NULL,
supplierno SMALLINT NOT NULL,
barcode CHAR(20) NOT NULL,
supply_type SMALLINT  NULL,
unitprice decimal(12,2),
currency_code SMALLINT NOT NULL,
minqty decimal(12,2),
delay decimal(12,2),
order_share decimal(12,1),
transdate DATE
)
CREATE OR ALTER PROCEDURE silver.trun_tb_clean_sys_item_suppliers
AS
BEGIN
TRUNCATE TABLE silver.clean_sys_item_suppliers
END

CREATE OR ALTER PROCEDURE silver.load_sys_item_suooliers
AS
BEGIN
    INSERT INTO silver.clean_sys_item_suppliers (
		itemean_number,
		itemean,
		unit,
		supplierno,
		barcode,
		supply_type,
		unitprice,
		currency_code,
		minqty,
		delay,
		order_share,
		transdate 
	    )
	SELECT 
		ROW_NUMBER() OVER(PARTITION BY itemean  ORDER BY itemean)itemean_number,
		TRIM(itemean) AS itemean,
		unit,
		supplierno,
		TRIM(barcode) AS barcode,
		nullif(supply_type,0) AS supply_type,
		CAST(unitprice AS decimal(12,2)) AS unitprice,
		currency_code,
		CAST(minqty AS decimal(12,2)) AS minqty,
		CAST(delay AS decimal(12,2)) AS delay,
		CAST(order_share AS decimal(12,1)) AS order_share,
		CAST(transdate AS DATE) AS transdate
	FROM bronze.erp_sys_item_suppliers
END
EXEC silver.trun_tb_clean_sys_item_suppliers
EXEC silver.load_sys_item_suooliers
SELECT * FROM silver.clean_sys_item_suppliers

