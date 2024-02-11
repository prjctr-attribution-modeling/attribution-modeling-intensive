WITH first_payment AS (
SELECT
    id
    ,payment_ts
    ,user_id
    ,course_id
    ,course_name
    ,row_number() over(partition by user_id order by time asc) as rn
FROM fact_payment
),
sum_gmv AS (
SELECT
    ,user_id
    ,sum(gmv) AS gmv
FROM fact_payment
)
SELECT
    du.id AS user_id
    ,du.join_ts
    ,CASE WHEN fp.rn = 1 THEN fp.payment_ts END AS first_payment_ts
    ,du.device_type
    ,du.country_code
    ,du.region
    ,du.city
    ,du.landing_page
    ,du.referer
    ,du.source_medium
    ,COALESCE(dc.channel, src.channel, 'DIRECT')
    ,dc.target_audience
    ,dc.target_geo
    ,dc.target_device
    ,dc.target_course
    ,CASE WHEN fp.rn = 1 THEN fp.course_name END AS first_course_name
    ,CASE WHEN fp.rn = 1 THEN fp.course_name END AS latest_course_name
    ,sg.gmv
FROM dim_user du
LEFT JOIN first_payment fp
    ON du.id = fp.user_id
LEFT JOIN sum_gmv sg
    ON du.id = sg.user_id
LEFT JOIN dim_campaign dc
    ON du.source_medium = dc.source_medium AND du.campaign_id = dc.campaign_id
LEFT JOIN map_source_medium src
    ON du.source_medium = src.source_medium