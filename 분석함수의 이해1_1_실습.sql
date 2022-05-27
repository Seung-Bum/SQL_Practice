-- �丸��� ���� F4
--V_SAMPLE1
--V_SAMPLE2

/*---------------------------------------------
-- ������Ʈ��: CZONE_USER.V_SAMPLE1
-- �������� : 2022-05-25 21:59:39.0
-- ������Ʈ��: 2022-05-25 21:59:39.0
-- ����: VALID
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
 
 -- �м��Լ��� ������� �ʰ� ������ ��/�� ������ ���� ���
 
SELECT MAX( DECODE(NO, 1, NAME) ) NAME
      ,SEQ
      ,MIN( DECODE(NO, 1, KOR) ) KOR -- NO1 ���̺� �⺻ ������ ���
      ,MIN( DECODE(NO, 1, ENG) ) ENG
      ,MIN( DECODE(NO, 1, MAT) ) MAT
      ,MIN( DECODE(NO, 1, KOR) ) + MIN( DECODE(NO, 1, ENG) ) + MIN( DECODE(NO, 1, MAT) ) TOT
     
FROM(
	 SELECT NAME
	       ,NO -- COPY_T�� 1�� ���̺�, 2�� ���̺�� ������
	       ,DECODE(NO, 1, SEQ, SEQ+1) SEQ 
	       -- SEQ�� 1�� �ƴҰ�� SEQ�� 1������ ��Ŵ �ڡڡ� ���⼭ ������� �������� ����
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
	 ),COPY_T B -- ���̺��� �����Ѵ�.
	 WHERE NO <= 2 --���̺��� �ΰ��� ����
)
GROUP BY SEQ -- �ߺ��Ǵ� SEQ�������� ���� ��ħ (SEQ)
HAVING MIN(DECODE(NO, 1, KOR)) IS NOT NULL 
-- ������� �������� ��ġ�ٺ��� NULL �߻��ϴµ� IS NOT NULL(NULL�� �ƴϸ� TURE)�� ���ֹ���
ORDER BY SEQ
 
 
 
 
 
 
 
 
 
 
 
 
 
 
