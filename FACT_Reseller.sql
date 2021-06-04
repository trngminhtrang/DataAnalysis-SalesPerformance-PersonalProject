-- Cleansed FACT_Reseller Table--
SELECT 
  rs.ProductKey, 
  rs.OrderDateKey, 
  rs.DueDateKey, 
  rs.ShipDateKey, 
  rs.ResellerKey, 
  --,[EmployeeKey]
  --,[PromotionKey]
  --,[CurrencyKey]
  --,[SalesTerritoryKey] 
  rs.SalesOrderNumber, 
  --,[SalesOrderLineNumber]
  --,[RevisionNumber]
  --,[OrderQuantity]
  --,[UnitPrice]
  --,[ExtendedAmount]
  --,[UnitPriceDiscountPct]
  --,[DiscountAmount]
  --,[ProductStandardCost]
  --,[TotalProductCost]
  
  rs.SalesAmount, 
  --,[TaxAmt]
  --,[Freight]
  --,[CarrierTrackingNumber]
  --,[CustomerPONumber]
  --,[OrderDate]
  --,[DueDate]
  --,[ShipDate] 
  ds.ResellerName AS [Reseller Name] --Joined in from Reseller Table
FROM 
  [AdventureWorksDW2019].[dbo].[FactResellerSales] AS rs 
  JOIN dbo.DimReseller AS ds ON rs.ResellerKey = ds.ResellerKey 
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -2 -- Only bring 2 years of date from extraction
ORDER BY 
  OrderDateKey ASC
