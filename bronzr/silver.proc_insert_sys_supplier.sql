CREATE OR ALTER PROCEDURE silver.proc_insert_sys_supplier
AS 
BEGIN
	INSERT INTO silver.clean_sys_supplier(
		supplierno,
		a_name,
		l_name,
		trademark
	)
	SELECT 
		supplierno,
		TRIM(a_name) AS a_name,
		CASE 
			 WHEN l_name IS NULL OR l_name = '' 
				  THEN 'N/A'
			 ELSE TRIM(l_name)
		END l_name,
		COALESCE(trademark,a_name,'N/A') AS trademark
	FROM bronze.erp_sys_supplier
END
