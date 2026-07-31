/* 

************************************************************************
  Quality Checks
************************************************************************
This script of SQL performs Various quality checks for data consistency,
accuracy, and standardization across the Silver schema. It include checks 
for : 
    >> Null or duplicate primary keys.
    >> Unwanted spaces in string fields.
    >> Data standardization and consistency.
    >> Invald date ranges and orders.
    >> Data consistency between related fields.

( Run these checks after data loading Silver Layer )

*/

-- ==============================================
-- Quality Check for Silver.crm_cust_info
-- ==============================================

	--Checking for the nulls or duplicates
		SELECT 
			cst_id,
			COUNT(*)
		FROM Silver.crm_cust_info
		GROUP BY cst_id
		HAVING COUNT(*) > 1

	-- Checking for unwanted Spaces

		SELECT cst_firstname 
		FROM Silver.crm_cust_info
		WHERE cst_firstname!=TRIM(cst_firstname)

	--Data Standardization and consistency

		SELECT DISTINCT cst_gender
		FROM Silver.crm_cust_info

-- ==============================================
-- Quality Check for Silver.crm_prd_info
-- ==============================================
		
	--Checking for the nulls or duplicates

		SELECT 
			prd_id,
			COUNT(*)
		FROM Silver.crm_prd_info
		GROUP BY prd_id
		HAVING COUNT(*) > 1

	-- Checking for unwanted Spaces

		SELECT prd_nm 
		FROM Silver.crm_prd_info
		WHERE prd_nm!=TRIM(prd_nm)

	-- Check for nulls or negative numbers 

		SELECT prd_cost 
		FROM Silver.crm_prd_info
		WHERE prd_cost < 0 OR prd_cost IS NULL 

	--Data Standardization and consistency

		SELECT DISTINCT prd_line
		FROM Silver.crm_prd_info

	--Check for Invalid Dates 

		 SELECT * FROM Silver.crm_prd_info 
		 WHERE prd_end_dt < prd_start_dt

-- ==============================================
-- Quality Check for Silver.crm_sales_details
-- ==============================================

	--Check for Invalid Date Orders

		Select * from Silver.crm_sales_details
		WHERE sls_order_dt > sls_ship_dt or  sls_order_dt > sls_due_dt

	--Check Data Consistency : Sales , Quantity and Price
		
		Select 
			sls_sales,
			sls_quantity,
			sls_price
		from Silver.crm_sales_details
		where sls_sales !=sls_quantity*sls_price
		or sls_price is null or sls_sales is null or sls_quantity is null 
		or sls_price <= 0 or sls_sales <= 0 or sls_quantity <= 0
		order by sls_sales, sls_quantity, sls_price

-- ==============================================
-- Quality Check for Silver.erp_cust_az12
-- ==============================================
		
		--Identifying out of range birthdates
			
			SELECT BDATE FROM Silver.erp_cust_az12
			WHERE BDATE > GETDATE()

		-- Distinct Genders

		    SELECT DISTINCT gen from Silver.erp_cust_az12

-- ==============================================
-- Quality Check for Silver.erp_loc_a101
-- ==============================================
		
		-- Distinct Country

			SELECT DISTINCT cntry from Silver.erp_loc_a101

-- ==============================================
-- Quality Check for Silver.erp_px_cat_g1v2
-- ==============================================

		-- Check for Unwanted Spaces
			
			SELECT * FROM Silver.erp_px_cat_g1v2
			WHERE cat !=TRIM(cat) OR subcat!= TRIM(subcat) or MAINTENANCE!= TRIM(MAINTENANCE)

		-- Data Standardization and Consistency
		 
			SELECT DISTINCT 
			cat FROM Silver.erp_px_cat_g1v2

			SELECT DISTINCT 
			MAINTENANCE FROM Silver.erp_px_cat_g1v2
