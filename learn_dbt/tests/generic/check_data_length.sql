{% test hygienecheck(model,column_name) %}
    {{ config(store_failures = true) }}

    select *,CASE
    WHEN LENGTH({{ column_name }}) > {{ var('length_variable') }} then 'length hygiene'
    WHEN {{ column_name }} is null
    then 'null hygiene'
    END as description
    from {{ model }}

{% endtest %}