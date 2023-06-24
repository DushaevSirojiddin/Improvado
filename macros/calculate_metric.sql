{% macro calculate_metric(sources, metric1, metric2=None, alias=None) %}
    with
        metric as (
            {% for source in sources %}
            select channel, {{ metric1 }} {% if metric2 %}, {{ metric2 }}{% endif %}
            from {{ ref(source) }}
            {% if not loop.last %} union all {% endif %}
            {% endfor %}
        ),
        aggregated as (
            select channel, sum({{ metric1 }}) as total_{{ metric1 }} {% if metric2 %}, sum({{ metric2 }}) as total_{{ metric2 }}{% endif %}
            from metric
            group by channel
        )

    select channel, 
    {% if metric2 %}
    round(total_{{ metric1 }} / total_{{ metric2 }}, 2) as {{ alias }}
    {% else %}
    total_{{ metric1 }} as {{ metric1 }}
    {% endif %}
    from aggregated
{% endmacro %}
