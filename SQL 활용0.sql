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

--6 다른 해설
/*
- 해설
? 중요한 SUBSTR(MAX(LPAD(SCORE,3,'0')||SUBJECT),4) 과목명
? LPAD(SCORE,3,'0') 를 먼저 보면,
? LPAD(EXPR1, N, EXPR2) : EXPR1을 반환하는데, EXPR2를 (N - EXPR1 길이)만큼 왼쪽을 채워 반환
? 따라서 100일 경우, 3자리이기 때문에 변화가 없으나, 1~99의 경우 앞에 0이 채워지게 된다.
? 그 후 SUBJECT를 ||로 붙인다.
? MAX로 묶으면, GROUP BY로 NM을 묶었기 때문에, 앞의 3자리 숫자를 비교해서 NM에 따라서 최대값인 행이 나오게 된다.
? 또한, 뒤의 SCORE도 MAX로 묶었기 때문에 NM에 따라서 최대값인 행이 나오게 된다.
? 이후, SUBSTR함수로 2번째 컬럼을 잘라낸 결과를 반영한다.
? SUBSTR(CHAR,N1,N2) : CHAR에서 N1 위치에서 시작해 N2 길이만큼을 잘라낸 결과를 반환
? 4번째 자리에서 시작하기 때문에 숫자를 제외한 과목명만이 남게 된다.
*/


