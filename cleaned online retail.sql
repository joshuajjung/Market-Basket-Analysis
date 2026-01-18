CREATE OR REPLACE TABLE Online_Retail.Cleaned_Online_Retail AS
SELECT
  InvoiceNo,
  StockCode,
  Description,
  SAFE_CAST(Quantity AS INT64) AS Quantity,
  SAFE_CAST(UnitPrice AS FLOAT64) AS UnitPrice,
  SAFE_CAST(
    PARSE_DATETIME('%m/%d/%y %H:%M', InvoiceDate)
    AS TIMESTAMP
  ) AS InvoiceTimestamp,
  SAFE_CAST(CustomerID AS INT64) AS CustomerID,
  Country,
  SAFE_CAST(Quantity AS INT64) * SAFE_CAST(UnitPrice AS FLOAT64) AS LineTotal
FROM
  Online_Retail.Online_Retail_Table
WHERE
  SAFE_CAST(Quantity AS INT64) > 0
  AND SAFE_CAST(UnitPrice AS FLOAT64) > 0
  AND UPPER(SUBSTR(InvoiceNo, 1, 1)) != 'C'
  AND StockCode NOT IN (
  'POST', 'D', 'M', 'BANK CHARGES',
  'DOT', 'AMAZONFEE', 'CRUK', 'B', 'S', 'PADS'
)