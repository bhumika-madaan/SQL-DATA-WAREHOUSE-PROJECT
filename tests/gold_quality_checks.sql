/*
********************************************************************
	Quality checks
********************************************************************
This script of SQL performs quality checks , validate the integrity ,
consistency , and accuracy of the gold layer. These checks ensure : 
	>> Uniqueness of surrogate keys in dimension table.
	>> Referential integrity between fact and dimension tables.
	>> Validation of relationships in data model for analytical purposes.
*/

-- ===============================================================
--  	gold.dim_customers
--  	 >> Checking for uniqueness of customer key 
-- ===============================================================

SELECT 
	customer_key,
	count(*) AS duplicate 
from gold.dim_customers
group by customer_key
having count(*) > 1

 
-- ===============================================================
--  	gold.dim_product
--     	 >> Checking for uniqueness of product key 
-- ===============================================================

SELECT 
	product_key,
	count(*) AS duplicate 
from gold.dim_product
group by product_key
having count(*) > 1


-- ===============================================================
--  	gold.fact_sales
--  	 >> Checking the connectivity between fact and dimension
--  	 >> Foriegn key Integrity ( Dimensions )
-- ===============================================================
  
Select * from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
left join gold.dim_product p
on p.product_key=f.product_key
where c.customer_key is null
