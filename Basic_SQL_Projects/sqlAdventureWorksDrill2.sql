USE AdventureWorks2014
Go

ALTER PROCEDURE [dbo].[uspGetAddress] @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT a1.FirstName, a1.LastName, a5.AddressLine1, a5.City
FROM Person.Person a1
	FULL OUTER JOIN Person.BusinessEntityContact a2 ON a2.PersonID = a1.BusinessEntityID
	FULL OUTER JOIN Person.ContactType a3 ON a3.ContactTypeID = a2.ContactTypeID
	FULL OUTER JOIN Person.BusinessEntityAddress a4 ON a4.BusinessEntityID = a2.BusinessEntityID
	FULL OUTER JOIN Person.Address a5 ON a5.AddressID = a4.AddressID
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

USE AdventureWorks2014
EXEC[dbo].[uspGetAddress] @AddressLine1 = 'Acardia'
