/* ���̺� ��ü�׸� ��ȸ 
SELECT *
  FROM EXAM_RSLT */


/* INLINE VIEW 
SELECT NAME
  FROM (SELECT NAME FROM EXAM_RSLT WHERE KOR > 50) */
  
  
/* DECODE 
SELECT NAME, KOR, DECODE(KOR, 80, '80��', '80���� �ƴ�') PASS
  FROM EXAM_RSLT; */
  

/* CASE WHEN 
SELECT NAME, KOR,
   (CASE
     WHEN KOR > 50 THEN '50���̻�'
     ELSE '50���̸�'
     END) PASS
FROM EXAM_RSLT; */


/* ROWNUM 
SELECT ROWNUM, EX.*
  FROM EXAM_RSLT EX; */


/* ROWNUM 1
SELECT ROWNUM, EX.*
  FROM EXAM_RSLT EX
WHERE ENG > 90 */


/* ROWNUM 2 
   ���� �ζ��κ�� ������ ���Ŀ� ROWNUM�� �����ؾ��� 
SELECT NAME, K.*
  FROM (
         SELECT *
         FROM EXAM_RSLT
         ORDER BY KOR DESC
) K
WHERE ROWNUM <= 3;*/


/* ORDER BY �⺻ �������� 
SELECT *
  FROM EXAM_RSLT
ORDER BY KOR; */


/* CONNECT BY LEVEL 
SELECT LEVEL AS NO
  FROM DUAL
CONNECT BY LEVEL <= 5; */


/* CONNECT BY LEVEL 
SELECT '2020��'||LPAD(LEVEL, 2, 0)||'��' AS NO
  FROM DUAL
CONNECT BY LEVEL <= 12 */


/* RPAD */
/* �̸� �ڿ� ĸ ���̱� 
SELECT NAME
     , RPAD(NAME, 9, ' ĸ')
  FROM EXAM_RSLT; */
  

/* LPAD */
/* �̸� �տ� ĸ ���̱� 
SELECT NAME
     , LPAD(NAME, 9, 'ĸ ')
  FROM EXAM_RSLT */


/* SALE_TBL ��ü��ȸ
SELECT *
FROM SALE_TBL */


/* NESTED SUBQUERY */
/* ���������� 50���� �ʰ��� ����� �̸��� ���� 
SELECT EX.NAME, EX.KOR
FROM EXAM_RSLT EX
WHERE EX.KOR IN (SELECT EX.KOR
                          FROM EXAM_RSLT EX
                          WHERE EX.KOR > 50); */

                          
