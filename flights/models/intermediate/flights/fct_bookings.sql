{{
  config(
        materialized = 'table',
        meta = {
            'owner': 'sql_file_owner@gmail.com',
            'description': 'This table contains the fact bookings data for flights.'
        }
    )
}}

SELECT
    {{ adapter.quote('book_ref') }},
    {{ adapter.quote('book_date') }},
    {{ adapter.quote('total_amount') }}
FROM {{ ref('stg_flights__bookings') }}