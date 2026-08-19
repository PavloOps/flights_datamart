{%- set current_date = (run_started_at | string)[:10] -%}
{%- set years_delta = 10 %}


SELECT
    a1.Scheduled_departure,
    count(*)
FROM {{ ref('fct_flights') }} a1
WHERE a1.Scheduled_departure BETWEEN
    '{{ current_date }}'::DATE - INTERVAL '{{ years_delta }} years'
AND '{{ current_date }}'::DATE
GROUP BY a1.Scheduled_departure


{%- set source_relation = adapter.get_relation(
    database="dwh_flights",
    schema="intermediate",
    identifier="fct_flights"
) %}

{{ source_relation.database }}
{{ source_relation.schema }}
{{ source_relation.identifier }}
{{ source_relation.is_table }}
{{ source_relation.is_view }}
{{ source_relation.is_cte }}

{% set source_relation = load_relation(ref("fct_flights")) %}

{% set source_relation = api.Relation.create(
    database="dwh_flights",
    schema="intermediate",
    identifier="fct_flights",
    type="table"
) %}

{% set columns = adapter.get_columns_in_relation(source_relation) %}

{% for column in columns -%}
    {{ 'Columns: ' ~ column}}
{% endfor %}

