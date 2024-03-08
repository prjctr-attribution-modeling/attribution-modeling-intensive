CREATE TABLE ref AS
SELECT foo. *
FROM (
SELECT
    fl.owner_id AS user_id,
    fl.wallet_id,
    u.email AS email,
    u.is_active AS is_active,
    u.country_code,
    SUM(fl.affiliate_balance_diff) AS aff_bal_gnt
FROM finale_log fl
LEFT JOIN users u
      ON fl.owner_id = u.id
WHERE fl.operation_type = 'ref'
    AND fl.created > '2021-01-01'
    GROUP BY 1,2,3,4
) foo
WHERE aff_bal_gnt > 30;

CREATE TABLE total_sales AS
SELECT
    buyer_id,
    COUNT(DISTINCT id) AS sales_number
FROM dim_sales
GROUP BY 1;

CREATE TABLE payments AS
SELECT
    buyer_id
    SUM(gmv_proceeds) AS gmv_amount
    COUNT(DISTINCT CASE WHEN gmv_proceeds > 0 THEN id END) AS payments_w_gmv
FROM fact_payments
GROUP BY 1;

CREATE TABLE ref_reward_last_30d AS (
SELECT
    r.user_id AS referrer_id
    r.email AS referrer_email
    r.is_active AS referrer_active
    r.country_code AS referrer_country_code
    r.aff_bal_gnt AS referrer_aff_bal_gnt
    ts.sales_number AS referrer_sales_number
    p.payments_w_gmv AS referrer_payments_w_gmv
    p.gmv_amount AS referrer_gmv_amount
FROM ref r
LEFT JOIN payments p
      ON r.user_id = tp.buyer_id
LEFT JOIN total_sales ts
      ON tr.user_id = tl.buyer_id;