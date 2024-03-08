CREATE TABLE bookable_tutor AS
SELECT
    run_dt,
    tutor_id,
    subject,
    price_per_hour,
    status
FROM tutors t
WHERE status <> 'BLOCKED';

CREATE TABLE impressions AS
SELECT
    tutor_id,
    ga_event_subject as subject,
    COUNT(DISTINCT uid) impressions,
    COUNT(DISTINCT CASE WHEN date >= current_date - 30 THEN uid END) impressions_30d
    COUNT(DISTINCT CASE WHEN date >= current_date - 90 THEN uid END) impressions_90d,
FROM tracking t
WHERE
    event_type = 21
    AND date >= '2019-01-01'
    AND date < current_date
    AND ga_event_search_type = 'online'
GROUP BY tutor_id, fe.ga_event_subject;


CREATE TABLE  profile_views
SELECT
    tutor_id,
    COUNT(DISTINCT uid) profile_views,
    COUNT(DISTINCT CASE WHEN date >= current_date - 30 then uid end) profile_views_30d
    COUNT(DISTINCT CASE WHEN date >= current_date - 90 then uid end) profile_views_90d,
FROM tracking t
WHERE
    event_type = 1
    AND date >= '2019-01-01'
    AND date < current_date
GROUP BY tutor_id;

CREATE TABLE tutor_performance AS
SELECT
    bt.run_dt,
    bt.tutor_id,
    bt.subject,
    bt.price_per_hour,
    bt.status,
    coalesce(i.impressions, 0),
    i.impressions_30d,
    i.impressions_90d,
    pv.profile_views,
    pv.profile_views_30d,
    pv.profile_views_90d
FROM bookable_tutor bt
LEFT JOIN impressions i
    ON bt.tutor_id = i.tutor_id AND bt.subject = i.subject
LEFT JOIN profile_views pv
    ON bt.tutor_id = pv.tutor_id;
