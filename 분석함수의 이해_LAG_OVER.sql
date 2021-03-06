/*
WITH YSB1 AS (
  SELECT 'A' NAME,90 KOR,75 ENG,93 MAT FROM DUAL UNION ALL
  SELECT 'B' NAME,91 KOR,99 ENG,100 MAT FROM DUAL UNION ALL
  SELECT 'C' NAME,80 KOR,65 ENG,39 MAT FROM DUAL UNION ALL
  SELECT 'D' NAME,35 KOR,34 ENG,40 MAT FROM DUAL
)

SELECT *
  FROM YSB1
*/


/*
CREATE TABLE YSB -- CTAS문법
	SELECT 'A' NAME,90 KOR,75 ENG,93 MAT FROM DUAL UNION ALL
	SELECT 'B' NAME,91 KOR,99 ENG,100 MAT FROM DUAL UNION ALL
	SELECT 'C' NAME,80 KOR,65 ENG,39 MAT FROM DUAL UNION ALL
	SELECT 'D' NAME,35 KOR,34 ENG,40 MAT FROM DUAL
;
*/

/* SQL 썼던 내용을 DB에 붙임 보이게 - VIEW
CREATE VIEW V_AS
SELECT *
FROM (SELECT * FROM YSB); */


-- 분석함수 로우끼리 연관지어서 계산한다
-- 위와 같은 내용으로 테이블이 생성됨
/* 
SELECT A.* -- A의 모든 컬럼을 보여줘
,LAG(ENG) OVER(ORDER BY ENG DESC) PREV
,LAG(ENG) OVER(ORDER BY ENG DESC) - ENG CHA
FROM HAB A
*/




SELECT NAME
      ,ENG 
      ,LEAD(ENG) OVER(ORDER BY ENG DESC) NEXT_ -- 다음행
      ,ENG - LEAD(ENG) OVER(ORDER BY ENG DESC) CHA -- 현재 - 다음
FROM HAB A;

SELECT NAME
      ,ENG 
      ,LAG(ENG) OVER(ORDER BY ENG DESC) PREV-- 이전행
      ,LAG(ENG) OVER(ORDER BY ENG DESC) - ENG CHA -- 현재 - 이전
FROM HAB A;


/* 블로그 예제
SELECT empno
     , ename
     , job
     , sal
     , LAG(empno) OVER(ORDER BY empno)  AS empno_prev
     , LEAD(empno) OVER(ORDER BY empno) AS empno_next
  FROM emp 
 WHERE job IN ('MANAGER', 'ANALYST', 'SALESMAN') -- JOB안에 해당 문자가 있으면 출력해라
*/
