USE EO_AdventureWorksDW2022
GO
--Getting the last load date
SELECT last_load_date
FROM meta_control_table
WHERE source_table = 'sales order header'

--=======================================================
--SCR 1- SalesOrderHeader
USE AdventureWorks2022
GO
SELECT
	SalesOrderID,
	SalesOrderNumber,
	CONVERT(date, OrderDate) AS OrderDate,
	CustomerID,
	TerritoryID,
	TaxAmt,
	Freight
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 1
AND ModifiedDate >= ? -- user variable, last update date
AND ModifiedDate < ? -- system variabl, StartTime
ORDER BY sales_order_id
--------------------------------------
--SCR 2- SalesOrderDetail
﻿SELECT
	sod.SalesOrderID AS SalesOrderID,
	SalesOrderDetailID,
	OrderQty,
	ProductID,
	UnitPrice,
	UnitPriceDiscount,
	LineTotal
FROM sales.SalesOrderDetail AS sod
INNER JOIN sales.SalesOrderHeader AS soh
	ON sod.SalesOrderID = soh.SalesOrderID
WHERE OnlineOrderFlag = 1
AND soh.ModifiedDate >= ? -- user variable, last update date
AND soh.ModifiedDate < ? -- system variabl, StartTime
ORDER BY SalesOrderID
--------------------------------------------------

--Updating the last load date
Update meta_control_table
      SET last_load_date =?
	  WHERE source_table = 'Sales Order Header'

--======================================================================

