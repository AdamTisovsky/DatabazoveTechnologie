SELECT
    o.order_id,
    c.customer_name,
    p.category,
    o.sales
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;