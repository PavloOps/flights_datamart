SELECT
    a1.Scheduled_departure,
    count(*)
FROM {{ ref('fct_flights') }} a1
WHERE a1.Scheduled_departure >= '{{ (run_started_at | string)[:10] }}'::date
GROUP BY a1.Scheduled_departure