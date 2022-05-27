-- �м��Լ� ROLLUP�� CUBE�� ����

--SELECT *
--FROM STUDENT;


/* ROLLUP 
   XO�� ������ �ʾƼ� �ȳ��´�.
   ���ռ����� �ִ�.
SELECT DEPTNO
      ,GRADE
      ,SUM(WEIGHT)
      ,GROUPING(DEPTNO) || GROUPING(GRADE) AS TGT
      ,'DEPTNO(' || DECODE(GROUPING(DEPTNO),0,'O','X') || ')' || '/ GRADE(' || DECODE(GROUPING(GRADE),0,'O','X') || ')' AS TGT_CMT
FROM STUDENT
GROUP BY ROLLUP(DEPTNO, GRADE);
*/

/* CUBE 
   XO�� ����ؼ� XO�� ��� �ȴ�. 
   ��������� �����ϴ�. */
SELECT DEPTNO
      ,GRADE
      ,SUM(WEIGHT)
      ,GROUPING(DEPTNO) || GROUPING(GRADE) AS TGT
      ,'DETNO(' || DECODE( GROUPING(DEPTNO), 0, 'O', 'X' ) || ')' || '/ GRADE(' || DECODE(GROUPING(GRADE),0,'O','X') || ')' AS TGT_CMT
FROM STUDENT
GROUP BY CUBE(DEPTNO, GRADE)
ORDER BY 4; -- GRADE�� 4�������� 4���ؾ� ������ XO�� ����, DEPTNO, GRADE ���°� ���� ���� �ְ� �ƴ� ���� ����


