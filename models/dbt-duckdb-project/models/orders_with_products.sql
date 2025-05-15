
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.quantity,
    o.unit_price AS order_unit_price,
    p.product_name,
    p.category,
    p.unit_price AS product_unit_price,
    (o.quantity * o.unit_price) AS total_order_price
FROM
    raw_orders o
JOIN
    raw_products p
ON
    o.product_id = p.product_id
