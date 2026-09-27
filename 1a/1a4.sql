SELECT c.region, COALESCE(SUM(o.sales), 0) AS total_sales FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.region;