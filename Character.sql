/* CHR, ASCII 
SELECT 
     CHR(64+ROWNUM) CHR -- ROWNUM�� 1���� ���۵� A
    ,ASCII(CHR(64+ROWNUM)) ASCII --65
    ,CONCAT('ASDF','DFSA') CONCAT -- ASDFDFSA
    ,'ASDF'||'ASDF'||'ASDF' -- ASDFASDFASDF
FROM DUAL; */


/* INSRT 
SELECT INSTR('ASEFASEF ASEFAESF AWEFAWEF','F',1,3) RESULT
FROM DUAL; */


/* LOWER UPPER
SELECT LOWER('ABC') LOWER
      ,UPPER('abc') UPPER
FROM DUAL; */


/* GREATEST 
���� ���� ���� ������ ���� ���� ������?
SELECT NAME, KOR, ENG, MAT
      ,GREATEST(KOR, ENG, MAT) BEST_SCORE
FROM EXAM_RSLT */


/* LEAST 
���� ���� ���� ������ ���� ���� ������? 
SELECT NAME, KOR, ENG, MAT
      ,LEAST(KOR, ENG, MAT) WORST_SCORE
FROM EXAM_RSLT */


/* MAX 
���� ������ ���� ������� ã�� 
SELECT EX.NAME, EX.KOR
FROM EXAM_RSLT EX 
WHERE EX.KOR = (SELECT MAX(KOR) FROM EXAM_RSLT); */


/* MIN
���� ������ ���� ������� ã��
SELECT EX.NAME, EX.KOR
FROM EXAM_RSLT EX 
WHERE EX.KOR = (SELECT MIN(KOR) FROM EXAM_RSLT); */


/* LENGTH 
SELECT LENGTH('����Ŭ') --3
     , LENGTH('����Ŭ SQL') --7 ��������
FROM dual */


/* �̸��� �α����� ����̸� ��� 
SELECT NAME -- ����
  FROM EXAM_RSLT
WHERE LENGTH(NAME) = 2 */


/* INITCAP ù���ڸ� �빮�ڷ� �ٲٰ� �������� �ҹ��� 
SELECT INITCAP('the soap') "Capitals" -- The Soap
      ,INITCAP('THE SOAP')  Capitals  -- The Soap
FROM   DUAL; */


/* REPLACE()
����Ŭ���� Ư�� ���ڿ��� ġȯ�ϰų� �����ϱ� ���ؼ��� replace() �Լ��� ����ϸ� �ȴ�.
�ܼ� ���ڿ� ġȯ �ܿ��� ���Ͱ� ���ų� <br/>�±׸� ���Ͱ� ġȯ���� ���� ���ȴ�. 
����Ŭ 10g ���� ���Խ� ����� ������ regexp_replace()�Լ��� �߰� �Ǿ���. */

/*
-- Ư������ ġȯ, ����
WITH TEMP AS (
    SELECT 'Steven King' NM FROM DUAL
)

SELECT A.NM
     , REPLACE(A.NM, 'Steven', 'S.') RE_NM -- S. King
     , REPLACE(A.NM, 'King', '') RE_NM -- Steven
     --, REPLACE(replace(A.NM, chr(13), ''), chr(10), '') --���Ͱ� ����
     --, REPLACE(A.NM, chr(9), '') --�ǹ��� ����
     --, REPLACE(A.NM, '<br/>', chr(13)||chr(10)) --<br/>�±� ���Ͱ����� ġȯ
  FROM TEMP A */


/*
-- ��ȭ��ȣ ������ ����
WITH TEMP AS (
    SELECT '010-4321-6789' TELNO FROM DUAL
)

SELECT A.TELNO
     , REPLACE(A.TELNO, '-', '') RE_TELNO
  FROM TEMP A */
  
  
/* SUBSTR 
WITH EMP AS (
    SELECT '7566' EMPNO, 'JONES' ENAME, '�Ŵ���' JOB FROM DUAL
)

SELECT ENAME COL1 -- JONES
     , SUBSTR(ENAME, 2) COL2 -- ONES
     , SUBSTR(ENAME, 2, 3) COL3 -- ONE
     , SUBSTR(ENAME, -3) COL4 -- NES
     , SUBSTR(ENAME, -3, 2) COL5 -- NE
     , JOB COL6 -- �Ŵ���
     , SUBSTR(JOB, -3, 1) COL7 -- ��
  FROM EMP */
  
  

