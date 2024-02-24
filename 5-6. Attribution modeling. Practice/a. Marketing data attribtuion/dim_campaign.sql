--============ЗАВДАННЯ============--
--1. Зібрати усі рекламні кампанії
--2. Розпарсити назви кампаній та отримати атрибути використовуючи map_marketing_attribution

-- dim_campaign DDL
CREATE OR REPLACE TABLE dim_campaign (
    campaign_id varchar(128),
    campaign_name varchar(2048),
    account_id varchar(128),
    source_medium varchar(128),
    channel varchar(128),
    target_audience varchar(128),
    target_geo varchar(128),
    target_device varchar(128),
    target_course varchar(128)
)
