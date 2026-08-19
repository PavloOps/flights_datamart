{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'append',
        tags = ['bookings']
    )
}}

select
  {{ adapter.quote("book_ref") }},
  {{ adapter.quote("book_date") }},
  {{- kopek_to_ruble('total_amount', 3) }} as total_amount

from {{ source('demo_src', 'bookings') }}

{% if is_incremental() %}
  where ('0x' || book_ref)::bigint > (select max(('0x' || book_ref)::bigint) from {{ this }})

{% endif %}