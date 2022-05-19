/* 테이블 전체항목 조회 
SELECT *
  FROM EXAM_RSLT */


/* INLINE VIEW 
SELECT NAME
  FROM (SELECT NAME FROM EXAM_RSLT WHERE KOR > 50) */
  
  
/* DECODE 
SELECT NAME, KOR, DECODE(KOR, 80, '80점', '80점이 아님') PASS
  FROM EXAM_RSLT; */
  

/* CASE WHEN 
SELECT NAME, KOR,
   (CASE
     WHEN KOR > 50 THEN '50점이상'
     ELSE '50점미만'
     END) PASS
FROM EXAM_RSLT; */


/* ROWNUM 
SELECT ROWNUM, EX.*
  FROM EXAM_RSLT EX; */


/* ROWNUM 1
SELECT ROWNUM, EX.*
  FROM EXAM_RSLT EX
WHERE ENG > 90 */


/* ROWNUM 2 
   먼저 인라인뷰로 정렬을 한후에 ROWNUM을 적용해야함 
SELECT NAME, K.*
  FROM (
         SELECT *
         FROM EXAM_RSLT
         ORDER BY KOR DESC
) K
WHERE ROWNUM <= 3;*/


/* ORDER BY 기본 오름차순 
SELECT *
  FROM EXAM_RSLT
ORDER BY KOR; */


/* CONNECT BY LEVEL 
SELECT LEVEL AS NO
  FROM DUAL
CONNECT BY LEVEL <= 5; */


/* CONNECT BY LEVEL 
SELECT '2020년'||LPAD(LEVEL, 2, 0)||'월' AS NO
  FROM DUAL
CONNECT BY LEVEL <= 12 */


/* RPAD */
/* 이름 뒤에 캡 붙이기 
SELECT NAME
     , RPAD(NAME, 9, ' 캡')
  FROM EXAM_RSLT; */
  

/* LPAD */
/* 이름 앞에 캡 붙이기 
SELECT NAME
     , LPAD(NAME, 9, '캡 ')
  FROM EXAM_RSLT */


/* SALE_TBL 전체조회
SELECT *
FROM SALE_TBL */


/* NESTED SUBQUERY */
/* 국어점수가 50점을 초과한 사람의 이름과 점수 
SELECT EX.NAME, EX.KOR
FROM EXAM_RSLT EX
WHERE EX.KOR IN (SELECT EX.KOR
                          FROM EXAM_RSLT EX
                          WHERE EX.KOR > 50); */

                          
