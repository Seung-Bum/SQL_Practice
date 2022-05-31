-- 분석함수 ROW들관의 관계 연관 지어준다.
-- 오라클에서 지원하지 않는 데이터 베이스가 있다.

/*
SELECT RANK() OVER(ORDER BY NAME DESC)
       ,A.*
FROM EXAM_RSLT A
*/
-- 비교를 해야한다 자바에서는 컴페어 함수에 기준을 적는다.
-- 비교가 필요할 경우 OVER안에 ORDER BY 기준을 적어야한다.

/*
SELECT RANK() OVER(PARTITION BY CLASS ORDER BY KOR+ENG+MAT DESC, NAME) RANK -- 정렬기준으로 정렬을 해줘야 한다. 반에서의
       ,SUM(KOR) OVER(ORDER BY NAME) SUM-- 조건이 필요없다. 하지만 써도 된다. => 진행하면서 합계를 구한다. RUNNIG SUMMERY 누적합
       ,A.*
FROM EXAM_RSLT A;


SELECT
FROM(
	SELECT *
	FROM EXAM_RSLT A
	UNION ALL
	SELECT 'XZY',CLASS,GRADE,NULL,NULL,NULL
)
FROM EXAM_RSLT A
WHERE ROWNUM = 1;

SELECT LAG(KOR) OVER(PARTITION BY CLASS ORDER BY KOR+ENG+MAT DESC, NAME NULLS LAST) KSCORE
      ,LEAD(KOR) OVER(ORDER BY KOR+ENG+MAT DESC, NAME NULLS LAST) KSCORE
      ,A.*
FROM EXAM_RSLT A;
*/


SELECT *
FROM EXAM_RSLT A
UNION ALL
SELECT 'XYZ', CLASS, GRADE, NULL,NULL,NULL
FROM EXAM_RSLT A
WHERE ROWNUM = 1
;






