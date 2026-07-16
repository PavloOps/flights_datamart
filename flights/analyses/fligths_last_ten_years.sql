{% set current_date = (run_started_at | string)[:10] %}
{% set years_delta = 10 %}


SELECT
    a1.Scheduled_departure,
    count(*)
FROM {{ ref('fct_flights') }} a1
WHERE a1.Scheduled_departure BETWEEN
    '{{ current_date }}'::DATE - INTERVAL '{{ years_delta }} years'
AND '{{ current_date }}'::DATE
GROUP BY a1.Scheduled_departure