SELECT
    ,mg.date
    ,mg.account_id
    ,mg.account_name
    ,mg.campaign_id
    ,mg.campaign_name
    ,mg.country_code
    ,mg.device_type
    ,dc.channel
    ,dc.source_medium
    ,dc.target_audience
    ,dc.target_geo
	,dc.target_device
	,dc.target_course
    ,SUM(mg.impressions) as impressions
    ,SUM(mg.clicks) as clicks
    ,SUM(mg.spend) as spend
FROM
    marketing_google mg
LEFT JOIN dim_campaign dc
    ON mg.account_id = dc.account_id
        AND mg.id = dc.id
GROUP BY
    1,2,3,4,5,6,7,8,9,10,11,12,13
UNION
SELECT
    ,mf.date
    ,mf.account_id
    ,mf.account_name
    ,mf.campaign_id
    ,mf.campaign_name
    ,mf.country_code
    ,mf.device_type
    ,dc.channel
    ,dc.source_medium
    ,dc.target_audience
    ,dc.target_geo
	,dc.target_device
	,dc.target_course
    ,SUM(mg.impressions) as impressions
    ,SUM(mg.clicks) as clicks
    ,SUM(mg.spend) as spend
FROM
    marketing_facebook mf
LEFT JOIN dim_campaign dc
    ON mf.account_id = dc.account_id
        AND mf.id = dc.id
GROUP BY
    1,2,3,4,5,6,7,8,9,10,11,12,13
