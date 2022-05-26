/* 함수활용 STAR */

--0
/*
SELECT *
FROM USER_TAB_COLUMNS;
*/

--1
SELECT ROWNUM RNUM
FROM USER_TAB_COLUMNS -- 데이터베이스에 있던 테이블
WHERE ROWNUM < 10 -- 1 ~ 9
ORDER BY RNUM ASC;
--ORDER BY RNUM DESC

--2
SELECT RNUM SEQ
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);

--3
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      -- *을 RNUM(*의 총갯수) 나머지 자리수를 *로 채워라
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);

--4
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      -- *을 RNUM(*의 총갯수) 나머지 자리수를 *로 채워라
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);

--4
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);

--5
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      ,DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ) DSEQ
      -- SIGN 음수와 양수를 판단한다. 0=0 0<A 1 0>A -1
      -- 1 : -4이기 때문에 RNUM은 1
      -- 2 : -3 -1=> 2
      -- 3 : -2 -1=> 3
      -- 4 : -1 -1=> 4
      -- 5 : 0  0 => 5
      -- 6 : 1  1 => 4
      -- 7 : 2  1 => 3
      -- 8 : 3  1 => 2
      -- 9 : 4  1 => 1
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);



--6
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      ,DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ) DSEQ
      ,LPAD('*',DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ),'*') DFTST
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);


--7
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      ,DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ) DSEQ
      ,LPAD('*',DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ),'*') DFTST
      
      ,CASE WHEN RNUM -5 > = 1 THEN 6 - ( (RNUM-4) )
	   ELSE RNUM
	   END AS CSEQ
	   -- 1 : -4 => 1
	   -- 2 : -3 => 2
	   -- 3 : -2 => 3
	   -- 4 : -1 => 4
	   -- 5 :  0 => 5
	   -- 6 :  1 => 4
	   -- 7 :  2 => 3
	   -- 8 :  3 => 2
	   -- 9 :  4 => 1
	   
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);


--8
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      ,DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ) DSEQ
      ,LPAD('*',DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ),'*') DFTST
      ,CASE WHEN RNUM -5 > = 1 THEN 6 - ( (RNUM-4) )
	   ELSE RNUM
	   END AS CSEQ
	  ,LPAD('*', CASE WHEN RNUM -5 > = 1 THEN 6 - ( (RNUM-4) )
	             ELSE RNUM
	             END
	       ,'*') CFTST
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);


--9
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      ,DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ) DSEQ
      ,LPAD('*',DECODE( SIGN(RNUM-5), 1, 6 - ( (RNUM - 4) ), RNUM ),'*') DFTST
      ,CASE WHEN RNUM -5 > = 1 THEN 6 - ( (RNUM-4) )
	   ELSE RNUM
	   END AS CSEQ
	  ,LPAD('*', CASE WHEN RNUM -5 > = 1 THEN 6 - ( (RNUM-4) )
	             ELSE RNUM
	             END
	       ,'*') CFTST
	  --,'A' || F_GET_ALPA('B', RNUM) T4
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);

-- DECODE( SIGN(RNUM-  5  [RNUM의 반]  ), 1 [기준] , 6 [RNUM 보다 하나 더큰수] - ( (RNUM - 4 [RNUM 보다 하나 작은수] ) ), RNUM )
-- 파라미터화
/* 괄호 주의 */
SELECT RNUM SEQ
      ,LPAD('*',RNUM,'*') T1 
      ,LPAD('A',RNUM,'B') T2
      ,DECODE( SIGN(RNUM- :RVS_PT ), 1, :RVS_PT+1 - ( ( RNUM - (:RVS_PT-1) ) ), RNUM ) DSEQ
      ,LPAD('*',DECODE( SIGN(RNUM- :RVS_PT), 1, :RVS_PT+1 - ( ( RNUM - (:RVS_PT-1) ) ), RNUM ),'*') DFTST
      ,CASE WHEN RNUM - :RVS_PT > = 1 THEN :RVS_PT+1 - ( (RNUM - (:RVS_PT-1)) )
	   ELSE RNUM
	   END AS CSEQ
	  ,LPAD('*', CASE WHEN RNUM - :RVS_PT > = 1 THEN :RVS_PT+1 - ( ( RNUM- (:RVS_PT-1) ) )
	             ELSE RNUM
	             END
	       ,'*') CFTST
	  --,'A' || F_GET_ALPA('B', RNUM) T4
FROM ( -- 인라인뷰
	SELECT ROWNUM RNUM
	FROM USER_TAB_COLUMNS
	WHERE ROWNUM < 10 -- 1 ~ 9
	ORDER BY RNUM ASC
);




