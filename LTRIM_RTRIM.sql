/* LTRIM RTRIM 
TRIM 함수는 문자열의 양쪽 공백을 제거하는 기본적인 함수이다. 
LTRIM 함수, RTRIM 함수는 왼쪽과 오른쪽의 공백을 제거할 때 사용가능 하지만, 
반복적인 문자나 특정 문자를 제거할 때 자주 사용한다. */


/* TRIM 
WITH DEPT AS ( 
    SELECT '0010' DEPTNO, 'ACCOUNTING   ' DNAME, '  NEW YORK  ' LOC FROM DUAL 
) 
 
SELECT DNAME   
     , TRIM(DNAME) -- ACCOUNTING 공백삭제
     , LOC 
     , TRIM(LOC) --   NEW YORK 공백삭제
  FROM DEPT */
  

/* LTRIM, RTRIM
WITH DEPT AS (
    SELECT '0010' DEPTNO, 'ACCOUNTING' DNAME, '  NEW YORK  ' LOC FROM DUAL
)

SELECT LOC COL1
     , LTRIM(LOC) COL2-- 오른쪽 공백이 남아있음
     , DEPTNO COL3
     , LTRIM(DEPTNO, '0') COL4 -- 10
     , DNAME
     , LTRIM(DNAME, 'ACC') COL5 -- OUNTING, ACC가 날아감
     , RTRIM(DNAME, 'OUNTING') COL6 -- ACC, OUNTING이 날아감
  FROM DEPT */
  
  