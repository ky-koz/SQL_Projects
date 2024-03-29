USE [AdventureWorks2014]
GO

-- create proc with two parameters
CREATE PROCEDURE [dbo].[uspGetAddress] @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT * 
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

-- create proc with catch
CREATE PROCEDURE dbo.uspTryCatchTest
AS
BEGIN TRY
	SELECT 1/0
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber
	,ERROR_SEVERITY() AS ErrorSeverity
	,ERROR_STATE() AS ErrorState
	,ERROR_PROCEDURE() AS ErrorProcedure
	,ERROR_LINE() AS ErrorLine
	,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

-- this procedure is coming up with an object error when called for 'AdventureWorks.Person.Address
CREATE PROCEDURE dbo.uspGetAddressCount @City nvarchar(30), @AddressCount int OUTPUT
AS
SELECT @addressCount = count(*)
FROM AdventureWorks.Person.Address
WHERE City = @City

-- not using SET NOCOUNT ON
ALTER PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS 
SET NOCOUNT ON
SELECT *
FROM Person.Address
WHERE City = @City
PRINT @@ROWCOUNT
GO
-- execute proc
EXEC dbo.uspGetAddress 'Calgary';

-- execute proc
USE AdventureWorks2014

EXEC[dbo].[uspGetAddress] @AddressLine1 = 'Acardia'

DECLARE @AddressCount int
EXEC[dbo].[uspGetAddressCount] @City = 'Calgary', @AddressCount = @AddressCount OUTPUT
SELECT @AddressCount