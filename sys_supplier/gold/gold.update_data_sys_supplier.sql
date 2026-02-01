
CREATE OR ALTER PROCEDURE gold.update_data_sys_supplier
AS
BEGIN
		UPDATE gys
		SET
			gys.supplierno= scs.supplierno,
			gys.a_name    = scs.a_name,
			gys.l_name    = scs.l_name,
			gys.trademark = scs.trademark
			
		FROM gold.dim_sys_supplier gys
		JOIN silver.clean_sys_supplier scs
			ON gys.supplierno = scs.supplierno
		WHERE		
	    	gys.supplierno<> scs.supplierno OR
			gys.a_name    <> scs.a_name OR
			gys.l_name    <> scs.l_name OR
			gys.trademark <> scs.trademark
END 

EXEC gold.update_data_sys_supplier
