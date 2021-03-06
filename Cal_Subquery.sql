/* 달력만들기 인라인뷰 서브쿼리 로직 */
SELECT EXTRACT(YEAR FROM LAST_DAY (ADD_MONTHS (TO_DATE(:V_YMD,'YYYYMMDD'),ROWNUM-1) ) ) Y -- 2022
      ,EXTRACT(MONTH FROM LAST_DAY (ADD_MONTHS (TO_DATE(:V_YMD,'YYYYMMDD'),ROWNUM-1) ) ) M -- 5
      ,EXTRACT(DAY FROM LAST_DAY (ADD_MONTHS (TO_DATE(:V_YMD,'YYYYMMDD'),ROWNUM-1) ) ) D -- 31
FROM DUAL