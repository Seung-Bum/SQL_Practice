--CREATE VIEW V_YSB_1 AS


SELECT
     MIN(NO) NO
	,MIN(ST_DT) ST_DT
	,MIN(ET_DT) ET_DT
	--,MIN(DECODE(CHA,0,ET_DT)) CHA
	,MIN(NM) NM
FROM(
	SELECT NO
	      ,ST_DT
	      ,ET_DT
	      ,LAG(ET_DT) OVER(PARTITION BY NO ORDER BY ST_DT, ET_DT DESC) PREV -- 이전행
	      ,LAG(ET_DT) OVER(PARTITION BY NO ORDER BY ST_DT, ET_DT DESC) - ST_DT CHA -- 시작일과 종료일이 같음
	      ,NM
	FROM ORG_TBL
)
GROUP BY ST_DT, ET_DT
HAVING MIN(DECODE(CHA,0,ET_DT)) IS NULL -- NULL값을 배제
ORDER BY ST_DT, ET_DT;