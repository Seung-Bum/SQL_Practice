-- 1
SELECT *
FROM STD_SCORE;


--2
SELECT NM
       ,SCORE
       ,SUBJECT
FROM STD_SCORE;


--3
SELECT NM
      ,MAX(SCORE) SCORE
      ,MAX(SUBJECT) SUBJECT
FROM STD_SCORE
GROUP BY NM;

--4
SELECT NM
      ,MAX(SCORE) SCORE 
      -- MAX(SUM, MIN�� �����Լ�)�� GROUP BY�� �Բ� ����ؾߵȴ�. �ֳ��ϸ� ���� ���̺��̿��� �ϱ� ����
      ,MAX(SCORE || SUBJECT) SUBJECT
FROM STD_SCORE
GROUP BY NM; -- GROUP BY�ÿ��� �÷��� ���� ��������

--5
SELECT NM
      ,SUBSTR(MAX(SCORE || SUBJECT),3) SUBJECT 
      -- 95ENG �̷��� �������� ���� SCORE�� ����
      ,MAX(SCORE) SCORE
FROM STD_SCORE
GROUP BY NM 
ORDER BY NM;


CREATE VIEW V_YSBHW053001 AS 
SELECT *
FROM DUAL
/*
SELECT NM
      ,SUBSTR(MAX(SCORE || SUBJECT),3) SUBJECT                                                                                                                                                                                                                                         
      -- 95ENG �̷��� �������� ���� SCORE�� ����
      ,MAX(SCORE) SCORE
FROM STD_SCORE
GROUP BY NM 
ORDER BY NM;
*/

