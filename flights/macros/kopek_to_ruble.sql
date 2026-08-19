{% macro kopek_to_ruble(column_name, scale=2) %}
    {{ adapter.quote(column_name) }} /100::numeric(16, {{ scale }})
{% endmacro %}