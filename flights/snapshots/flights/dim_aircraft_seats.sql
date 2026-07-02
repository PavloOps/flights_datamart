{% snapshot dim_aircraft_seats %}

{{
   config(
       target_schema='snapshot',
       unique_key=['aircraft_code', 'seat_no'],
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
    ,a1.seat_no
    ,a1.fare_conditions
FROM {{ ref('stg_flights__seats') }} a1

{% endsnapshot %}