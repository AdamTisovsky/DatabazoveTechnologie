WITH monthly_sales AS (
    SELECT
        country,
        DATE_TRUNC('month', invoice_date)::DATE AS month,
        customer_id,
        SUM(quantity * unit_price) AS total_amount
    FROM retail_sales
    WHERE customer_id IS NOT NULL
    GROUP BY country, month, customer_id
),
ranked_sales AS (
    SELECT
        country,
        month,
        customer_id,
        total_amount,
        DENSE_RANK() OVER (
            PARTITION BY country, month
            ORDER BY total_amount DESC
        ) AS sales_rank
    FROM monthly_sales
)
SELECT *
FROM ranked_sales
WHERE sales_rank BETWEEN 1 AND 5
ORDER BY country, month, sales_rank, customer_id;