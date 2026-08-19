{{
    config(
        materialized = 'table',
        tags = ['bookings']
    )
}}

select
  {{ bookref_to_bigint('book_ref') }} as book_ref,
  {{ kopek_to_ruble('total_amount', 3) }} as total_amount,
  {{ adapter.quote("book_date") }},
  {{ adapter.quote("total_amount") }}

from {{ source('demo_src', 'bookings') }}
{{ limit_data_dev('book_date', 10000) }}