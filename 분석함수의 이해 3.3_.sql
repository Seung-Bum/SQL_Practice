-- 3.3 분석함수의 이해
/* 1*/

/* 
SELECT NAME -- 이름별 합계
    ,SUM(KOR) KOR
    ,SUM(ENG) ENG
    ,SUM(MAT) MAT
    ,SUM(KOR + ENG + MAT) TOT
FROM EXAM_RSLT A
GROUP BY CLASS, NAME
UNION ALL
SELECT CLASS -- 반별합계
    ,SUM(KOR) KOR
    ,SUM(ENG) ENG
    ,SUM(MAT) MAT
    ,SUM(KOR + ENG + MAT) TOT
FROM EXAM_RSLT A
GROUP BY CLASS
UNION ALL
SELECT 'TOT' -- 총계
    ,SUM(KOR) KOR
    ,SUM(ENG) ENG
    ,SUM(MAT) MAT
    ,SUM(KOR + ENG + MAT) TOT
FROM EXAM_RSLT A
GROUP BY NULL -- 없어도됨
*/


/* 
SELECT NVL(DECODE(NO,1,NAME,2,CLASS), 'TOT') NAME 
       -- 1일때 NAME 2일때 CLASS 둘다아닌 NULL 일때 TOT => ROW (NAME으로 접근했기 때문에 ROW가 된다.)
    ,SUM(KOR) KOR -- 컬럼
    ,SUM(ENG) ENG -- 컬럼
    ,SUM(MAT) MAT -- 컬럼
    ,SUM(KOR + ENG + MAT) TOT -- 컬럼
FROM EXAM_RSLT A, -- 원본이 3배가 된다.
    ( SELECT NO
      FROM COPY_T
      WHERE ROWNUM <=3 -- 복사를 3번 반복
    ) B
GROUP BY DECODE(NO,1,CLASS) -- NO가 1일때 NO, CLASS
        ,DECODE(NO,1,NAME,2,CLASS) -- NO가 2일때 CLASS만으로 GROUP BY
ORDER BY MIN(NO), KOR, ENG, MAT, TOT -- 정렬을 보고싶은 컬럼 선택하면 될듯
*/



/* 분석함수 사용  */
SELECT DECODE(GROUPING(CLASS)||
              GROUPING(NAME),'00',NAME,'01',CLASS,'TOT') NAME -- ROW
    ,SUM(KOR) KOR -- 컬럼
    ,SUM(ENG) ENG -- 컬럼
    ,SUM(MAT) MAT -- 컬럼
    ,SUM(KOR + ENG + MAT) TOT -- 컬럼
    ,GROUPING(CLASS)||GROUPING(NAME) GR -- 컬럼 (GROUP BY시)
FROM EXAM_RSLT A
GROUP BY ROLLUP(CLASS, NAME) -- 00
ORDER BY GR, KOR--00


/* 위코드를 연습함 
SELECT 
     NAME 
    ,CLASS
    ,GROUPING(CLASS) -- GROUPING, DECODE와 함께쓰이며 값이 있으면 0, 없으면(NULL) 1을 리턴한다.
    ,GROUPING(NAME)
    ,SUM(KOR + ENG + MAT) TOT -- 컬럼
FROM EXAM_RSLT A
GROUP BY ROLLUP(CLASS, NAME) -- 홍길동의 국어 영어 수학 점수 합계를 구함 (각 학생의 (ROW))
*/






