{{
  config(
        materialized = 'view'
    )
}}

SELECT
    a1.ticket_no as Ticket_no
    ,a1.flight_id as Flight_id
    ,a1.fare_conditions as Fare_conditions
    ,a1.amount as Amount
    ,CASE
        WHEN a2.boarding_no IS NULL THEN false
        ELSE true
    END AS Boarding_pass_exists
    ,a2.boarding_no as Boarding_no
    ,a2.seat_no as Seat_no
    ,CURRENT_DATE as Load_date
FROM {{ ref('stg_flights__ticket_flights') }} a1
LEFT JOIN {{ ref('stg_flights__boarding_passes')}} a2
  ON a1.ticket_no = a2.ticket_no AND a1.flight_id = a2.flight_id
