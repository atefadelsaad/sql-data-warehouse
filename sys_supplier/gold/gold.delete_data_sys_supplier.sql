CREATE OR ALTER PROCEDURE gold.delete_data_sys_supplier
AS
BEGIN
	delete t FROM (SELECT gds.* FROM gold.dim_sys_supplier gds)t
	    WHERE not exists
	(SELECT * FROM silver.clean_sys_supplier sis WHERE t.supplierno= sis.supplierno)
END
