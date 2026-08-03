/* 
******************************************************************
  DDL Script : Create Gold Views 
******************************************************************
This Script of SQL creates views for the Gold Layer in the data 
Warehouse. The Gold layer represents the final dimension and fact 
tables ( Star Schema ).

Each view performes transformation and combines data from the silver
layer to produce a enriched and business-ready dataset.

*/
=============================================================
	Dimension : gold.dim_customers
=============================================================

CREATE VIEW gold.dim_customers AS 
	SELECT
		ROW_NUMBER() OVER(ORDER BY ci.cst_id ) AS customer_key,
		ci.cst_id AS customer_id,
		ci.cst_key As customer_number ,
		ci.cst_firstname AS first_name,
		ci.cst_lastname AS last_name,
		la.CNTRY AS country,
		ci.cst_marital_status AS marital_status,
		CASE WHEN ci.cst_gender !='Unknown' THEN ci.cst_gender
				  ELSE ISNULL(ca.gen,'N/A')
		END AS gender,
		ca.BDATE AS birthdate,
		ci.cst_create_date AS create_date
	FROM Silver.crm_cust_info ci
	LEFT JOIN Silver.erp_cust_az12 ca 
	ON ca.cid=ci.cst_key
	LEFT JOIN Silver.erp_loc_a101 la
	ON ci.cst_key = la.cid

=============================================================
	Dimension : gold.dim_product
=============================================================

CREATE VIEW gold.dim_product as 
	SELECT
		ROW_NUMBER() OVER(ORDER BY pn.prd_start_dt , prd_key) AS product_key,
		pn.prd_id AS product_id,
		pn.prd_key AS product_number,
		pn.prd_nm AS product_name,
		pn.cat_id AS Category_id,
		pc.CAT AS category,
		pc.SUBCAT AS Subcategory,
		pc.maintenance,
		pn.prd_cost AS product_cost,
		pn.prd_line AS product_line,
		pn.prd_start_dt	AS start_date
	FROM Silver.crm_prd_info pn
	LEFT JOIN Silver.erp_px_cat_g1v2 pc
	ON pn.cat_id=pc.ID
	WHERE prd_end_dt IS NULL 


=============================================================
	Fact: gold.fact_sales
=============================================================
CREATE VIEW gold.fact_sales AS
	SELECT 
		sd.sls_ord_num AS Order_number,
		pr.product_key,
		dc.customer_key,
		sd.sls_order_dt AS Order_date,
		sd.sls_ship_dt AS Ship_date,
		sd.sls_due_dt AS Due_date,
		sd.sls_sales AS sales_amount,
		sd.sls_quantity AS Quantity,
		sd.sls_price AS Price
	FROM Silver.crm_sales_details sd
	LEFT JOIN gold.dim_product pr
	ON sd.sls_prd_key=pr.product_number
	LEFT JOIN gold.dim_customers dc
	ON sd.sls_cust_id=dc.customer_id




