CREATE OR REPLACE TABLE Online_Retail.Product_Pair_Metrics AS
SELECT
  pp.product_a,
  pp.product_a_desc,
  pp.product_b,
  pp.product_b_desc,
  pp.pair_orders,
  ps_a.product_orders AS orders_a,
  ps_b.product_orders AS orders_b,
  ps_a.total_invoices,
  pp.pair_orders / ps_a.total_invoices AS support_ab,
  ps_a.support AS support_a,
  ps_b.support AS support_b,
  pp.pair_orders / ps_a.product_orders AS confidence_a_to_b,
  pp.pair_orders / ps_b.product_orders AS confidence_b_to_a,
  (pp.pair_orders / ps_a.total_invoices) / (ps_a.support * ps_b.support) AS lift
FROM Online_Retail.Product_Pairs pp
JOIN Online_Retail.Product_Support ps_a
  ON pp.product_a = ps_a.StockCode
JOIN Online_Retail.Product_Support ps_b
  ON pp.product_b = ps_b.StockCode;
