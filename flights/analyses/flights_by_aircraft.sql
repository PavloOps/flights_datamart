{%- set aircraft_query %}
SELECT DISTINCT
    Aircraft_id
FROM {{ ref('fct_flights') }}
{% endset %}

{%- set aircraft_query_result = run_query(aircraft_query) %}
  {%- if execute %}
    {%- set important_aircrafts = aircraft_query_result.columns[0].values() %}
  {%- else %}
    {%- set important_aircrafts = [] %}
  {%- endif %}

SELECT
    {%- for aircraft in important_aircrafts %}
    {%- if not loop.first %}, {% endif %}
    SUM(
        CASE
            WHEN Aircraft_id = '{{ aircraft }}'
            THEN 1
            ELSE 0
        END
    ) as flights_{{ aircraft }}
      
    {%- endfor %}
FROM {{ ref('fct_flights') }}