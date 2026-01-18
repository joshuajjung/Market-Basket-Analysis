CREATE OR REPLACE TABLE Online_Retail.Invoice_Basket AS
SELECT
  InvoiceNo,
  CustomerID,
  Country,
  COUNT(DISTINCT StockCode) AS basket_size,
  SUM(Quantity) AS total_items,
  SUM(LineTotal) AS basket_revenue
FROM Online_Retail.Cleaned_Online_Retail
GROUP BY InvoiceNo, CustomerID, Country;

