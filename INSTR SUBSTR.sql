/* INSTR SUBSTR */
SELECT VAR_STR ORG,
    SUBSTR(VAR_STR ,1 ,INSTR(VAR_STR,',',1,1)-1) COL1
    -- INSTR(VAR_STR,',',1,1) ���ڿ��� INDEX 1���� ù��° ,�� ��ġ�� ã���� // 4
    -- SUBSTR(VAR_STR,1,INSTR(VAR_STR,',',1,1)-1) ���ڿ��� ù��°���� INDEX 3������ �߶��� // ȫ�浿
    
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,1)+1, INSTR(VAR_STR, ',' ,1 ,2) - INSTR(VAR_STR, ',' ,1 ,1) -1) COL2
   --               ,��浿 4+1                  ,��浿, 8                   ,��浿 4                -1 = 3 // ��浿
   
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,2)+1, INSTR(VAR_STR, ',' ,1 ,3) - INSTR(VAR_STR, ',' ,1 ,2) -1) COL3 -- �ڱ浿
   
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,3)+1, INSTR(VAR_STR, ',' ,1 ,4) - INSTR(VAR_STR, ',' ,1 ,3) -1) COL4 -- 1233
   
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,4)+1, INSTR(VAR_STR||',', ',' ,1 ,5) - INSTR(VAR_STR, ',' ,1 ,4) -1) COL5 -- 456
   -- ���ڿ� ���� ','�� �ϳ��� �ٿ��༭ ó����
   
FROM (
SELECT 'ȫ�浿,��浿,�ڱ浿,1233,456' VAR_STR
FROM DUAL
)
