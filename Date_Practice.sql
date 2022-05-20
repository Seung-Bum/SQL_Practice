SELECT TRUNC(SYSDATE) + 5 COL1 -- 현재시간에서 5일 +
       ,TRUNC(SYSDATE) + 5/(24*60*60) COL2 -- 현재시간에서 5초 +
       ,TRUNC(SYSDATE) + 5*60/(24*60*60) COL3 -- 현재시간에서 5분 +
       ,TRUNC(SYSDATE) + 5*60*60/(24*60*60) COL4 -- 현재시간에서 5시간 +
       ,ADD_MONTHS(SYSDATE, -3) COL5 -- 현재시간에서 3달전
       ,MONTHS_BETWEEN(SYSDATE, TO_DATE('2022-04-20','YYYY-MM-DD')) COL6 -- 현재시간에서 2022-04-20간의 개월수
FROM DUAL
