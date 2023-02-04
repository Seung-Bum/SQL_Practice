# SQL_Practice

CREATE TABLE 기본문법 <br>
( <br>
  컬럼명 데이터타입 PRIMARY KEY, -- 기본키 설정 <br>
  컬럼명 데이터타입 FOREIGN KEY REFERENCES 참조테이블(기본키), -- 외래키설정 <br>
  컬럼명 데이터타입 UNIQUE, <br>
  컬럼명 데이터타입 NOT NULL, <br>
  컬럼명 데이터타입 CHECK(조건식), -- 제약조건 설정 <br>
  컬럼명 데이터타입 DEFAULT 값 <br>
) <br>

CREATE TABLE 사원 <br>
( <br>
  사번 VARCHAR(10) PRIMARY KEY, <br>
  업무 VARCHAR(20) FOREIGN KEY REFERENCES 부서(부서코드), <br>
  이름 VARCHAR(10) UNIQUE, <br>
  생년월일 CHAR(8) NOT NULL, v
  셩별 CHAR(1) CHECK(성별 = 'M' OR 성별 = 'F'), <br>
  입사일 DATE DEFAULT SYSDATE -- SYSDATE는 현재시간/날짜 <br>
) <br>

<br>
ALTER TABLE 기본문법 <br>
ALTER TABLE 테이블명 ADD 컬럼명 데이터타입 [제약조건]; <br>
<br>

ALTER TABLE 사원 ADD 전화번호 VARCHAR(11) UNIQUE; <br>
-> 사원 테이블의 전화번호라는 컬럼에 대해 타입이 VARCHAR(11)이면서 UNIQUE 제약조건을 걸도록 추가 <br>
<br>

ALTER TABLE 사원 MODIFY 이름 VARCHAR(30) NOT NULL; <br>
-> 사원 테이블의 이름이라는 컬럼에 대해 타입이 VARCHAR(30)이면서 NOT NULL 제약조건을 걸도록 수정 <br>
<br>

DROP TABLE 테이블명 [CACADE : RESTRICT]; <br>
-> CASCADE : 참조하는 테이블까지 연쇄적으로 제거하는 옵션 <br>
-> RESTRICT : 다른 테이블이 삭제할 테이블을 참조 중이면 제거하지 않는 옵션 <br>
<br>

DROP TABLE 사원; <br>
-> 사원 테이블 삭제 <br>
<br>

TRUNCATE TABLE 사원; <br>
-> 사원 테이블 내의 모든 데이터를 삭제 <br>

*LENGTH() 함수
LENGTH() 함수는 문자열의 길이를 구해줍니다.

*UPPER(), LOWER() 함수
UPPER()는 문자열을 모두 대문자로 바꿔서 보여주는 함수이고, LOWER()는 문자열을 모두 소문자로 바꿔서 보여주는 함수입니다.

*LPAD(), RPAD() 함수
이 두 함수는 문자열의 왼쪽 또는 오른쪽을 특정 문자열로 채워주는 함수입니다.
LPAD는 LEFT(왼쪽) + PADDING(채우기)의 줄임말, RPAD는 RIGHT(오른쪽) + PADDING(채우기)의 줄임말인데요.
예를 들어 LPAD(age, 10, ’0’)는 age 컬럼의 값을, 왼쪽에 문자 0을 붙여서 총 10자리로 만드는 함수입니다. 


*TRIM(), LTRIM(), RTRIM() 함수
이 함수들은 문자열에 존재하는 공백을 제거하는 함수들입니다.
(1) LTRIM() : 왼쪽 공백 삭제
(2) RTRIM() : 오른쪽 공백 삭제
(3) TRIM() : 왼쪽, 오른쪽 양쪽 다 공백 삭제





