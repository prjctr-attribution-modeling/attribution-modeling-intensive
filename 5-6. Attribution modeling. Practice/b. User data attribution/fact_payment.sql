--============TASK============--
--1. Розрахувати на основі payment
--1.1. curator_fee (комісія викладача), використовуючи curator_fee_pct з courses
--1.2. net_revenue = paid_amount - curator_fee

-- fact_payment DDL
CREATE OR REPLACE TABLE fact_payment (
    id varchar(64)
    ,txn_id varchar(64)
    ,payment_ts timestamp without time zone
    ,user_id varchar(32)
    ,course_id varchar(32)
    ,paid_amount numeric(38,2)
    ,curator_fee numeric(38,2)
    ,net_revenue numeric(38,2)
)
