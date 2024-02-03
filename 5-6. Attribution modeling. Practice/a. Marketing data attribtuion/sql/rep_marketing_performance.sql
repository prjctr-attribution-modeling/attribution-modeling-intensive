--============TASK============--
--1. UNION all marketing performance data
--2. Enrich with attributes extracted from campaign name

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
