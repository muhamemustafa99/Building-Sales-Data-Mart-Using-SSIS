--DFT-Customer table
SELECT CustomerID AS customer_id, PersonID
fROM Sales.customer
WHERE PersonID IS NOT NULL
UNION ALL
SELECT NULL,NULL
--==========================================================

--LKP-
SELECT
	p.BusinessEntityID AS personid,
	CAST( 
		( ISNULL(p.FirstName, '') +' ' + ISNULL(p.MiddleName, '') +' '+ ISNULL(p.LAStName, '') ) AS NVARCHAR(150)) AS customer_name,
	a2.AddressLine1 AS address1,
	a2.AddressLine2 AS address2,
	a2.City,
	-- a2.PostalCode,
	pp.PhoneNumber AS phone
FROM Person.Person AS p
	LEFT JOIN Person.BusinessEntityAddress AS a1 
		ON p.BusinessEntityID = a1.BusinessEntityID and a1.AddressTypeID = 2    -- there are few customers with multiple address types (2,5)
	LEFT JOIN Person.Address AS a2 
		ON a2.AddressID = a1.AddressID 
	LEFT JOIN Person.PersonPhone AS pp
		ON p.BusinessEntityID = pp.BusinessEntityID
--==========================================================

---------Cheaking Part
--Deleting
USE EO_AdventureWorksDW2022
GO
DELETE FROM dim_customer
WHERE customer_id %50 = 2;

--Updating the city
UPDATE dim_customer
      SET city ='cairo'
      WHERE city = 'paris';

--Updating the phone number 
UPDATE dim_customer
      SET phone = SUBSTRING(phone,10,3)+SUBSTRING(phone,4,5)+SUBSTRING(phone,9,1)+SUBSTRING(phone,1,3) 
	  -- Rearranging phone number format from 12-digit raw to a custom scrambled format
	  WHERE LEN(phone) = 12 AND LEFT(phone,3) BETWEEN '101' AND '125';

--Updated records - SCD type 2
SELECT customer_id,count(*)
FROM dim_customer
GROUP BY customer_id
having count(*) > 1
