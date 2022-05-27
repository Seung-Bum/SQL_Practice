-- 분석함수 ROLLUP과 CUBE의 차이

--SELECT *
--FROM STUDENT;


/* ROLLUP 
   XO는 허용되지 않아서 안나온다.
   조합순서가 있다.
SELECT DEPTNO
      ,GRADE
      ,SUM(WEIGHT)
      ,GROUPING(DEPTNO) || GROUPING(GRADE) AS TGT
      ,'DEPTNO(' || DECODE(GROUPING(DEPTNO),0,'O','X') || ')' || '/ GRADE(' || DECODE(GROUPING(GRADE),0,'O','X') || ')' AS TGT_CMT
FROM STUDENT
GROUP BY ROLLUP(DEPTNO, GRADE);
*/

/* CUBE 
   XO를 허용해서 XO도 출력 된다. 
   모든조합이 가능하다. */
SELECT DEPTNO
      ,GRADE
      ,SUM(WEIGHT)
      ,GROUPING(DEPTNO) || GROUPING(GRADE) AS TGT
      ,'DETNO(' || DECODE( GROUPING(DEPTNO), 0, 'O', 'X' ) || ')' || '/ GRADE(' || DECODE(GROUPING(GRADE),0,'O','X') || ')' AS TGT_CMT
FROM STUDENT
GROUP BY CUBE(DEPTNO, GRADE)
ORDER BY 4; -- GRADE가 4종류여서 4로해야 밑으로 XO가 빠짐, DEPTNO, GRADE 보는게 편할 수도 있고 아닐 수도 있음


