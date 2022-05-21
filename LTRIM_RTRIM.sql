/* LTRIM RTRIM 
TRIM �Լ��� ���ڿ��� ���� ������ �����ϴ� �⺻���� �Լ��̴�. 
LTRIM �Լ�, RTRIM �Լ��� ���ʰ� �������� ������ ������ �� ��밡�� ������, 
�ݺ����� ���ڳ� Ư�� ���ڸ� ������ �� ���� ����Ѵ�. */


/* TRIM 
WITH DEPT AS ( 
    SELECT '0010' DEPTNO, 'ACCOUNTING   ' DNAME, '  NEW YORK  ' LOC FROM DUAL 
) 
 
SELECT DNAME   
     , TRIM(DNAME) -- ACCOUNTING �������
     , LOC 
     , TRIM(LOC) --   NEW YORK �������
  FROM DEPT */
  

/* LTRIM, RTRIM
WITH DEPT AS (
    SELECT '0010' DEPTNO, 'ACCOUNTING' DNAME, '  NEW YORK  ' LOC FROM DUAL
)

SELECT LOC COL1
     , LTRIM(LOC) COL2-- ������ ������ ��������
     , DEPTNO COL3
     , LTRIM(DEPTNO, '0') COL4 -- 10
     , DNAME
     , LTRIM(DNAME, 'ACC') COL5 -- OUNTING, ACC�� ���ư�
     , RTRIM(DNAME, 'OUNTING') COL6 -- ACC, OUNTING�� ���ư�
  FROM DEPT */
  
  