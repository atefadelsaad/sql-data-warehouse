-- Gold Fact Table for ERP Items
-- This table contains aggregated and processed data ready for reporting and analytics
-- Data source: silver.clean_sys_item (Silver Layer)
IF OBJECT_ID('gold.dim_sys_item','U') IS NOT NULL
DROP TABLE gold.dim_sys_item
CREATE TABLE gold.dim_sys_item (
	itemean CHAR(13) NOT NULL,
	a_name NVARCHAR(50) NULL,
	l_name NVARCHAR(50) NULL,
	sub_group SMALLINT NOT NULL,
	supplier INT NULL
)

CREATE OR ALTER PROCEDURE gold.dim_load_sys_item AS
BEGIN
	INSERT INTO gold.dim_sys_item
	   (
		itemean,
		a_name,
		l_name,
		sub_group,
		supplier 
	    )
     SELECT
		itemean,
		a_name,
		l_name,
		sub_group,
		supplier 
     FROM silver.clean_sys_item
END

EXEC gold.dim_load_sys_item
SELECT * from gold.dim_sys_item