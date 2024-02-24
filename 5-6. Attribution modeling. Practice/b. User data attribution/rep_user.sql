--============TASK============--
--Збагачуємо дані про користувачів
--1. JOIN dim_campaign, щоб додати маркетингову атрибуцію
--2. JOIN fact_payment, щоб додати фінансові метрики

-- fact_payment DDL
CREATE OR REPLACE TABLE rep_user (
    user_id varchar(64)
    ,join_ts timestamp without time zone
    ,first_payment_ts timestamp without time zone
    ,last_payment_ts timestamp without time zone
    ,device_type varchar(64)
    ,country_code varchar(2)
    ,region varchar(256)
    ,city varchar(256)
    ,landing_page varchar(2048)
    ,referer varchar(2048)
    ,source_medium varchar(64)
    ,channel varchar(64)
    ,account_id varchar(64)
    ,account_name varchar(64)
    ,campaign_id varchar(64)
    ,campaign_name varchar(64)
    ,target_audience varchar(64)
    ,target_geo varchar(64)
    ,target_device varchar(64)
    ,target_course varchar(64)
    ,first_course_name varchar(64)
    ,last_course_name varchar(64)
    -- TRUE, якщо користувач зробив хоча б один платіж
    ,is_npc boolean
    -- SUM(paid_amount)
    ,gmv numeric(38,2)
    -- SUM(net_revenue)
    ,net_revenue numeric(38,2)
)
