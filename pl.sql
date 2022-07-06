/*
오라클에서 제공하는 프로그래밍언어로,

Procedural Language/SQL 의 약자이다.

일반 프로그래밍 언어적인 요소를 거의 다 가지고 있기 때문에

실무에서 요구되는 절차적인 데이터 처리를 다 할 수 있다.

특히 SQL과 연동되어서 막강한 기능을 구현할 수 있다.

데이터 트랜잭션 처리능력이나 정보보호, 데이터 대한 보안,

예외처리 기능, 객체지향 등 데이터베이스와 관련된 중요한 모든 기능을 지원하기 때문에

데이터베이스 업무를 처리하기에 최적화된 언어이다.

선언부, 실행부, 예외처리부로 구성된다.

 

Anonymous PL/SQL Block과 Stored PL/SQL Block이 있다.

 

 

 

 

 

주의!
 

 

PL/SQL 은 기본적으로 처리된 PL/SQL 문장의 결과를 화면에 출력하지 않는다.

 

 

 

따라서

 

> SET SERVEROUTPUT ON;

 

을 입력해 화면 출력기능을 활성화시켜야한다.

*/

declare
    v_num int;
    v_sum int:=0;
    
begin
    v_num:=1;
    loop
        v_sum := v_sum+v_num;
        if v_num >= 10 then
            exit;
        end if;
        v_num := v_num+1;
       
    end loop;
    dbms_output.put_line(v_sum);
exception
    when others then
        dbms_output.put_line(sqlcode||sqlerrm);
end;

--show serveroutput; 
--set serveroutput on;