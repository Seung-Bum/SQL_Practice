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




