SELECT MIN(DECODE(D_ID,1,M_ID)) MID -- 202205 표시 (매달 1일시)
      ,MIN(DECODE(W_ID,1,D_ID)) 일
      ,MIN(DECODE(W_ID,2,D_ID)) 월
      ,MIN(DECODE(W_ID,3,D_ID)) 화
      ,MIN(DECODE(W_ID,4,D_ID)) 수
      ,MIN(DECODE(W_ID,5,D_ID)) 목
      ,MIN(DECODE(W_ID,6,D_ID)) 금
      ,MIN(DECODE(W_ID,7,D_ID)) 토
FROM (
SELECT EXTRACT(DAY FROM TO_DATE(:S_YM, 'YYYYMM')+ROWNUM-1) D_ID -- DAY 추출 (1~31 반복)
      ,TO_CHAR(TO_DATE(:S_YM,'YYYYMM')+ROWNUM-1, 'D') W_ID -- 요일 (1~7 반복)
      ,TRUNC(TO_DATE(:S_YM,'YYYYMM')+ROWNUM-1, 'D') WK_ID -- 몇주차
      ,TO_CHAR(TO_DATE(:S_YM,'YYYYMM')+ROWNUM-1, 'YYYYMM') M_ID -- 202205 표시
FROM DUAL
CONNECT BY LEVEL <=  LAST_DAY(TO_DATE(:E_YM, 'YYYYMM')) - TO_DATE(:S_YM, 'YYYYMM') -- 202205 ~ 202208 반복조절
)
GROUP BY WK_ID
ORDER BY WK_ID;