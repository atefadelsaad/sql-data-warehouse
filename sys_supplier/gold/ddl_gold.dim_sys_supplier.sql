IF OBJECT_ID ('gold.dim_sys_supplier','U') IS NOT NULL
    DROP TABLE gold.dim_sys_supplier
CREATE TABLE gold.dim_sys_supplier(
	[supplierno] [int] NOT NULL,
	[a_name] [varchar](50) NOT NULL,
	[l_name] [varchar](50) NULL,
	[trademark] [varchar](70) NULL
)
