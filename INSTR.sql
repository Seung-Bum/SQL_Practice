/* INSTR 
�˻��� 1���� ���۵�
��ҹ��� ���о��� �˻��Ϸ��� UPPER, LOWER�� ������ �˻� 
SELECT INSTR('Oracle Database 12c Release', 'DATABASE')        AS result1 -- �빮�� �˻� �ȵ�, 0
     , INSTR(UPPER('Oracle Database 12c Release'), 'DATABASE') AS result2 -- ������ �˻�, 8
     , INSTR('Oracle Database 12c Release', 'as', -1, 2) AS result3 -- �ڿ��� �ι�° �˻������ �ּ���, 13
     , INSTR('Oracle Database 12c Release', 'as', 15) AS result4 -- 15��° �ڸ����� �˻����ּ���, 25
  FROM dual */
  

/* ���ڿ� �ڸ��� : SUBSTR�� ���� ���� ����ϴ� INSTR 
WITH temp AS ( -- WITH �ӽ����̺�, ������ ���� ���� ȿ�� ����
    SELECT 'Oracle Database 12c Release' AS oracle_ver FROM dual
)

SELECT SUBSTR(oracle_ver, INSTR(oracle_ver, 'Database')) AS result1 -- ���� �ɼ��� ������ ã���ܾ� ���� ������ �ڸ���. Database 12c Release
     , SUBSTR(oracle_ver, INSTR(oracle_ver, 'Database'), 4) AS result2 -- �ɼ� ������ ã�� �ܾ���� �ɼǱ��� �ڸ� Data
FROM temp */


/* �ܾ�� �˻��Ҷ�??
WHERE ������ ������ �ο��� �� ����� �� �ִ�.
WHERE oracle_ver LIKE '%12c%�� ������ ����� ��ȯ�Ѵ�. 

WITH temp AS (
    SELECT 'Oracle Database 12c Release' AS oracle_ver FROM dual
)

SELECT *
  FROM temp
 WHERE INSTR(oracle_ver, '12c') > 0 -- Oracle Database 12c Release */
 

/* �������� ���ڰ˻� 
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


/* INSTR�˻� : GRADE�� 4, 3�� ����� ���� ���
�ڵ��� ���̰� ������ ��� ������(|)�� �̿��ؼ� �˻��� �� �ִ�.
SELECT *
  FROM EXAM_RSLT
 WHERE INSTR('4|3', GRADE) > 0 */
 
 
/* �ڵ��� ���̰� �������� ���� ��� �������� ã�� ��� 
WITH dept AS (
    SELECT 10 AS deptno, 'ACCOUNTING' AS dname, 'NEW YORK' AS loc FROM dual UNION ALL
    SELECT 20 AS deptno, 'RESEARCH'   AS dname, 'DALLAS'   AS loc FROM dual UNION ALL
    SELECT 30 AS deptno, 'SALES'      AS dname, 'CHICAGO'  AS loc FROM dual UNION ALL
    SELECT 40 AS deptno, 'OPERATIONS' AS dname, 'BOSTON'   AS loc FROM dual
)

SELECT *
  FROM dept
 WHERE INSTR('|RESEARCH|SALES|', '|' || dname || '|') > 0
 -- DNAME�ȿ��� RESEARCH, SALES �� ã�Ƽ� ��� ������ ������
 -- �μ��� �̸��� ���̰� �ٸ����� ã�Ҵ� */