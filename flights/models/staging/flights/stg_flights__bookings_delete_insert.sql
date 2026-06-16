{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'delete+insert',
        unique_key = ['book_ref'],
        tags = ['bookings']
    )
}}

select
  {{ adapter.quote("book_ref") }},
  {{ adapter.quote("book_date") }},
  {{ adapter.quote("total_amount") }}

from {{ source('demo_src', 'bookings') }}

{% if is_incremental() %}
  where book_date > (select max(book_date) from {{ this }}) - interval '97 days'

{% endif %}