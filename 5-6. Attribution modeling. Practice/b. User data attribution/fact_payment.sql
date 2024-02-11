--============TASK============--
--1. Calculate amount of curator fee and company gmv using payment.csv and curator_fee_pct from courses.csv

-- fact_payment DDL
CREATE OR REPLACE TABLE fact_payment (
    id varchar(64)
    ,txn_id varchar(64)
    ,payment_ts timestamp without time zone
    ,user_id varchar(32)
    ,course_id varchar(32)
    ,paid_amount numeric(38,2)
    ,curator_fee numeric(38,2)
    ,gmv numeric(38,2)
)
