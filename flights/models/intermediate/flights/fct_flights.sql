{{
  config(
      materialized = 'table'
    )
}}
SELECT
    {{ adapter.quote('flight_id') }} AS Flight_id,
    {{ adapter.quote('flight_no') }} AS Flight_no,
    {{ adapter.quote('scheduled_departure') }} AS Scheduled_departure,
    {{ adapter.quote('scheduled_arrival') }} AS Scheduled_arrival,
    {{ adapter.quote('departure_airport') }} AS Departure_airport_id,
    {{ adapter.quote('arrival_airport') }} AS Arrival_airport_id,
    {{ adapter.quote('status') }} AS Status,
    {{ adapter.quote('aircraft_code') }} AS Aircraft_id,
    {{ adapter.quote('actual_departure') }} AS Actual_departure,
    {{ adapter.quote('actual_arrival') }} AS Actual_arrival,
    CURRENT_DATE AS Load_date
FROM {{ ref('stg_flights__flights') }}
