/*
CREATE OR REPLACE PROCEDURE ���ν��� �̸�
     ( �Ű�������1 [ IN || OUT || INOUT ] ������Ÿ��,
       �Ű�������2 [ IN || OUT || INOUT ] ������Ÿ�� ... )
IS||AS
       ����, ��� �� ���� ( ����� )
BEGIN
       ���� ���� ( ����� )
       EXCEPTION ����   //�ʼ��ƴ�
END ;
*/

--����� �Է¹޾� �޿��� �λ��ϴ� update_sal ���ν���
CREATE OR REPLACE PROCEDURE update_sal
     ( v_empno IN NUMBER )
IS
BEGIN
       UPDATE emp
       SET sal = sal * 1.1
       WHERE empno = v_empno;
END update_sal;

/*
CREATE OR REPLACE FUNCTION �Լ� �̸�
     ( �Ű�������1 �Ű�����1Ÿ��,
       �Ű�������2 �Ű�����2Ÿ�� ... )
RETURN ������Ÿ��
IS||AS
       ����, ��� �� ���� ( ����� )
BEGIN
       ���� ���� ( ����� )
       RETURN ��ȯ��    //�ʼ�
       EXCEPTION ����   //�ʼ��ƴ�
END ;
*/

--��¥�� �Է��ϸ� YYYY-MM-DD ���·� �ٲ��ִ� �Լ�
CREATE OR REPLACE FUNCTION testDate ( date Date )
RETURN VARCHAR2
IS
       changeDate VARCHAR2 ( 20 ) ;
BEGIN 
       changeDate := NULL ;
       changeDate := TO_CHAR ( date, 'YYYY-MM-DD' ) ;
       RETURN changeDate ;
END ;