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

/*
SELECT SYS_CONNECT_BY_PATH(DGT, '->') -- ��θ� �� �� �ִ�.
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT 
START WITH PDGT IS NULL 
;
*/


/*
-- ������
SELECT DGT, SYS_CONNECT_BY_PATH(DGT, '->'), LEVEL
FROM HIR_TST
CONNECT BY DGT = PRIOR PDGT -- ��θ� �� �� �ִ�.
START WITH DGT = 6
;
*/


/* 
SELECT DGT
       ,SYS_CONNECT_BY_PATH(DGT, '->') PATH_
       ,LPAD(' ', (LEVEL-1)*6, ' ' ) || '|-' || DGT PATH__
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT -- PRIOR�� ��� �ٿ��ֳĿ� ���� ���� ������ �޶���
START WITH PDGT IS NULL;
;
*/


/* 
-- > ���� �־�� ���ѷ���
SELECT *
FROM HIR_TST
UNION ALL
SELECT 10, 11
FROM DUAL;

SELECT LPAD(' ', (LEVEL-1)*6, ' ' ) || '|-' || DGT DGT_TREE
      ,CONNECT_BY_ROOT DGT
      ,DGT
      ,PDGT
      ,CONNECT_BY_ISCYCLE CYC
FROM HIR_TST
CONNECT BY NOCYCLE PRIOR DGT = PDGT
START WITH DGT = 1;
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

SELECT SYS_CONNECT_BY_PATH(DGT,'/') PATH
    ,LPAD(' ',(LEVEL-1) *6) || '-' || DGT S
    ,CONNECT_BY_ROOT DGT SYS_ROOT
    ,DGT
    ,PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
--ORDER SIBLINGS BY DGT, PDGT
ORDER SIBLINGS BY DECODE(DGT, 1,2,3,4,5,6)







