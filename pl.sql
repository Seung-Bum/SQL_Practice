/*
����Ŭ���� �����ϴ� ���α׷��־���,

Procedural Language/SQL �� �����̴�.

�Ϲ� ���α׷��� ������� ��Ҹ� ���� �� ������ �ֱ� ������

�ǹ����� �䱸�Ǵ� �������� ������ ó���� �� �� �� �ִ�.

Ư�� SQL�� �����Ǿ ������ ����� ������ �� �ִ�.

������ Ʈ����� ó���ɷ��̳� ������ȣ, ������ ���� ����,

����ó�� ���, ��ü���� �� �����ͺ��̽��� ���õ� �߿��� ��� ����� �����ϱ� ������

�����ͺ��̽� ������ ó���ϱ⿡ ����ȭ�� ����̴�.

�����, �����, ����ó���η� �����ȴ�.

 

Anonymous PL/SQL Block�� Stored PL/SQL Block�� �ִ�.

 

 

 

 

 

����!
 

 

PL/SQL �� �⺻������ ó���� PL/SQL ������ ����� ȭ�鿡 ������� �ʴ´�.

 

 

 

����

 

> SET SERVEROUTPUT ON;

 

�� �Է��� ȭ�� ��±���� Ȱ��ȭ���Ѿ��Ѵ�.

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