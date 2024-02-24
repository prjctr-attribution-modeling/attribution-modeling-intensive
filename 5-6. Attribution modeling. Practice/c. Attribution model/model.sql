--============TASK============--
-- Finalize model adding a few more metrics

-- fact_payment DDL
CREATE OR REPLACE TABLE model (
    -- GENERAL DIMENSIONS
    date
    ,country_code
    ,device_type
    ,course
    -- MARKETING DIMENSIONS
    ,channel
    ,source_medium
    ,account_id
    ,account_name
    ,campaign_id
    ,campaign_name
    ,target_audience
    ,target_geo
    ,target_device
    ,target_course
    -- ACQUISITION METRICS
    -- sum impressions
    ,impressions
    -- sum clicks
    ,clicks
    -- sum spend
    ,cost
    -- calculate cost per click
    ,cpc
    -- sum acquired NPCs
    ,npcs
    -- calculate cost for acquired NPCs
    ,cac
    -- sum conversions from marketing channel. Conversion window - 7 days
    ,conversions
    -- calculate cost per conversion (action)
    ,cpa
    -- FINANCIAL METRICS
    -- sum paid_amount. Conversion window - 7 days
    ,gmv
    -- sum net_revenue. Conversion window - 7 days
    ,net_revenue
    -- subtract marketing costs from net_revenue. Conversion window - 7 days
    ,gross margin
)
