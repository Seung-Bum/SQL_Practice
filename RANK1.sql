-- �м��Լ� ROW����� ���� ���� �����ش�.
-- ����Ŭ���� �������� �ʴ� ������ ���̽��� �ִ�.

/*
SELECT RANK() OVER(ORDER BY GRADE DESC) RANK
       ,A.*
FROM EXAM_RSLT A
*/
-- �񱳸� �ؾ��Ѵ� �ڹٿ����� ����� �Լ��� ������ ���´�.
-- �񱳰� �ʿ��� ��� OVER�ȿ� ORDER BY ������ ������Ѵ�.

/*
SELECT RANK() OVER(PARTITION BY CLASS ORDER BY KOR+ENG+MAT DESC, NAME) RANK -- ���ı������� ������ ����� �Ѵ�. �ݿ�����
       ,SUM(KOR) OVER(ORDER BY NAME) SUM-- ������ �ʿ����. ������ �ᵵ �ȴ�. => �����ϸ鼭 �հ踦 ���Ѵ�. RUNNIG SUMMERY ������
       ,A.*
FROM EXAM_RSLT A;
*/


/* ���� ���� �̻��� ���� �ϱ�
SELECT LAG(KOR) OVER(PARTITION BY CLASS ORDER BY KOR+ENG+MAT DESC, NAME NULLS LAST) KSCORE
      ,LEAD(KOR) OVER(ORDER BY KOR+ENG+MAT DESC, NAME NULLS LAST) KSCORE
      ,A.*
FROM EXAM_RSLT A;
*/



/**/
SELECT *
FROM EXAM_RSLT A
UNION ALL
SELECT 'XYZ', CLASS, GRADE, NULL,NULL,NULL
FROM EXAM_RSLT A
;






