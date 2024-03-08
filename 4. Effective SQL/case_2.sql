CREATE TABLE speed_tests_result AS
SELECT
    tutor_id,
    event_properties['download_mbs']::FLOAT AS actual_connection,
    CASE WHEN actual_connection <= 0.57 THEN 'Bad' ELSE 'Good' END AS connection_new_bucket
FROM tracking t
WHERE
    date >= current_date - 90
    AND event_type = 50
    AND tutor_id IS NOT NULL;

CREATE TABLE internet_connection AS
SELECT foo.*
FROM (
    SELECT
        tutor_id,
        COUNT(*) as n_connections,
        AVG((CASE WHEN connection_new_bucket = 'Bad' THEN 0 ELSE 1 END)::FLOAT) AS avg_conn_quality_90d
    FROM speed_tests_result
    GROUP BY 1
) foo
WHERE foo.n_connections >= 10