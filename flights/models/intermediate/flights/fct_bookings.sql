{{
  config(
        materialized = 'table',
    )
}}

SELECT
    {{ adapter.quote('book_ref') }},
    {{ adapter.quote('book_date') }},
    {{ adapter.quote('total_amount') }}
FROM {{ ref('stg_flights__bookings') }}