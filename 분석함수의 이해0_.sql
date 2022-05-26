/* 분석함수의 이해 PART1 
-- 원시 데이터
SELECT NAME
      ,CLASS
      ,KOR
      ,ENG
      ,MAT
FROM EXAM_RSLT;*/


/* 가로세로 총계 구하기 */
SELECT DECODE(NO, 1, NAME, 'TOT') NAME 
-- 첫번째의 총합들이 원래 보여져야할 데이터임
      ,SUM(KOR) KOR
      ,SUM(ENG) ENG
      ,SUM(MAT) MAT
      ,SUM(KOR) + SUM(ENG) + SUM(MAT) TOT
FROM EXAM_RSLT A,
     COPY_T B
WHERE NO <=2
GROUP BY DECODE(NO,1,NAME,'TOT'); 
-- TOT 기준으로 GROUP BY 하면서 아래에 한행 더붙음



/* 
SELECT NAME
      ,SUM(KOR) KOR
      ,SUM(ENG) ENG
      ,SUM(MAT) MAT
      ,SUM(KOR) + SUM(ENG) + SUM(MAT) TOT
FROM EXAM_RSLT A
    ,COPY_T B -- 각 이름마다 100씩 곱해짐
GROUP BY NAME -- 그룹함 수로 뻥튀기 됐던게 제어됨
*/


/* COPY_T B 
-- 기준 테이블을 원하는 배수만큼 복제, 결과집합을 
-- 구할때나 데이터 체크시 사용한다. 700 행나옴
SELECT NAME
      ,SUM(KOR) KOR
      ,SUM(ENG) ENG
      ,SUM(MAT) MAT
      ,SUM(KOR) + SUM(ENG) + SUM(MAT) TOT
FROM EXAM_RSLT A
    ,COPY_T B -- 기준 테이블을 원하는 배수만큼 복제, 결과집합을 구할때나 데이터 체크시 사용한다. 700 행나옴
WHERE NO <=2
GROUP BY NAME
*/


/*
SELECT A.* -- 모든 컬럼
FROM EXAM_RSLT A
    ,COPY_T B -- 기준 테이블을 원하는 배수만큼 복제, 결과집합을 구할때나 데이터 체크시 사용한다. 700 행나옴
*/




/*
-- 수업시간에 한것
-- 테이블을 3개로 늘려서 각각의 조건으로 묶음
SELECT NO
      ,A.*
FROM EXAM_RSLT A
      (SELECT ROWNUM NO
      FROM DUAL
      CONNECT BY LEVEL <=2)
GROUP BY DECODE(NO,1,NAME,'합계')
ORDER BY MIN(NO)
-- 똑같은 테이블을 두번읽으면 안된다.
-- 무조건 조인 카티션 조인 WHERE 절이 없다.
*/

