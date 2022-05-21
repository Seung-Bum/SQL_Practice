/* INSTR 
검색은 1부터 시작됨
대소문자 구분없이 검색하려면 UPPER, LOWER로 변경후 검색 
SELECT INSTR('Oracle Database 12c Release', 'DATABASE')        AS result1 -- 대문자 검색 안됨, 0
     , INSTR(UPPER('Oracle Database 12c Release'), 'DATABASE') AS result2 -- 변경후 검색, 8
     , INSTR('Oracle Database 12c Release', 'as', -1, 2) AS result3 -- 뒤에서 두번째 검색결과를 주세요, 13
     , INSTR('Oracle Database 12c Release', 'as', 15) AS result4 -- 15번째 자리부터 검색해주세요, 25
  FROM dual */
  

/* 문자열 자르기 : SUBSTR과 같이 많이 사용하는 INSTR 
WITH temp AS ( -- WITH 임시테이블, 여러번 사용될 수록 효율 증가
    SELECT 'Oracle Database 12c Release' AS oracle_ver FROM dual
)

SELECT SUBSTR(oracle_ver, INSTR(oracle_ver, 'Database')) AS result1 -- 따로 옵션이 없을시 찾은단어 부터 끝까지 자른다. Database 12c Release
     , SUBSTR(oracle_ver, INSTR(oracle_ver, 'Database'), 4) AS result2 -- 옵션 설정시 찾은 단어부터 옵션까지 자름 Data
FROM temp */


/* 단어로 검색할때??
WHERE 절에서 조건을 부여할 때 사용할 수 있다.
WHERE oracle_ver LIKE '%12c%와 동일한 결과를 반환한다. 

WITH temp AS (
    SELECT 'Oracle Database 12c Release' AS oracle_ver FROM dual
)

SELECT *
  FROM temp
 WHERE INSTR(oracle_ver, '12c') > 0 -- Oracle Database 12c Release */
 

/* 여러개의 문자검색 
WITH temp AS (
    SELECT 'Oracle Database 10g Release' AS oracle_ver FROM dual UNION ALL
    SELECT 'Oracle Database 11g Release' AS oracle_ver FROM dual UNION ALL
    SELECT 'Oracle Database 12c Release' AS oracle_ver FROM dual
)

SELECT *
  FROM temp
 WHERE (INSTR(oracle_ver, '10g') > 0  -- Oracle Database 10g Release
     OR INSTR(oracle_ver, '11g') > 0  -- Oracle Database 11g Release
     OR INSTR(oracle_ver, '12c') > 0) -- Oracle Database 12c Release */


/* INSTR검색 : GRADE가 4, 3인 사람의 정보 출력
코드의 길이가 일정한 경우 파이프(|)를 이용해서 검색할 수 있다.
SELECT *
  FROM EXAM_RSLT
 WHERE INSTR('4|3', GRADE) > 0 */
 
 
/* 코드의 길이가 일정하지 않을 경우 파이프로 찾는 방법 
WITH dept AS (
    SELECT 10 AS deptno, 'ACCOUNTING' AS dname, 'NEW YORK' AS loc FROM dual UNION ALL
    SELECT 20 AS deptno, 'RESEARCH'   AS dname, 'DALLAS'   AS loc FROM dual UNION ALL
    SELECT 30 AS deptno, 'SALES'      AS dname, 'CHICAGO'  AS loc FROM dual UNION ALL
    SELECT 40 AS deptno, 'OPERATIONS' AS dname, 'BOSTON'   AS loc FROM dual
)

SELECT *
  FROM dept
 WHERE INSTR('|RESEARCH|SALES|', '|' || dname || '|') > 0
 -- DNAME안에서 RESEARCH, SALES 를 찾아서 모든 정보를 보여줘
 -- 부서의 이름의 길이가 다르지만 찾았다 */