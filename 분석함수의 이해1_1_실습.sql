-- 뷰만들기 보기 F4
--V_SAMPLE1
--V_SAMPLE2

/*---------------------------------------------
-- 오브젝트명: CZONE_USER.V_SAMPLE1
-- 생성일자 : 2022-05-25 21:59:39.0
-- 오브젝트명: 2022-05-25 21:59:39.0
-- 상태: VALID
---------------------------------------------*/
/*
CREATE OR REPLACE FORCE EDITIONABLE VIEW "CZONE_USER"."V_SAMPLE1" ("NO", "SEQ", "NAME", "ENG1", "ENG2", "CHA") AS 
  SELECT MIN(NO) NO
      ,DECODE(SEQ,1,NO,NO+1) SEQ
      ,MAX(DECODE(SEQ,1,NAME)) NAME     
      ,MIN(DECODE(SEQ,1,ENG))  ENG1
      ,MIN(DECODE(SEQ,2,ENG))  ENG2
      ,MIN(DECODE(SEQ,2,ENG)) - MIN(DECODE(SEQ,1,ENG)) CHA
FROM (
  SELECT ROWNUM NO
        ,NAME
        ,KOR
        ,ENG
        ,MAT
  FROM (      
    SELECT A.*
    FROM HAB A
    ORDER BY ENG DESC
  )
) A,
( SELECT ROWNUM SEQ 
   FROM DUAL
   CONNECT BY LEVEL <=2
 )
 GROUP BY DECODE(SEQ,1,NO,NO+1)
 HAVING MAX(DECODE(SEQ,1,NAME)) IS NOT NULL
 ORDER BY SEQ;
 */
 
 -- 분석함수를 사용하지 않고 구현한 앞/뒤 데이터 차이 계산
 
SELECT MAX( DECODE(NO, 1, NAME) ) NAME
      ,SEQ
      ,MIN( DECODE(NO, 1, KOR) ) KOR -- NO1 테이블 기본 정보들 출력
      ,MIN( DECODE(NO, 1, ENG) ) ENG
      ,MIN( DECODE(NO, 1, MAT) ) MAT
      ,MIN( DECODE(NO, 1, KOR) ) + MIN( DECODE(NO, 1, ENG) ) + MIN( DECODE(NO, 1, MAT) ) TOT
     
FROM(
	 SELECT NAME
	       ,NO -- COPY_T를 1번 테이블, 2번 테이블로 구분함
	       ,DECODE(NO, 1, SEQ, SEQ+1) SEQ 
	       -- SEQ가 1이 아닐경우 SEQ를 1씩증가 시킴 ★★★ 여기서 이전행과 다음행이 구분
	       ,CLASS
	       ,KOR KOR
	       ,ENG ENG
	       ,MAT MAT
	       ,DECODE(NO, 1, KOR) + DECODE(NO, 1, ENG) + DECODE(NO, 1, MAT) N1
	       ,DECODE(NO, 2, KOR) + DECODE(NO, 2, ENG) + DECODE(NO, 2, MAT) N2
	 FROM(
		SELECT ROWNUM SEQ, A.*
		FROM(
			SELECT NAME
			      ,CLASS
			      ,KOR
			      ,ENG
			      ,MAT
			FROM EXAM_RSLT A
			ORDER BY KOR + ENG + MAT DESC ,NAME 
		) A
	 ),COPY_T B -- 테이블을 복사한다.
	 WHERE NO <= 2 --테이블이 두개로 만듬
)
GROUP BY SEQ -- 중복되는 SEQ기준으로 행을 합침 (SEQ)
HAVING MIN(DECODE(NO, 1, KOR)) IS NOT NULL 
-- 이전행과 다음행을 합치다보니 NULL 발생하는데 IS NOT NULL(NULL이 아니면 TURE)로 없애버림
ORDER BY SEQ
 
 
 
 
 
 
 
 
 
 
 
 
 
 
