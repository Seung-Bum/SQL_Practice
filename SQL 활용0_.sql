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
      -- MAX(SUM, MIN등 집계함수)는 GROUP BY와 함께 사용해야된다. 왜냐하면 단일 테이블이여야 하기 때문
      ,MAX(SCORE || SUBJECT) SUBJECT
FROM STD_SCORE
GROUP BY NM; -- GROUP BY시에는 컬럼을 따로 생각하자

--5
SELECT NM
      ,SUBSTR(MAX(SCORE || SUBJECT),3) SUBJECT 
      -- 95ENG 이렇게 나오던걸 옆에 SCORE을 없앰
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
      -- 95ENG 이렇게 나오던걸 옆에 SCORE을 없앰
      ,MAX(SCORE) SCORE
FROM STD_SCORE
GROUP BY NM 
ORDER BY NM;
*/

