# Market-Basket-Analysis

**Links:** Tableau Public Dashboard https://public.tableau.com/views/MarketBasketAnalysis_17687171081140/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

**Dataset:** UCI Online Retail https://archive.ics.uci.edu/dataset/352/online+retail

**Goal:** Identify which products are frequently purchased together and how can we use these patterns to create product bundles.

**Data & methods:**

Cleaned ~500k transactions: removed cancellations/returns, cast fields, engineered LineTotal, basket_size, basket_revenue in BigQuery.

Computed Support, Confidence, and Lift for product pairs and filtered to pairs with ≥50 joint orders and ≥0.3% support.

Built Tableau Public dashboards for basket size distribution and top product pairs.

Average Basket Size: 26.17

Average Order Value: 519.78

Total invoices 19776 (filtered)
​

**Key Insights:**

Paper cups & plates-
Customers who buy SET/6 COLLAGE PAPER CUPS almost always buy SET/6 COLLAGE PAPER PLATES as well: about 89% of cup purchases also include the matching plates (confidence A→B = 0.89), and this combination appears in roughly 0.8% of all orders. This pair is purchased together over 80× more often than would be expected by chance (lift ≈ 81).

Bike clips & repair kit-
Customers who buy CLASSIC BICYCLE CLIPS have about an 81% chance of also buying a BICYCLE PUNCTURE REPAIR KIT (confidence A→B = 0.81). This pair shows up in about 0.4% of all orders and occurs together about 138× more often than if purchases were independent (lift ≈ 138), indicating a very strong cross‑sell relationship between safety/accessory and maintenance items.

Party bags-
Customers who buy PINK PARTY BAGS also purchase BLUE PARTY BAGS in over 52% of cases (confidence A→B = 0.52). While this pair appears in around 0.4% of all orders, it is bought together more than 80× more often than chance would suggest (lift ≈ 87), showing a strong tendency for shoppers to mix color variants of the same product for events.

Across multiple categories (party bags, decor, etc.), blue and pink variants of the same product are frequently bought together, suggesting customers often purchase complementary color combinations rather than choosing a single color.

**Recommendations:**

Create small bundles for matching items (e.g., ‘cups + plates’ sets) and surface them as default options on product pages, leveraging the 89% co‑purchase rate between collage paper cups and plates.​

For bike accessories, promote ‘safety + repair’ bundles by recommending the BICYCLE PUNCTURE REPAIR KIT directly on the CLASSIC BICYCLE CLIPS product page to capitalize on their 81% co‑purchase rate.​

Introduce color-themed bundles or multi-pack offers for items with strong cross‑color relationships (such as pink and blue party bags), since customers frequently buy both colors together.​

Use these high‑lift pairs as ‘Frequently Bought Together’ modules in the checkout and email flows, prioritizing rules with high confidence and at least 50 joint orders to focus on reliable patterns.

