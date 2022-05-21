/* LPAD RPAD 

숫자형 문자인 경우 문자길이를 똑같이 맞춰야하는 경우가 있다. 

LPAD는 왼쪽, RPAD는 오른쪽부터 총길이 만큼 지정한 문자를 채운다.

ex) 1, 10, 123 -> 00001, 00010, 00123 */

/*
-- 한글의 경우 2BYTE씩 차지함
SELECT NAME
     , LPAD(NAME, 9)      COL1 --    홍길동
     , LPAD(NAME, 9, ' ') COL2 --    홍길동
     , LPAD(NAME, 9, '0') COL3 -- 000홍길동
     , LPAD(NAME, 9, 'A') COL4 -- AAA홍길동
FROM EXAM_RSLT */


/* 주민등록번호 편집하기 
SELECT LPAD( :IDEN, INSTR(:IDEN, '-') ) || '*******' IDENTIFITION -- 911222-*******
      ,SUBSTR(:IDEN,1,7) IDENTIFITION -- 911222-
      ,RPAD( SUBSTR(:IDEN,1,7), LENGTH(:IDEN), '*' ) IDENTIFITION -- 911222-*******
      -- 전체 길이중에 맨앞에 문자를 채우고 그뒤에 지정한 문자가 삽입된다는걸 기억하자
FROM DUAL */ 







  
  
  
