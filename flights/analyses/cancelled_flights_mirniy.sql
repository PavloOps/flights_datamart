SELECT
    a1.scheduled_departure::date as departure_date
    ,count(*) as cancelled_flights_count
FROM {{ ref('fct_flights') }} a1
WHERE a1.departure_airport_id = 'MJZ'
    AND a1.status = 'Cancelled'
GROUP BY a1.scheduled_departure::date
