-- 3.3 �м��Լ��� ����
/* 1*/

/* 
SELECT NAME -- �̸��� �հ�
    ,SUM(KOR) KOR
    ,SUM(ENG) ENG
    ,SUM(MAT) MAT
    ,SUM(KOR + ENG + MAT) TOT
FROM EXAM_RSLT A
GROUP BY CLASS, NAME
UNION ALL
SELECT CLASS -- �ݺ��հ�
    ,SUM(KOR) KOR
    ,SUM(ENG) ENG
    ,SUM(MAT) MAT
    ,SUM(KOR + ENG + MAT) TOT
FROM EXAM_RSLT A
GROUP BY CLASS
UNION ALL
SELECT 'TOT' -- �Ѱ�
    ,SUM(KOR) KOR
    ,SUM(ENG) ENG
    ,SUM(MAT) MAT
    ,SUM(KOR + ENG + MAT) TOT
FROM EXAM_RSLT A
GROUP BY NULL -- �����
*/


/* 
SELECT NVL(DECODE(NO,1,NAME,2,CLASS), 'TOT') NAME 
       -- 1�϶� NAME 2�϶� CLASS �Ѵپƴ� NULL �϶� TOT => ROW (NAME���� �����߱� ������ ROW�� �ȴ�.)
    ,SUM(KOR) KOR -- �÷�
    ,SUM(ENG) ENG -- �÷�
    ,SUM(MAT) MAT -- �÷�
    ,SUM(KOR + ENG + MAT) TOT -- �÷�
FROM EXAM_RSLT A, -- ������ 3�谡 �ȴ�.
    ( SELECT NO
      FROM COPY_T
      WHERE ROWNUM <=3 -- ���縦 3�� �ݺ�
    ) B
GROUP BY DECODE(NO,1,CLASS) -- NO�� 1�϶� NO, CLASS
        ,DECODE(NO,1,NAME,2,CLASS) -- NO�� 2�϶� CLASS������ GROUP BY
ORDER BY MIN(NO), KOR, ENG, MAT, TOT -- ������ ������� �÷� �����ϸ� �ɵ�
*/



/* �м��Լ� ���  */
SELECT DECODE(GROUPING(CLASS)||
              GROUPING(NAME),'00',NAME,'01',CLASS,'TOT') NAME -- ROW
    ,SUM(KOR) KOR -- �÷�
    ,SUM(ENG) ENG -- �÷�
    ,SUM(MAT) MAT -- �÷�
    ,SUM(KOR + ENG + MAT) TOT -- �÷�
    ,GROUPING(CLASS)||GROUPING(NAME) GR -- �÷� (GROUP BY��)
FROM EXAM_RSLT A
GROUP BY ROLLUP(CLASS, NAME) -- 00
ORDER BY GR, KOR--00


/* ���ڵ带 ������ 
SELECT 
     NAME 
    ,CLASS
    ,GROUPING(CLASS) -- GROUPING, DECODE�� �Բ����̸� ���� ������ 0, ������(NULL) 1�� �����Ѵ�.
    ,GROUPING(NAME)
    ,SUM(KOR + ENG + MAT) TOT -- �÷�
FROM EXAM_RSLT A
GROUP BY ROLLUP(CLASS, NAME) -- ȫ�浿�� ���� ���� ���� ���� �հ踦 ���� (�� �л��� (ROW))
*/






