/* INSTR SUBSTR */
SELECT VAR_STR ORG,
    SUBSTR(VAR_STR ,1 ,INSTR(VAR_STR,',',1,1)-1) COL1
    -- INSTR(VAR_STR,',',1,1) 문자열의 INDEX 1부터 첫번째 ,의 위치를 찾아줘 // 4
    -- SUBSTR(VAR_STR,1,INSTR(VAR_STR,',',1,1)-1) 문자열의 첫번째부터 INDEX 3까지만 잘라줘 // 홍길동
    
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,1)+1, INSTR(VAR_STR, ',' ,1 ,2) - INSTR(VAR_STR, ',' ,1 ,1) -1) COL2
   --               ,김경동 4+1                  ,김경동, 8                   ,김경동 4                -1 = 3 // 김경동
   
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,2)+1, INSTR(VAR_STR, ',' ,1 ,3) - INSTR(VAR_STR, ',' ,1 ,2) -1) COL3 -- 박길동
   
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,3)+1, INSTR(VAR_STR, ',' ,1 ,4) - INSTR(VAR_STR, ',' ,1 ,3) -1) COL4 -- 1233
   
   ,SUBSTR(VAR_STR, INSTR(VAR_STR ,',' ,1 ,4)+1, INSTR(VAR_STR||',', ',' ,1 ,5) - INSTR(VAR_STR, ',' ,1 ,4) -1) COL5 -- 456
   -- 문자열 끝에 ','을 하나더 붙여줘서 처리함
   
FROM (
SELECT '홍길동,김경동,박길동,1233,456' VAR_STR
FROM DUAL
)
