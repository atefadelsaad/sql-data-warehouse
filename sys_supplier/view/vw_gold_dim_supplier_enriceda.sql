CREATE VIEW vw_gold_dim_supplier_enriceda AS (
	SELECT
	gi.itemean,
	gi.a_name,
	gi.l_name,
	gi.sub_group,
	gi.supplier,
	gs.a_name AS a_name_supplier,
	gs.trademark
	FROM gold.dim_sys_item gi
	JOIN gold.dim_sys_supplier gs ON gi.supplier = gs.supplierno
)

SELECT * FROM vw_gold_dim_supplier_enriceda
