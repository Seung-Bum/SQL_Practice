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







