--============TASK============--
--Фіналізуємо нашу модель атрибуції
--ВАЖЛИВО. Конверсією вважаємо здійснення платежу в межах перших 28 днів

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
    -- SUM(impressions)
    ,impressions
    -- SUM(clicks)
    ,clicks
    -- SUM(spend)
    ,cost
    -- розраховуємо ціну одного кліку (cost per click)
    ,cpc
    -- кількість нових користувачів з хоча б одним платежем отриманих від маркетингової кампанії
    ,npcs
    -- розраховуємо ціну залучення користувачів, що роблять покупки (customer acquisition cost), cost/npcs
    ,cac
    -- сумуємо кількість конверсій від маркетингової кампанії
    ,conversions
    -- рахуємо ціну конверсії (cost per action), cost/conversions
    ,cpa
    -- FINANCIAL METRICS
    -- SUM(paid_amount). Рахуємо тільки в межах вікна конверсії
    ,gmv
    -- SUM(net_revenue). В межах вікна конверсії
    ,net_revenue
    -- мінусуємо витрати на маркетинг (залучення) від чистого прибутку (net_revenue). Прибуток в межах вікна конверсії
    ,gross margin
)
