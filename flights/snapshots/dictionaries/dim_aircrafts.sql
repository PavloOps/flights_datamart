{% snapshot dim_aircrafts %}

{{
   config(
       target_schema='snapshot',
       unique_key='aircraft_code',

       strategy='check',
       check_cols='all',
       dbt_valid_to_current="'9999-01-01 00:00:00+00:00'::timestamp",
       snapshot_meta_column_names={
           'dbt_valid_from': 'dbt_effective_date_from',
           'dbt_valid_to': 'dbt_effective_date_to',
           'dbt_scd_id': 'dbt_scd_id',
           'dbt_updated_at': 'dbt_updated_at',
           'dbt_is_deleted': 'dbt_is_deleted'
       }
   )
}}

SELECT
    a1.aircraft_code
    ,a1.model
    ,a1.range
FROM {{ ref('stg_flights__aircrafts') }} a1

{% endsnapshot %}