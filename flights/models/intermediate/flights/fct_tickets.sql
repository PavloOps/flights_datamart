{{
  config(
        materialized = 'table'
    )
}}

SELECT
    {{ adapter.quote("ticket_no") }} as Ticket_no,
    {{ adapter.quote("book_ref") }} as Book_ref,
    {{ adapter.quote("passenger_id") }} as Passenger_id,
    {{ adapter.quote("passenger_name") }} as Passenger_name,
    {{ adapter.quote("contact_data") }} as Contact_data
FROM {{ ref('stg_flights__tickets') }} a1
WHERE a1.passenger_id NOT IN (
    SELECT
        DISTINCT id as passenger_id
    FROM {{ ref('employee') }}
    )