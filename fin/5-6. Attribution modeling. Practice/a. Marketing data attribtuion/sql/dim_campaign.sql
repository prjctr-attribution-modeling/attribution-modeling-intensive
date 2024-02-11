CREATE TEMP TABLE campaign AS
SELECT
    campaign_id AS id
    ,campaign_name AS name
    ,account_id
    ,'google / cpc' AS source_medium
    ,SPLIT_PART(campaign_name, '_', 1) AS target_audience
    ,SPLIT_PART(campaign_name, '_', 2) AS channel
    ,SPLIT_PART(campaign_name, '_', 4) AS target_geo
    ,SPLIT_PART(campaign_name, '_', 5) AS target_device
    ,SPLIT_PART(campaign_name, '_', 6) AS course
FROM
    marketing_google
GROUP BY
    1,2,3,4,5,6,7,8,9
UNION
SELECT
    campaign_id AS id
    ,campaign_name AS name
    ,account_id
    ,'facebook / cpc' AS source_medium
    ,SPLIT_PART(campaign_name, '_', 1) AS target_audience
    ,SPLIT_PART(campaign_name, '_', 2) AS channel
    ,SPLIT_PART(campaign_name, '_', 4) AS target_geo
    ,SPLIT_PART(campaign_name, '_', 5) AS target_device
    ,SPLIT_PART(campaign_name, '_', 6) AS course
FROM
    marketing_facebook
GROUP BY
    1,2,3,4,5,6,7,8,9
;

INSERT INTO dim_campaign
SELECT
	campaign.id
	,campaign.name
	,campaign.account_id
	,mma_ch.name AS channel
	,campaign.source_medium
	,mma_ta.name AS target_audience
	,mma_tg.name AS target_geo
	,mma_td.name AS target_device
	,mma_p.name AS target_course
FROM
    campaign
LEFT JOIN
    map_marketing_attribution mma_ch
    ON mma_ch.code = LOWER(campaign.channel)
    AND mma_ch.dim = 'Channel'
LEFT JOIN
    map_marketing_attribution mma_ta
    ON mma_ta.code = LOWER(campaign.channel)
    AND mma_ta.dim = 'Target Audience'
LEFT JOIN
    map_marketing_attribution mma_tg
    ON mma_tg.code = LOWER(campaign.channel)
    AND mma_tg.dim = 'Target Geo'
LEFT JOIN
    map_marketing_attribution mma_td
    ON mma_td.code = LOWER(campaign.channel)
    AND mma_td.dim = 'Target Device'
LEFT JOIN
    map_marketing_attribution mma_tc
    ON mma_tc.code = LOWER(campaign.channel)
    AND mma_tc.dim = 'Target Course'
GROUP BY
    1,2,3,4,5,6,7,8,9