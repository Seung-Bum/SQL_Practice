select *
from COUNTRIES;

select *
from REGIONS;

SELECT 
    COUNTRY_NAME
    ,DECODE(REGION_ID, 1, 'Europe', 3, 'Asia', 2, 'Americas', 'Middle East and Africa') AS REGION
FROM COUNTRIES
ORDER BY REGION;