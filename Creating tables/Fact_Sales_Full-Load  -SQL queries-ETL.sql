USE AdventureWorks2022
GO
SELECT *
FROM[Sales].[SalesOrderDetail]

SELECT *
FROM[Sales].[SalesOrderHeader]


--ssis fact_sales full_load
--SCR 1
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
ORDER BY SalesOrderID

--=================================================================

--ssis fact_sales full_load
--SCR 2
﻿SELECT
	SalesOrderID,
	SalesOrderDetailID,
	OrderQty,
	ProductID,
	UnitPrice,
	UnitPriceDiscount,
	LineTotal
FROM sales.SalesOrderDetail
ORDER BY SalesOrderID

--=================================================================
USE EO_AdventureWorksDW2022
GO
--ssis fact_sales LKP_dim_customer
SELECT
	customer_key,
	customer_id
FROM dim_customer
WHERE is_current = 1

--ssis fact_sales LKP_dim_product
﻿SELECT
	product_key,
	product_id,
	standard_cost
FROM dim_product
WHERE is_current = 1

--ssis fact_sales LKP_dim_territory
SELECT
	territory_key,
	territory_id
FROM dim_territory
WHERE is_current = 1

--ssis fact_sales LKP_dim_date
SELECT
	date_key AS order_date_key,
	full_date
FROM dim_date
