SELECT TRUNC(SYSDATE) + 5 COL1 -- ����ð����� 5�� +
       ,TRUNC(SYSDATE) + 5/(24*60*60) COL2 -- ����ð����� 5�� +
       ,TRUNC(SYSDATE) + 5*60/(24*60*60) COL3 -- ����ð����� 5�� +
       ,TRUNC(SYSDATE) + 5*60*60/(24*60*60) COL4 -- ����ð����� 5�ð� +
       ,ADD_MONTHS(SYSDATE, -3) COL5 -- ����ð����� 3����
       ,MONTHS_BETWEEN(SYSDATE, TO_DATE('2022-04-20','YYYY-MM-DD')) COL6 -- ����ð����� 2022-04-20���� ������
FROM DUAL
