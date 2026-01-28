-- Create gold Clean Table for ERP Items
-- Table name: clean_sys_item_suppliers
-- This table stores cleaned and standardized ERP item data
-- Data source: silver.clean_sys_item_suppliers (silver Layer)
IF OBJECT_ID('gold.dim_sys_item_suppliers','U') IS NOT NULL
DROP TABLE gold.dim_sys_item_suppliers;
CREATE TABLE gold.dim_sys_item_suppliers(
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
--update gold in silver
CREATE OR ALTER PROCEDURE gold.updaet_dim_load_sys_item
AS
BEGIN
UPDATE gis
SET
	gis.itemean_number = sis.itemean_number,
	gis.itemean = sis.itemean,
    gis.unit          = sis.unit,
    gis.supplierno    = sis.supplierno,
    gis.barcode       = sis.barcode,
    gis.supply_type   = sis.supply_type,
    gis.unitprice     = sis.unitprice,
    gis.currency_code = sis.currency_code,
    gis.minqty        = sis.minqty,
    gis.delay         = sis.delay,
    gis.order_share   = sis.order_share,
    gis.transdate     = sis.transdate
FROM gold.dim_sys_item_suppliers gis
JOIN silver.clean_sys_item_suppliers sis
    ON gis.itemean = sis.itemean
WHERE
	--gis.itemean_number != sis.itemean_number OR
	--gis.itemean != sis.itemean OR
    gis.unit          <> sis.unit OR
    gis.supplierno    <> sis.supplierno OR
    gis.barcode       <> sis.barcode OR
    gis.supply_type   <> sis.supply_type OR
    gis.unitprice     <> sis.unitprice OR
    gis.currency_code <> sis.currency_code OR
    gis.minqty        <> sis.minqty OR
    gis.delay         <> sis.delay OR
    gis.order_share   <> sis.order_share OR
    gis.transdate     <> sis.transdate;
END


CREATE OR ALTER PROCEDURE gold.dim_load_sys_item
AS
BEGIN
    INSERT INTO gold.dim_sys_item_suppliers (
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
	FROM silver.clean_sys_item_suppliers
END
EXEC gold.updaet_dim_load_sys_item
EXEC gold.dim_load_sys_item
SELECT * FROM gold.dim_sys_item_suppliers






SELECT sis.* FROM silver.clean_sys_item_suppliers sis
WHERE not exists
(SELECT * FROM gold.dim_sys_item_suppliers gis  WHERE gis.itemean = sis.itemean)


delete t FROM (SELECT gis.* FROM gold.dim_sys_item_suppliers gis)t
WHERE not exists
(SELECT * FROM silver.clean_sys_item_suppliers sis WHERE t.itemean= sis.itemean)


insert into gold.dim_sys_item_suppliers (itemean_number,itemean,unit,supplierno,barcode,supply_type,unitprice,currency_code,minqty,delay,order_share,transdate)
SELECT sis.* FROM silver.clean_sys_item_suppliers sis
WHERE not exists
(SELECT * FROM gold.dim_sys_item_suppliers gis  WHERE gis.itemean = sis.itemean)


SELECT gis.* FROM gold.dim_sys_item_suppliers gis
WHERE not exists
(SELECT * FROM silver.clean_sys_item_suppliers sis WHERE gis.itemean = sis.itemean)

	--UPDATE gis
	--set 
	--gis.itemean_number = sis.itemean_number,
	--gis.itemean = sis.itemean,
	--gis.unit = sis.unit ,
	--gis.supplierno = sis.supplierno ,
	--gis.barcode = sis.barcode ,
	--gis.supply_type = sis.supply_type, 
	--gis.unitprice = sis.unitprice ,
	--gis.currency_code = sis.currency_code ,
	--gis.minqty = sis.minqty ,
	--gis.delay = sis.delay ,
	--gis.order_share = sis.order_share ,
	--gis.transdate = sis.transdate
	--from silver.clean_sys_item_suppliers sis  JOIN  gold.dim_sys_item_suppliers gis
	--on gis.itemean = sis.itemean
	--where
	--gis.unit != sis.unit or
	--gis.supplierno != sis.supplierno or
	--gis.barcode != sis.barcode or
	--gis.supply_type != sis.supply_type or
	--gis.unitprice != sis.unitprice or
	--gis.currency_code != sis.currency_code or
	--gis.minqty != sis.minqty or
	--gis.delay != sis.delay or
	--gis.order_share != sis.order_share or
	--gis.transdate != sis.transdate