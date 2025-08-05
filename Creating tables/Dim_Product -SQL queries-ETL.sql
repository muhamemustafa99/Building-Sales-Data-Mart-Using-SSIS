--DFT-dim_product
SELECT 
	ProductID AS product_id ,
	Name AS product_name,
	Color,
	ReorderPoint AS reorder_point,
	StandardCost AS standard_cost,
	ProductSubcategoryID,
	ProductModelID
FROM Production.Product
==================================================

--Lookup-Product Model
SELECT
	pm.ProductModelID,
	pm.Name AS model_name,
	pd.Description AS Product_description
FROM [Production].[ProductModel] AS pm
	LEFT JOIN production.ProductModelProductDescriptionCulture AS pdi 
		ON pm.ProductModelID = pdi.ProductModelID
	LEFT JOIN [Production].[ProductDescription] AS pd
		ON pdi.ProductDescriptionID = pd.ProductDescriptionID
WHERE pdi.CultureID = 'en' OR pdi.CultureID IS null
UNION ALL
SELECT null,null,null
==================================================

--Lookup-Product Cat AND SubCategory
SELECT
	psc.ProductSubcategoryID,
	psc.Name AS product_subcategory,
	pc.name AS product_category
FROM [Production].[ProductSubcategory] AS psc
	LEFT JOIN [Production].[ProductCategory] AS pc
		ON psc.ProductCategoryID = pc.ProductCategoryID
UNION ALL
SELECT null,null,null
==================================================

--Cheacking
USE EO_AdventureWorksDW2022
GO
SELECT count(*)
FROM [dbo].[dim_product]

SELECT product_key, product_key %10
FROM dim_product

--Deleting 10% of records
DELETE FROM dim_product WHERE product_key %10 = 6;

--Updating product color
UPDATE dim_product 
    SET color = 'Dark-Green'
	WHERE product_key % 10 =3;

--Updating reorder_point by adding 10% to it
UPDATE dim_product
    SET reorder_point = round(reorder_point*1.1 ,0)
	WHERE product_key % 10 =4;
==================================================

