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
 
 
 
 
 
CREATE VIEW V_YSBHW053001 AS 
SELECT *
FROM DUAL

--6 다른 해설
/*
- 해설
? 중요한 SUBSTR(MAX(LPAD(SCORE,3,'0')||SUBJECT),4) 과목명
? LPAD(SCORE,3,'0') 를 먼저 보면,
? LPAD(EXPR1, N, EXPR2) : EXPR1을 반환하는데, EXPR2를 (N - EXPR1 길이)만큼 왼쪽을 채워 반환
? 따라서 100일 경우, 3자리이기 때문에 변화가 없으나, 1~99의 경우 앞에 0이 채워지게 된다.
? 그 후 SUBJECT를 ||로 붙인다.
? MAX로 묶으면, GROUP BY로 NM을 묶었기 때문에, 앞의 3자리 숫자를 비교해서 NM에 따라서 최대값인 행이 나오게 된다.
? 또한, 뒤의 SCORE도 MAX로 묶었기 때문에 NM에 따라서 최대값인 행이 나오게 된다.
? 이후, SUBSTR함수로 2번째 컬럼을 잘라낸 결과를 반영한다.
? SUBSTR(CHAR,N1,N2) : CHAR에서 N1 위치에서 시작해 N2 길이만큼을 잘라낸 결과를 반환
? 4번째 자리에서 시작하기 때문에 숫자를 제외한 과목명만이 남게 된다.
*/
 
 
 
 
 
 
 
