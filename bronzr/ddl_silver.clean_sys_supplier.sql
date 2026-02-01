IF OBJECT_ID('silver.clean_sys_supplier','U') IS NOT NULL
   DROP TABLE silver.clean_sys_supplier
CREATE TABLE silver.clean_sys_supplier(
	[supplierno] [int] NOT NULL,
	[a_name] [varchar](50) NOT NULL,
	[l_name] [varchar](50) NULL,
	[trademark] [varchar](70) NULL
)





