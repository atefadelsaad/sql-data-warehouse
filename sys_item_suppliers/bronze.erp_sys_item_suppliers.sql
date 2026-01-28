-- Create Bronze ERP sys_item_suppliers Table
-- This is the raw table storing ERP item data as received from the source system (retail Server)
USE db_Atef
IF OBJECT_ID('bronze.erp_sys_item_suppliers','U') IS NOT NULL
DROP TABLE bronze.erp_sys_item_suppliers;
CREATE TABLE bronze.erp_sys_item_suppliers (
    [itemean] [char](13) NOT NULL,
	[unit] [smallint] NOT NULL,
	[supplierno] [int] NOT NULL,
	[barcode] [char](20) NOT NULL,
	[supply_type] [smallint] NULL,
	[unitprice] [decimal](12, 3) NULL,
	[currency_code] [smallint] NULL,
	[minqty] [decimal](12, 3) NULL,
	[delay] [decimal](12, 3) NULL,
	[order_share] [decimal](7, 3) NULL,
	[purchasedate] [smalldatetime] NULL,
	[status] [smallint] NULL,
	[userid] [int] NULL,
	[transid] [smallint] NULL,
	[transdate] [smalldatetime] NULL,
	[peices] [smallint] NULL,
	[IsSalesOnLine] [smallint] NULL,
	[Old_unitprice] [decimal](12, 3) NULL,
	[Created_date] [datetime] NULL,
	[Createdby] [int] NULL,
	[Isdraft] [smallint] NULL,
	[Modified_date] [date] NULL,
	[Isloaded] [smallint] NULL,
	[Loadedby] [int] NULL,
	[Loadeddate] [datetime] NULL,
	[AdditionalInfo] [varchar](255) NULL,
	[Notes] [varchar](500) NULL,
	[Reserved1] [varchar](500) NULL,
	[Reserved2] [varchar](500) NULL,
	[Reserved3] [varchar](500) NULL,
	[Reserved4] [numeric](18, 3) NULL,
	[Reserved5] [numeric](18, 3) NULL,
	[Reserved6] [datetime] NULL,
	[Reserved7] [datetime] NULL,
	[Reserved8] [int] NULL,
	[Reserved9] [int] NULL,
	[Reserved10] [int] NULL,
	[Reserved11] [datetime] NULL,
	[Reserved12] [datetime] NULL,
	[Reserved13] [int] NULL,
	[Reserved14] [int] NULL,
	[Reserved15] [int] NULL,
	[BasicallyUnitPrice] [decimal](12, 3) NULL,
	[DiscountPercentage] [decimal](12, 3) NULL,
	[VateRateId] [smallint] NULL,
	[VateRate] [decimal](8, 3) NULL,
	[CalculateCostPrice] [decimal](12, 3) NULL,
	[last_modified_time] [datetime] NULL,
)

-- create procedure truncate table bronze.trun_tb_sys_item_suppliers
CREATE OR ALTER PROCEDURE bronze.trun_tb_item_suppliers
AS
BEGIN
	TRUNCATE TABLE bronze.erp_sys_item_suppliers
END

CREATE OR ALTER PROCEDURE bronze.load_sys_item_suppliers
AS
BEGIN
INSERT INTO db_Atef.bronze.erp_sys_item_suppliers(
    [itemean]
    ,[unit]
    ,[supplierno]
    ,[barcode]
    ,[supply_type]
    ,[unitprice]
    ,[currency_code]
    ,[minqty]
    ,[delay]
    ,[order_share]
    ,[purchasedate]
    ,[status]
    ,[userid]
    ,[transid]
    ,[transdate]
    ,[peices]
    ,[IsSalesOnLine]
    ,[Old_unitprice]
    ,[Created_date]
    ,[Createdby]
    ,[Isdraft]
    ,[Modified_date]
    ,[Isloaded]
    ,[Loadedby]
    ,[Loadeddate]
    ,[AdditionalInfo]
    ,[Notes]
    ,[Reserved1]
    ,[Reserved2]
    ,[Reserved3]
    ,[Reserved4]
    ,[Reserved5]
    ,[Reserved6]
    ,[Reserved7]
    ,[Reserved8]
    ,[Reserved9]
    ,[Reserved10]
    ,[Reserved11]
    ,[Reserved12]
    ,[Reserved13]
    ,[Reserved14]
    ,[Reserved15]
    ,[BasicallyUnitPrice]
    ,[DiscountPercentage]
    ,[VateRateId]
    ,[VateRate]
    ,[CalculateCostPrice]
    ,[last_modified_time]
)
SELECT TOP 35605
    [itemean]
    ,[unit]
    ,[supplierno]
    ,[barcode]
    ,[supply_type]
    ,[unitprice]
    ,[currency_code]
    ,[minqty]
    ,[delay]
    ,[order_share]
    ,[purchasedate]
    ,[status]
    ,[userid]
    ,[transid]
    ,[transdate]
    ,[peices]
    ,[IsSalesOnLine]
    ,[Old_unitprice]
    ,[Created_date]
    ,[Createdby]
    ,[Isdraft]
    ,[Modified_date]
    ,[Isloaded]
    ,[Loadedby]
    ,[Loadeddate]
    ,[AdditionalInfo]
    ,[Notes]
    ,[Reserved1]
    ,[Reserved2]
    ,[Reserved3]
    ,[Reserved4]
    ,[Reserved5]
    ,[Reserved6]
    ,[Reserved7]
    ,[Reserved8]
    ,[Reserved9]
    ,[Reserved10]
    ,[Reserved11]
    ,[Reserved12]
    ,[Reserved13]
    ,[Reserved14]
    ,[Reserved15]
    ,[BasicallyUnitPrice]
    ,[DiscountPercentage]
    ,[VateRateId]
    ,[VateRate]
    ,[CalculateCostPrice]
    ,[last_modified_time]
FROM Retail.dbo.sys_item_suppliers
END

EXEC bronze.trun_tb_item_suppliers
EXEC bronze.load_sys_item_suppliers

SELECT * FROM bronze.erp_sys_item_suppliers

