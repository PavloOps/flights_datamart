SELECT
    a1.aircraft_code
    ,count(*) as seats_count
FROM {{ ref('stg_flights__seats') }} a1
GROUP BY a1.aircraft_code
