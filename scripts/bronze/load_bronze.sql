/* 

**********************************************************
Stored Procedure : Bronze.Load_bronze
**********************************************************
>> This Procedure loads data into Bronze schema tables from external csv files. 
>> It Truncates the bronze Table before loading the data .
>> This Procedure does not accept any parameters or return any value.
>> Usage example : EXEC bronze.load_bronze;

*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATE , @end_time DATE , @B_start_time DATE , @B_end_time DATE
	BEGIN TRY
		
		SET @B_start_time=GETDATE()
		PRINT ('========================================================')
		PRINT ('Loading Bronze Layer')
		PRINT ('========================================================')

		PRINT ('--------------------------------------------------------')
		PRINT ('Loading CRM Tables')
		PRINT ('--------------------------------------------------------')

		SET @start_time=GETDATE()
		PRINT ('>>> Truncating Table : bronze.crm_cust_info')
		TRUNCATE TABLE bronze.crm_cust_info
		PRINT ('>>> Inserting Data Into : bronze.crm_cust_info')
		BULK INSERT bronze.crm_cust_info
		from 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
		)
		SET @end_time=GETDATE()
		PRINT('>>> LOAD DURATION : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds')
		PRINT(' ************************************************************************')


		SET @start_time=GETDATE()
		PRINT ('>>> Truncating Table : bronze.crm_prd_info')
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT ('>>> Inserting Data Into : bronze.crm_prd_info')
		BULK INSERT bronze.crm_prd_info
		from 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
		)
		SET @end_time=GETDATE()
		PRINT('>>> LOAD DURATION : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds')
		PRINT(' ************************************************************************')

		SET @start_time=GETDATE()
		PRINT ('>>> Truncating Table : bronze.crm_sales_details')
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT ('>>> Inserting Data Into : bronze.crm_sales_details')
		BULK INSERT bronze.crm_sales_details
		from 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
		)
		SET @end_time=GETDATE()
		PRINT('>>> LOAD DURATION : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds')
		PRINT(' ************************************************************************')


		PRINT ('--------------------------------------------------------')
		PRINT ('Loading ERP Tables')
		PRINT ('--------------------------------------------------------')


		SET @start_time=GETDATE()
		PRINT ('>>> Truncating Table : bronze.erp_cust_az12')
		TRUNCATE TABLE bronze.erp_cust_az12
		PRINT ('>>> Inserting Data Into : bronze.erp_cust_az12')
		BULK INSERT bronze.erp_cust_az12
		from 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
		)
		SET @end_time=GETDATE()
		PRINT('>>> LOAD DURATION : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds')
		PRINT(' ************************************************************************')

		SET @start_time=GETDATE()
		PRINT ('>>> Truncating Table : bronze.erp_loc_a101')
		TRUNCATE TABLE bronze.erp_loc_a101
		PRINT ('>>> Inserting Data Into : bronze.erp_loc_a101')
		BULK INSERT bronze.erp_loc_a101
		from 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
		)
		SET @end_time=GETDATE()
		PRINT('>>> LOAD DURATION : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds')
		PRINT(' ************************************************************************')

		SET @start_time=GETDATE()
		PRINT ('>>> Truncating Table : bronze.erp_px_cat_g1v2')
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		PRINT ('>>> Inserting Data Into : bronze.erp_px_cat_g1v2')
		BULK INSERT bronze.erp_px_cat_g1v2
		from 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
		)
		SET @end_time=GETDATE()
		PRINT('>>> LOAD DURATION : ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds')
		PRINT(' ************************************************************************')

		SET @B_end_time=GETDATE()
		PRINT('>>> Load Duration of Bronze Layer : ' +CAST(DATEDIFF(second,@B_start_time,@B_end_time) AS NVARCHAR) + ' Seconds')

	END TRY
	BEGIN CATCH
		PRINT('****************************************************************************')
		PRINT('ERROR OCCURED DURING LOADING BRONZE LAYER ')
		PRINT ('ERROR MESSAGE : '+ERROR_MESSAGE())
		PRINT ('ERROR CODE : '+CAST(ERROR_NUMBER() AS NVARCHAR))
		PRINT('****************************************************************************')


	END CATCH 
		
END;

EXEC Bronze.load_bronze
