select *
from COUNTRIES;

select *
from REGIONS;

INSERT INTO COUNTRIES VALUES('UI', 'Ukraine', 4);

-- �ش� ���̺���� �÷� ������ Ȯ���Ͽ� �����ϰ� �Ʒ� SELECT���� �����Ѵ�.
-- ������ �÷��� ���� �ʿ� ���� �ٷ� ���԰��� �ϴ�.
DESC COUNTRIES; 

-- ������ ���缭 �ְ� ���� ���� �ִ´�.
INSERT INTO COUNTRIES 
SELECT
    'BS'
    ,'Belarus'
    ,4
FROM COUNTRIES
WHERE COUNTRY_ID = 'UI'
;


COMMIT;