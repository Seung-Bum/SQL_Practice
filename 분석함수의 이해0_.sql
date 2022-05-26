/* �м��Լ��� ���� PART1 
-- ���� ������
SELECT NAME
      ,CLASS
      ,KOR
      ,ENG
      ,MAT
FROM EXAM_RSLT;*/


/* ���μ��� �Ѱ� ���ϱ� */
SELECT DECODE(NO, 1, NAME, 'TOT') NAME 
-- ù��°�� ���յ��� ���� ���������� ��������
      ,SUM(KOR) KOR
      ,SUM(ENG) ENG
      ,SUM(MAT) MAT
      ,SUM(KOR) + SUM(ENG) + SUM(MAT) TOT
FROM EXAM_RSLT A,
     COPY_T B
WHERE NO <=2
GROUP BY DECODE(NO,1,NAME,'TOT'); 
-- TOT �������� GROUP BY �ϸ鼭 �Ʒ��� ���� ������



/* 
SELECT NAME
      ,SUM(KOR) KOR
      ,SUM(ENG) ENG
      ,SUM(MAT) MAT
      ,SUM(KOR) + SUM(ENG) + SUM(MAT) TOT
FROM EXAM_RSLT A
    ,COPY_T B -- �� �̸����� 100�� ������
GROUP BY NAME -- �׷��� ���� ��Ƣ�� �ƴ��� �����
*/


/* COPY_T B 
-- ���� ���̺��� ���ϴ� �����ŭ ����, ��������� 
-- ���Ҷ��� ������ üũ�� ����Ѵ�. 700 �೪��
SELECT NAME
      ,SUM(KOR) KOR
      ,SUM(ENG) ENG
      ,SUM(MAT) MAT
      ,SUM(KOR) + SUM(ENG) + SUM(MAT) TOT
FROM EXAM_RSLT A
    ,COPY_T B -- ���� ���̺��� ���ϴ� �����ŭ ����, ��������� ���Ҷ��� ������ üũ�� ����Ѵ�. 700 �೪��
WHERE NO <=2
GROUP BY NAME
*/


/*
SELECT A.* -- ��� �÷�
FROM EXAM_RSLT A
    ,COPY_T B -- ���� ���̺��� ���ϴ� �����ŭ ����, ��������� ���Ҷ��� ������ üũ�� ����Ѵ�. 700 �೪��
*/




/*
-- �����ð��� �Ѱ�
-- ���̺��� 3���� �÷��� ������ �������� ����
SELECT NO
      ,A.*
FROM EXAM_RSLT A
      (SELECT ROWNUM NO
      FROM DUAL
      CONNECT BY LEVEL <=2)
GROUP BY DECODE(NO,1,NAME,'�հ�')
ORDER BY MIN(NO)
-- �Ȱ��� ���̺��� �ι������� �ȵȴ�.
-- ������ ���� īƼ�� ���� WHERE ���� ����.
*/

