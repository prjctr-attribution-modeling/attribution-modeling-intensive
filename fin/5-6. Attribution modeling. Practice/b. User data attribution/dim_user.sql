WITH user_utm AS (
SELECT
    u.id
    ,u.join_ts
    ,u.device_type
    ,u.country_code
    ,u.region
    ,u.city
    ,u.landing_page
    ,u.referer
    ,SUBSTRING(u.landing_page, '(?:[a-zA-Z]+:\/\/)?([a-zA-Z0-9.]+)\/?') AS host
    ,SUBSTRING(u.landing_page, '(?:[a-zA-Z]+://)?(?:[a-zA-Z0-9.]+)/{1}([a-zA-Z0-9./]+)') AS path
    ,SUBSTRING(u.landing_page, '\?(.*)') AS query
    ,SUBSTRING(u.landing_page, '.*[&?]utm_source=([^&]+).*') AS utm_source
    ,SUBSTRING(u.landing_page, '.*[&?]utm_medium=([^&]+).*') AS utm_medium
    ,SUBSTRING(u.landing_page, '.*[&?]campaignid=([^&]+).*') AS campaign_id
    ,SUBSTRING(u.landing_page, '.*[&?]utm_campaign=([^&]+).*') AS campaign_name
FROM user u
)
SELECT
    uu.*
    ,CASE
        WHEN host ilike '%curator.com%' AND path <= 1 AND query is NULL THEN '(direct) / (none)'
        ELSE COALESCE(src_utm.source_medium,src_page.source_medium,src_ref.source_medium)
    END AS source_medium
    ,first_payment_ts
FROM user_utm uu
LEFT JOIN map_source_medium src_utm
    ON uu.utm_source = src_utm.utm_source AND uu.utm_medium = src_utm.utm_medium
LEFT JOIN map_source_medium src_page
    ON uu.query ILIKE '%%' || src_page.keyword_landing_page || '%%'
LEFT JOIN map_source_medium src_ref
    ON uu.referer ILIKE '%%' || src_ref.keyword_referer || '%%'
