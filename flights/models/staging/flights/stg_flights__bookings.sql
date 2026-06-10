{{
    config(
        materialized = 'table'
    )
}}

select
  {{ adapter.quote("book_ref") }},
  {{ adapter.quote("book_date") }},
  {{ adapter.quote("total_amount") }}

from {{ source('demo_src', 'bookings') }}