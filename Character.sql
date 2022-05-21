/* CHR, ASCII 
SELECT 
     CHR(64+ROWNUM) CHR -- ROWNUM이 1부터 시작됨 A
    ,ASCII(CHR(64+ROWNUM)) ASCII --65
    ,CONCAT('ASDF','DFSA') CONCAT -- ASDFDFSA
    ,'ASDF'||'ASDF'||'ASDF' -- ASDFASDFASDF
FROM DUAL; */


/* INSRT 
SELECT INSTR('ASEFASEF ASEFAESF AWEFAWEF','F',1,3) RESULT
FROM DUAL; */


/* LOWER UPPER
SELECT LOWER('ABC') LOWER
      ,UPPER('abc') UPPER
FROM DUAL; */


/* GREATEST 
국어 영어 수학 점수중 가장 높은 점수는?
SELECT NAME, KOR, ENG, MAT
      ,GREATEST(KOR, ENG, MAT) BEST_SCORE
FROM EXAM_RSLT */


/* LEAST 
국어 영어 수학 점수중 가장 낮은 점수는? 
SELECT NAME, KOR, ENG, MAT
      ,LEAST(KOR, ENG, MAT) WORST_SCORE
FROM EXAM_RSLT */


/* MAX 
국어 점수가 가장 높은사람 찾기 
SELECT EX.NAME, EX.KOR
FROM EXAM_RSLT EX 
WHERE EX.KOR = (SELECT MAX(KOR) FROM EXAM_RSLT); */


/* MIN
국어 점수가 가장 낮은사람 찾기
SELECT EX.NAME, EX.KOR
FROM EXAM_RSLT EX 
WHERE EX.KOR = (SELECT MIN(KOR) FROM EXAM_RSLT); */


/* LENGTH 
SELECT LENGTH('오라클') --3
     , LENGTH('오라클 SQL') --7 공백포함
FROM dual */


/* 이름이 두글자인 사람이름 출력 
SELECT NAME -- 송해
  FROM EXAM_RSLT
WHERE LENGTH(NAME) = 2 */


/* INITCAP 첫글자를 대문자로 바꾸고 나머지는 소문자 
SELECT INITCAP('the soap') "Capitals" -- The Soap
      ,INITCAP('THE SOAP')  Capitals  -- The Soap
FROM   DUAL; */


/* REPLACE()
오라클에서 특정 문자열을 치환하거나 제거하기 위해서는 replace() 함수를 사용하면 된다.
단순 문자열 치환 외에도 엔터값 제거나 <br/>태그를 엔터값 치환에도 많이 사용된다. 
오라클 10g 부터 정규식 사용이 가능한 regexp_replace()함수가 추가 되었다. */

/*
-- 특정문자 치환, 제거
WITH TEMP AS (
    SELECT 'Steven King' NM FROM DUAL
)

SELECT A.NM
     , REPLACE(A.NM, 'Steven', 'S.') RE_NM -- S. King
     , REPLACE(A.NM, 'King', '') RE_NM -- Steven
     --, REPLACE(replace(A.NM, chr(13), ''), chr(10), '') --엔터값 제거
     --, REPLACE(A.NM, chr(9), '') --탭문자 제거
     --, REPLACE(A.NM, '<br/>', chr(13)||chr(10)) --<br/>태그 엔터값으로 치환
  FROM TEMP A */


/*
-- 전화번호 구분자 제거
WITH TEMP AS (
    SELECT '010-4321-6789' TELNO FROM DUAL
)

SELECT A.TELNO
     , REPLACE(A.TELNO, '-', '') RE_TELNO
  FROM TEMP A */
  
  
/* SUBSTR 
WITH EMP AS (
    SELECT '7566' EMPNO, 'JONES' ENAME, '매니저' JOB FROM DUAL
)

SELECT ENAME COL1 -- JONES
     , SUBSTR(ENAME, 2) COL2 -- ONES
     , SUBSTR(ENAME, 2, 3) COL3 -- ONE
     , SUBSTR(ENAME, -3) COL4 -- NES
     , SUBSTR(ENAME, -3, 2) COL5 -- NE
     , JOB COL6 -- 매니저
     , SUBSTR(JOB, -3, 1) COL7 -- 매
  FROM EMP */
  
  

