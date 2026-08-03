/*

/*
===============================================================
	gold.dim_customers
	 >> Checking for uniqueness of customer key 
===============================================================
*/
SELECT 
	customer_key,
	count(*) AS duplicate 
from gold.dim_customers
group by customer_key
having count(*) > 1

/*  
===============================================================
	gold.dim_product
	 >> Checking for uniqueness of product key 
===============================================================
*/

SELECT 
	product_key,
	count(*) AS duplicate 
from gold.dim_product
group by product_key
having count(*) > 1

  /*
===============================================================
	gold.fact_sales
	 >> Checking the connectivity between fact and dimension
	 >> Foriegn key Integrity ( Dimensions )
===============================================================
*/
  
Select * from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
left join gold.dim_product p
on p.product_key=f.product_key
where c.customer_key is null
