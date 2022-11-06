select *
from COUNTRIES;

select *
from REGIONS;


MERGE 
 INTO COUNTRIES a
USING dual
   ON (a.COUNTRY_ID = 'UU')
 WHEN MATCHED THEN
      UPDATE
         SET a.REGION_ID = 1
 WHEN NOT MATCHED THEN
      INSERT (a.COUNTRY_ID, a.COUNTRY_NAME, a.REGION_ID)
      VALUES ('WK', 'Wakanda', 4);



      
