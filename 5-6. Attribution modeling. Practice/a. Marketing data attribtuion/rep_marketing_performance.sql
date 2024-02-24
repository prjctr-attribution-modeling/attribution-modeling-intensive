--============ЗАВДАННЯ============--
--1. UNION статистику різних маркетингових каналів
--2. Збагатити атрибутами, що зберігаються в dim_campaign
--3. Для Google Ads кампаній:
--3.1. Використовуйте map_country, щоб отримати значення country_code
--3.2. Значення spend = cost_micros/1000000

-- rep_marketing_performance DDL
CREATE OR REPLACE TABLE rep_marketing_performance(
    date date,
    account_id varchar(128),
    account_name varchar(128),
    campaign_id varchar(128),
    campaign_name varchar(2048),
    country_code varchar(16),
    device_type varchar(128),
    channel varchar(128),
    source_medium varchar(128),
    target_audience varchar(128),
    target_geo varchar(128),
    target_device varchar(128),
    product varchar(128),
    impressions integer,
    clicks integer,
    spend numeric(38,2)
)
