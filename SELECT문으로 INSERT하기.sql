select *
from COUNTRIES;

select *
from REGIONS;

INSERT INTO COUNTRIES VALUES('UI', 'Ukraine', 4);

-- 해당 테이블안의 컬럼 내용을 확인하여 복사하고 아래 SELECT문에 복사한다.
-- 일일히 컬럼을 적을 필요 없이 바로 삽입가능 하다.
DESC COUNTRIES; 

-- 순서에 맞춰서 넣고 싶은 값을 넣는다.
INSERT INTO COUNTRIES 
SELECT
    'BS'
    ,'Belarus'
    ,4
FROM COUNTRIES
WHERE COUNTRY_ID = 'UI'
;


COMMIT;