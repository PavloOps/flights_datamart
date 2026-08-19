{{
    config(
        materialized = 'table',
        pre_hook = '
              {% set existing_relation = adapter.get_relation(
                  database=this.database,
                  schema=this.schema,
                  identifier=this.identifier
              ) %}
              {% if existing_relation is not none %}
                  {% set current_datetime = run_started_at.strftime("%Y_%m_%d_%H%M%S") %}
                  {% set backup_relation = api.Relation.create(
                      database=this.database,
                      schema=this.schema,
                      identifier=this.identifier ~ "_" ~ current_datetime,
                      type="table"
                  ) %}
                  {% do adapter.rename_relation(existing_relation, backup_relation) %}
              {% endif %}
        '
    )
}}

SELECT
    aircraft_code
    ,model
    ,"range"
FROM {{ source('demo_src', 'aircrafts') }}