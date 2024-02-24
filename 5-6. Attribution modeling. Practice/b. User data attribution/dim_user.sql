--============Завдання============--
--1. Розібрати значення landing page та отримати Host, Path, Query, utm_source, utm_medium, campaign_id and campaign_name
--2. Використовуючи map_source_medium отримати відповідне значення source_medium

-- Корисні посилання
-- 1. https://github.com/count/sql-snippets/blob/main/postgres/regex-parse-url.md
-- 2. https://regex101.com/

-- dim_user DDL
CREATE TABLE dim_user(
    id varchar(64)
    ,join_ts timestamp without time zone
    ,device_type varchar(64)
    ,country_code varchar(2)
    ,region varchar(256)
    ,city varchar(256)
    ,landing_page varchar(2048)
    ,referer varchar(2048)
    ,host varchar(128)
    ,path varchar(1024)
    ,query varchar(2048)
    ,utm_source varchar(128)
    ,utm_medium varchar(128)
    ,campaign_id varchar(64)
    ,campaign_name varchar(1024)
    ,source_medium varchar (512)
)
