CREATE OR ALTER PROCEDURE gold.up_insert_data_sys_supplier
AS
BEGIN
		insert into gold.dim_sys_supplier (supplierno,a_name,l_name,trademark)
		SELECT scs.* FROM silver.clean_sys_supplier scs
		WHERE not exists
		(SELECT * FROM gold.dim_sys_supplier gds  WHERE gds.supplierno = scs.supplierno)
END
