{% macro amount_bucket(amount_col) %}
    case
        when {{ amount_col }} < 10 then 'lt_10'
        when {{ amount_col }} < 50 then '10_49'
        when {{ amount_col }} < 200 then '50_199'
        when {{ amount_col }} < 1000 then '200_999'
        else 'ge_1000'
    end
{% endmacro %}
