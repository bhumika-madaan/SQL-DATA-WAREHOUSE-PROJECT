/*
*************************************************************************
  Create Database and Schemas 
*************************************************************************
This script of SQL creates a new database named 'DataWareHouse' after 
checking if it already exists. If the database exists, it is droppped 
and recreated. The script sets up three schemas within the databse :
      >> Bronze 
      >> Silver 
      >> Gold 
*/ 

USE masters ;
go 
-- Drop and recreate the 'DataWareHouse' Database
IF EXISTS ( SELECT 1 FROM sys.databases WHERE name='DataWareHouse')
BEGIN 
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouse;
END;
GO

-- Create the 'DataWreHouse' Database
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO

-- Create Schemas 
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO
  
CREATE SCHEMA Gold;
GO
