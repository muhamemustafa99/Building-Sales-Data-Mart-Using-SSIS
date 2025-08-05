USE EO_AdventureWorksDW2022 
go 

IF EXISTS (SELECT * 
           FROM   sys.tables 
           WHERE  NAME = 'lookup_country') 
  DROP TABLE lookup_country; 

CREATE TABLE lookup_country 
  ( 
     country_id     INT NOT NULL IDENTITY(1, 1), 
     counttry_name  NVARCHAR(50) NOT NULL, 
     country_code   NVARCHAR(2) NOT NULL, 
     country_region NVARCHAR(50) 
  ); 

INSERT INTO lookup_country 
            (counttry_name, 
             country_code, 
             country_region) 
VALUES      ('United States', 'US', 'North America'), 
            ('Canada', 'CA', 'North America'), 
            ('France', 'FR', 'Europe'), 
            ('Germany', 'DE', 'Europe'), 
            ('Australia', 'AU', 'Pacific'), 
            ('United Kingdom', 'GB', 'Europe'); 

--=====================================================================
USE AdventureWorks2022
GO
--ssis_dim_territory.sql
﻿SELECT
	TerritoryID AS territory_id,
	Name AS territory_name,
	CountryRegionCode AS country_code
FROM Sales.SalesTerritory
--=====================================================================
USE EO_AdventureWorksDW2022
GO
--ssis_lookup_territory.sql
﻿SELECT
	[country_id],
	[counttry_name] AS territory_country,
	[country_code],
	[country_region] AS territory_group
FROM [lookup_country]
--=====================================================================
Select * from dim_territory