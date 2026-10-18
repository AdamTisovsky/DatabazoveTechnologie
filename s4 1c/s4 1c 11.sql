WITH ranked_products AS (
    SELECT
        invoice_no,
        stock_code,
        description,
        quantity,
        unit_price,
        DENSE_RANK() OVER (
            PARTITION BY invoice_no
            ORDER BY unit_price DESC
        ) AS price_rank
    FROM retail_sales
)
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    unit_price,
    price_rank
FROM ranked_products
WHERE price_rank BETWEEN 1 AND 5
ORDER BY invoice_no, price_rank, stock_code;
