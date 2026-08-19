{{
    config(
        materialized = 'table',
        post_hook = '
            {% set backup_relation = api.Relation.create(
                    database = this.database,
                    schema = this.schema,
                    identifier = this.identifier ~ "_dbt_backup_new",
                    type = "table"
                ) 
            %}
            {% do adapter.drop_relation(backup_relation) %}
            {% do adapter.rename_relation(this, backup_relation) %}
        '
    )
}}
SELECT
    airport_code as {{ adapter.quote('airport_code') }},
    airport_name as {{ adapter.quote('airport_name') }},
    city as {{ adapter.quote('city') }},
    coordinates as {{ adapter.quote('coordinates') }},
    timezone as {{ adapter.quote('timezone') }}
FROM
    {{ source('demo_src', 'airports') }}