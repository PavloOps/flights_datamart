{% macro limit_data_dev(date_column_name, days=7) %}
{% if target.name == "dev" %}
WHERE {{ date_column_name }} >= current_date - interval '{{ days }} days'
{% else %}
{% endif %}
{% endmacro %}