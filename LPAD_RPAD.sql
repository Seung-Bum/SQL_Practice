/* LPAD RPAD 

������ ������ ��� ���ڱ��̸� �Ȱ��� ������ϴ� ��찡 �ִ�. 

LPAD�� ����, RPAD�� �����ʺ��� �ѱ��� ��ŭ ������ ���ڸ� ä���.

ex) 1, 10, 123 -> 00001, 00010, 00123 */

/*
-- �ѱ��� ��� 2BYTE�� ������
SELECT NAME
     , LPAD(NAME, 9)      COL1 --    ȫ�浿
     , LPAD(NAME, 9, ' ') COL2 --    ȫ�浿
     , LPAD(NAME, 9, '0') COL3 -- 000ȫ�浿
     , LPAD(NAME, 9, 'A') COL4 -- AAAȫ�浿
FROM EXAM_RSLT */


/* �ֹε�Ϲ�ȣ �����ϱ� 
SELECT LPAD( :IDEN, INSTR(:IDEN, '-') ) || '*******' IDENTIFITION -- 911222-*******
      ,SUBSTR(:IDEN,1,7) IDENTIFITION -- 911222-
      ,RPAD( SUBSTR(:IDEN,1,7), LENGTH(:IDEN), '*' ) IDENTIFITION -- 911222-*******
      -- ��ü �����߿� �Ǿտ� ���ڸ� ä��� �׵ڿ� ������ ���ڰ� ���Եȴٴ°� �������
FROM DUAL */ 







  
  
  
