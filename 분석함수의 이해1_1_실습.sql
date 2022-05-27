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
 
 
 
 
