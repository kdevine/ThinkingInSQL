use adventureworks2014
go
SET STATISTICS IO,TIME ON
DECLARE @zipcode char(5) = '44224'
SELECT TOP 10 s.[Name]
  FROM [Sales].[Store] s inner join Person.BusinessEntityAddress bea ON s.BusinessEntityID = bea.BusinessEntityID inner join Person.Address a ON bea.AddressID = a.AddressID
  inner join Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID --inner join Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode
  where sp.CountryRegionCode = 'US'
  ORDER BY Sales.fnCalcDistanceMiles(@zipcode,left(a.PostalCode,5))

  
  