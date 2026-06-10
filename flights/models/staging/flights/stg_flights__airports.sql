{{
    config(
        materialized = 'table'
    )
}}

select
  {{ adapter.quote("airport_code") }},
  {{ adapter.quote("airport_name") }},
  {{ adapter.quote("city") }},
  {{ adapter.quote("coordinates") }},
  {{ adapter.quote("timezone") }}

from {{ source('demo_src', 'airports') }}