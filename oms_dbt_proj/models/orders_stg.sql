{{
    config( materialized='incremental' )

}}

SELECT 
    ORDERID, 
    ORDERDATE, 
    CUSTOMERID, 
    EMPLOYEEID, 
    STOREID, 
    STATUS AS STATUSCD, 
    CASE 
        WHEN STATUS = '01' THEN 'In Progress' 
        WHEN STATUS = '02' THEN 'Completed' 
        WHEN STATUS = '03' THEN 'Cancelled' 
        ELSE NULL 
    END AS STATUSDESC, 
    UPDATED_AT 
FROM 
    {{ source('landing', 'ordr') }} 

{% if is_incremental() %} 
where updated_at >= (select max(dbt_updated_at) from {{ this }})
{% endif %}