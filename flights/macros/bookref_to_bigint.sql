{% macro bookref_to_bigint(column_name) %}
    (('0x' || {{ adapter.quote(column_name) }})::bigint)
  {% endmacro %}