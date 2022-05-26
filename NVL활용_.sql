WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL comm FROM dual UNION ALL
  SELECT 7654 empno, 'MARTIN' ename, 'SALESMAN'  job, 1400 comm FROM dual
)  

SELECT empno
     , ename
     , comm                 AS comm 
     , NVL2(comm, 'Y', 'N') As comm2 --커미션이 있으면 'Y' 없으면 'N' 
     -- NVL은 반대 NULL 이면 Y 아니면 N
  FROM emp


-- NULL 에 값을 더하면 NULL 500만원 넣었는데 없어져버림
-- NVL로 0으로 치환해줘야 한다.
-- NULL을 빼고 계산해야한다. 그룹핑 함수일때는 



