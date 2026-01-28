-- Create Silver Clean Table for ERP Items
-- Table name: clean_sys_item
-- This table stores cleaned and standardized ERP item data
-- Data source: bronze.erp_sys_item (Bronze Layer)
IF OBJECT_ID('silver.clean_sys_item','U')IS NOT NULL
DROP TABLE silver.clean_sys_item
CREATE TABLE silver.clean_sys_item(
	itemean CHAR(13) NOT NULL,
	a_name NVARCHAR(50) NULL,
	l_name NVARCHAR(50) NULL,
	sub_group SMALLINT NOT NULL,
	supplier INT NULL
)
CREATE OR ALTER PROCEDURE silver.trun_tb_clean_sys_item
AS
BEGIN
TRUNCATE TABLE silver.clean_sys_item
END

CREATE OR ALTER PROCEDURE silver.load_sys_item AS
BEGIN
	INSERT INTO silver.clean_sys_item
	   (
		itemean,
		a_name,
		l_name,
		sub_group,
		supplier 
	    )
	select 
	TRIM(itemean) as itemean,
	TRIM(a_name) as a_name,
	CASE
		WHEN l_name is null or l_name = ''
		THEN 'N/A'
		ELSE l_name
	END l_name,
	    department as sub_group,
	    producerno as supplier
	from bronze.erp_sys_item order by itemean
END

EXEC silver.load_sys_item
EXEC silver.trun_tb_clean_sys_item
SELECT * FROM silver.clean_sys_item