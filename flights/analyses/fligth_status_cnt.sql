{%- set status_query %}
SELECT DISTINCT
    a1.status as status
FROM {{ ref('stg_flights__flights') }} a1
{% endset %}

{%- set query_result = run_query(status_query) %}
{%- if execute %}
  {%- set statuses = query_result.columns[0].values() %}
{%- else %}
  {%- set statuses = [] %}
{%- endif %}

SELECT
    {%- for status_name in statuses %}
    {%- if not loop.first %}, {% endif %}
    SUM(
        CASE
            WHEN a1.status = '{{ status_name }}'
            THEN 1
            ELSE 0
        END
    ) as status_{{ status_name | lower | replace(' ', '_') }}
    {%- endfor %}
FROM {{ ref('stg_flights__flights') }} a1