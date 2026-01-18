CREATE OR REPLACE TABLE Online_Retail.Top_Product_Pairs AS
SELECT
  product_a,
  product_a_desc,
  product_b,
  product_b_desc,
  pair_orders,
  support_ab,
  support_a,
  support_b,
  confidence_a_to_b,
  confidence_b_to_a,
  lift
FROM Online_Retail.Product_Pair_Metrics
WHERE pair_orders >= 50 
  AND support_ab >= 0.003 
ORDER BY lift DESC
LIMIT 200;
