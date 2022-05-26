WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL comm FROM dual UNION ALL
  SELECT 7654 empno, 'MARTIN' ename, 'SALESMAN'  job, 1400 comm FROM dual
)  

SELECT empno
     , ename
     , comm                 AS comm 
     , NVL2(comm, 'Y', 'N') As comm2 --Ŀ�̼��� ������ 'Y' ������ 'N' 
     -- NVL�� �ݴ� NULL �̸� Y �ƴϸ� N
  FROM emp


-- NULL �� ���� ���ϸ� NULL 500���� �־��µ� ����������
-- NVL�� 0���� ġȯ����� �Ѵ�.
-- NULL�� ���� ����ؾ��Ѵ�. �׷��� �Լ��϶��� 



