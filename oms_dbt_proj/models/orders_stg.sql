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
    "L1_LANDING".ORDERS 