SELECT 
    city_code, 
    city, 
    month, 
    avg_temp_fahrenheit, 
    {{ to_celsius('avg_temp_fahrenheit', 2) }} as avg_temp_celsius 
FROM sleekmart_oms."L1_LANDING".city_temperature 
