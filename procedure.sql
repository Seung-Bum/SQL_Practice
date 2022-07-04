/*
CREATE OR REPLACE PROCEDURE 프로시저 이름
     ( 매개변수명1 [ IN || OUT || INOUT ] 데이터타입,
       매개변수명2 [ IN || OUT || INOUT ] 데이터타입 ... )
IS||AS
       변수, 상수 등 선언 ( 선언부 )
BEGIN
       실행 문장 ( 실행부 )
       EXCEPTION 문장   //필수아님
END ;
*/

--사번을 입력받아 급여를 인상하는 update_sal 프로시저
CREATE OR REPLACE PROCEDURE update_sal
     ( v_empno IN NUMBER )
IS
BEGIN
       UPDATE emp
       SET sal = sal * 1.1
       WHERE empno = v_empno;
END update_sal;

/*
CREATE OR REPLACE FUNCTION 함수 이름
     ( 매개변수명1 매개변수1타입,
       매개변수명2 매개변수2타입 ... )
RETURN 데이터타입
IS||AS
       변수, 상수 등 선언 ( 선언부 )
BEGIN
       실행 문장 ( 실행부 )
       RETURN 반환값    //필수
       EXCEPTION 문장   //필수아님
END ;
*/

--날짜를 입력하면 YYYY-MM-DD 형태로 바꿔주는 함수
CREATE OR REPLACE FUNCTION testDate ( date Date )
RETURN VARCHAR2
IS
       changeDate VARCHAR2 ( 20 ) ;
BEGIN 
       changeDate := NULL ;
       changeDate := TO_CHAR ( date, 'YYYY-MM-DD' ) ;
       RETURN changeDate ;
END ;