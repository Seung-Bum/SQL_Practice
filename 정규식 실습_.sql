-- 3.2 SQL 함수 실습
SELECT REGEXP_SUBSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,1) COL1 -- 08-021-0090-0012
      ,REGEXP_SUBSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,2) COL2 -- 00-010-000-0011
      ,REGEXP_COUNT('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','[[:digit:]]') COL3 -- 25 모든 숫자 카운트
      ,REGEXP_COUNT('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+') CNT --2 해당 패턴을 카운트함
      ,REGEXP_INSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,1) COL4 -- 4 해당패턴을 첫번째 문자부터 시작해서 첫번째 패턴구성을 찾은 INDEX
      ,REGEXP_INSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,2) COL5 -- 23 해당패턴을 첫번째 문자부터 시작해서 두번째 패턴구성을 찾은 INDEX
      ,LENGTH('KOR08-021-0090-0012ENG') COL6 -- 22
      ,REGEXP_SUBSTR('123','[0-9]+') COL7 -- 123
      ,REGEXP_SUBSTR('ABC평창DE올림픽','[가-힝]+',1,1) ||'-'|| REGEXP_SUBSTR('ABC평창DE올림픽','[가-힝]+',1,2) STR
FROM DUAL
