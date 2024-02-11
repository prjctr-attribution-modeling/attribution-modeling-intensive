SELECT
    p.id
    ,p.txn_id
    ,p.time as payment_ts
    ,p.user_id
    ,p.course_id
    ,c.name AS course_name
    ,p.paid_amount
    ,p.paid_amount * c.curator_fee_pct/100 AS curator_fee
    ,p.paid_amount - curator_fee AS gmv
FROM payment p
LEFT JOIN courses c
    ON p.product_id = c.id