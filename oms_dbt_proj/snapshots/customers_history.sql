{% snapshot customers_history %}

{{
    config(
        target_schema='L3_CONSUMPTION', 
        unique_key='customerid', 
        strategy='timestamp', 
        updated_at='updated_at'
    )
}}

SELECT * FROM {{ source('landing', 'cust') }}

{% endsnapshot %}