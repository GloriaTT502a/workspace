-- Define the expected record counts for each table 
{% set expected_counts = {
    'cust': 1, 
    'ordritms': 1, 
    'ordr': 1
} %}

-- Test the count of records in each table 
{% for table, expected_count in expected_counts.items() %} 
    SELECT '{{ table }}' AS table_name, 
            (SELECT COUNT(1) FROM {{ source('landing', table) }}) AS record_count, 
            {{ expected_count }} AS expected_count 
    WHERE (SELECT COUNT(1) FROM {{ source('landing', table) }}) < {{ expected_count }} 
    {% if not loop.last %} UNION ALL {% endif %} 
{% endfor %}