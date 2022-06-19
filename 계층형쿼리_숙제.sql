/* °èÃþÇü Äõ¸® ¼÷Á¦ */

/* */
SELECT *
FROM(
	SELECT  
	        LAST_VALUE( RTRIM(LTRIM(SYS_CONNECT_BY_PATH(DGT,'+'), '+'), '+') || '=' || NVL(DGT, P_RESULT) ) OVER() V_RESULT
	        --NVL(DGT, P_RESULT)
	       --,RTRIM(LTRIM(SYS_CONNECT_BY_PATH(DGT,'+'), '+'), '+') || '=' || NVL(DGT, P_RESULT) V_RESULT
	       --,LPAD(' ',(LEVEL-1) *6 ) || '-' || DGT RESULT
	       --,DGT
	       --,PDGT
	       --,LEVEL V_LEVEL
	       --,P_RESULT
	FROM(
		SELECT DGT
		      ,LAG(DGT) OVER(ORDER BY DGT) PDGT
		      ,SUM(DGT) P_RESULT
		FROM (
			SELECT LEVEL DGT
			FROM DUAL
			CONNECT BY LEVEL <= :V_END
		) A
		GROUP BY ROLLUP(DGT)
		ORDER BY DGT DESC
	)
	CONNECT BY PRIOR DGT = PDGT
	START WITH DGT = :V_START
)
WHERE ROWNUM = 1
;


/* 
	SELECT  
	       NVL(DGT, P_RESULT)
	       ,RTRIM(LTRIM(SYS_CONNECT_BY_PATH(DGT,'+'), '+'), '+') || '=' || NVL(DGT, P_RESULT) V_RESULT
	       ,LPAD(' ',(LEVEL-1) *6 ) || '-' || DGT RESULT
	       ,DGT
	       ,PDGT
	       ,LEVEL V_LEVEL
	       ,P_RESULT
	FROM(
		SELECT DGT
		      ,LAG(DGT) OVER(ORDER BY DGT) PDGT
		      ,SUM(DGT) P_RESULT
		FROM (
			SELECT LEVEL DGT
			FROM DUAL
			CONNECT BY LEVEL <= :V_END
		) A
		GROUP BY ROLLUP(DGT)
	)
	CONNECT BY PRIOR DGT = PDGT
	START WITH DGT = :V_START
;
*/
