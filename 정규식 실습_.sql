-- 3.2 SQL �Լ� �ǽ�
SELECT REGEXP_SUBSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,1) COL1 -- 08-021-0090-0012
      ,REGEXP_SUBSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,2) COL2 -- 00-010-000-0011
      ,REGEXP_COUNT('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','[[:digit:]]') COL3 -- 25 ��� ���� ī��Ʈ
      ,REGEXP_COUNT('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+') CNT --2 �ش� ������ ī��Ʈ��
      ,REGEXP_INSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,1) COL4 -- 4 �ش������� ù��° ���ں��� �����ؼ� ù��° ���ϱ����� ã�� INDEX
      ,REGEXP_INSTR('KOR08-021-0090-0012ENG00-010-000-0011ABCEF','([[:digit:]]+\-)+[[:digit:]]+',1,2) COL5 -- 23 �ش������� ù��° ���ں��� �����ؼ� �ι�° ���ϱ����� ã�� INDEX
      ,LENGTH('KOR08-021-0090-0012ENG') COL6 -- 22
      ,REGEXP_SUBSTR('123','[0-9]+') COL7 -- 123
      ,REGEXP_SUBSTR('ABC��âDE�ø���','[��-��]+',1,1) ||'-'|| REGEXP_SUBSTR('ABC��âDE�ø���','[��-��]+',1,2) STR
FROM DUAL
