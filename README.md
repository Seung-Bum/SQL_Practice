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






