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

--6 �ٸ� �ؼ�
/*
- �ؼ�
? �߿��� SUBSTR(MAX(LPAD(SCORE,3,'0')||SUBJECT),4) �����
? LPAD(SCORE,3,'0') �� ���� ����,
? LPAD(EXPR1, N, EXPR2) : EXPR1�� ��ȯ�ϴµ�, EXPR2�� (N - EXPR1 ����)��ŭ ������ ä�� ��ȯ
? ���� 100�� ���, 3�ڸ��̱� ������ ��ȭ�� ������, 1~99�� ��� �տ� 0�� ä������ �ȴ�.
? �� �� SUBJECT�� ||�� ���δ�.
? MAX�� ������, GROUP BY�� NM�� ������ ������, ���� 3�ڸ� ���ڸ� ���ؼ� NM�� ���� �ִ밪�� ���� ������ �ȴ�.
? ����, ���� SCORE�� MAX�� ������ ������ NM�� ���� �ִ밪�� ���� ������ �ȴ�.
? ����, SUBSTR�Լ��� 2��° �÷��� �߶� ����� �ݿ��Ѵ�.
? SUBSTR(CHAR,N1,N2) : CHAR���� N1 ��ġ���� ������ N2 ���̸�ŭ�� �߶� ����� ��ȯ
? 4��° �ڸ����� �����ϱ� ������ ���ڸ� ������ ������� ���� �ȴ�.
*/


