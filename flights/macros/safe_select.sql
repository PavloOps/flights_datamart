{% macro safe_select(table_name) %}
{% set source_relation = adapter.get_relation(
        database=target.dbname ,
        schema=target.schema,
        identifier=table_name) %}

{% if source_relation is not none %}
    SELECT * FROM {{ source_relation }}
{% else %}
    SELECT NULL
{% endif %}
{% endmacro %}