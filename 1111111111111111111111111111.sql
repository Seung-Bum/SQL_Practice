/* ���� 
Ʈ�� �׷���
����Ŭ �������� ����Ŭ ��� Ʈ��
���� �����ؼ� ������ �ٽ� ���ƿ��°�
�������� ����Ŭ�� ������ ������ �Ѵ�.

 ����
START WITH
CONNECT BY
PRIOR

���̺� ����

�ΰ����� ������� �Ѵ�.

SELECT SYS_CONNECT_BY_PATH(DGT, '->')
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT -- ��θ� �� �� �ִ�.
START WITH PDGT IS NULL 
;


SELECT DGT, SYS_CONNECT_BY_PATH(DGT, '->'), LEVEL
FROM HIR_TST
CONNECT BY DGT = PRIOR PDGT -- ��θ� �� �� �ִ�.
START WITH DGT = 6
;


SELECT DGT
       ,SYS_CONNECT_BY_PATH(DGT, '->')
       ,LPAD(' ', (LEVEL-1)*6, ' ' ) || '|-' || DGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT -- PRIOR�� ��� �ٿ��ֳĿ� ���� ���� ������ �޶���
START WITH PDGT IS NULL;
;


-- > ���� �־�� ���ѷ���
CREATE TABLE YSB_HIR_TST AS
SELECT *
FROM HIR_TST
UNION ALL
SELECT 10, 11
FROM DUAL;

INSERT INTO YSB_HIR_TST
*/

/*
SELECT SYS_CONNECT_BY_PATH(DGT,'/') PATH
    ,LPAD(' ',(LEVEL-1) *6 ) || '-' || DGT
    ,DGT, PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
;

  */



SELECT  MIN( RTRIM(LTRIM(SYS_CONNECT_BY_PATH(DGT,'+'), '+'), '+') || '=' || P_RESULT )  V_RESULT
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
)
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = :V_START


;


/*
SELECT DGT
FROM (SELECT LEVEL DGT
		FROM DUAL
		CONNECT BY LEVEL <= :V_END)

WHERE ROWNUM <= 3
GROUP BY ROLLUP(DGT)
ORDER BY DGT ASC
;*/




