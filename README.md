# SQL_Practice

CREATE TABLE 기본문법
(
  컬럼명 데이터타입 PRIMARY KEY, -- 기본키 설정
  컬럼명 데이터타입 FOREIGN KEY REFERENCES 참조테이블(기본키), -- 외래키설정
  컬럼명 데이터타입 UNIQUE,
  컬럼명 데이터타입 NOT NULL,
  컬럼명 데이터타입 CHECK(조건식), -- 제약조건 설정
  컬럼명 데이터타입 DEFAULT 값
)

CREATE TABLE 사원
(
  사번 VARCHAR(10) PRIMARY KEY,
  업무 VARCHAR(20) FOREIGN KEY REFERENCES 부서(부서코드),
  이름 VARCHAR(10) UNIQUE,
  생년월일 CHAR(8) NOT NULL,
  셩별 CHAR(1) CHECK(성별 = 'M' OR 성별 = 'F'),
  입사일 DATE DEFAULT SYSDATE -- SYSDATE는 현재시간/날짜
)

