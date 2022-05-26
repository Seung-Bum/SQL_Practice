/*
SELECT DECODE(SIGN(:V_CNT/2) -ROWNUM),-1,:V_CNT-ROWNUM, ROWNUM) SEQ
      ,LPAD('*', DECODE(SIGN(:V_CNT/2) -ROWNUM),-1,:V_CNT-ROWNUM, ROWNUM), '*') STR
FROM DUAL
CONNECT BY LEVEL < :V_CNT */

/* */
-- 유형을 NUMBER 해야한다.
SELECT LPAD('*', DECODE(SIGN(CNT/2 -ROWNUM), -1, CNT-ROWNUM, ROWNUM), '*') STR 
            -- 왼쪽부터 별로 채움 / 별의총 자리수 / 나머지는 별로
FROM (
SELECT CASE WHEN :V_CNT < 4 THEN 4 -- 별의 갯수가 4개 이하일 경우 삼각형이 완성이 안된다.
            ELSE DECODE(MOD(:V_CNT,2),0,:V_CNT,:V_CNT -1) -- 짝수와 홀수일경우 -1 해서 짝수 만들어서 CNT로 리턴
            END CNT
FROM DUAL
CONNECT BY LEVEL < CASE WHEN :V_CNT < 4 THEN 4
                        ELSE DECODE(MOD(:V_CNT,2),0,:V_CNT,:V_CNT -1) -- 사용자 입력값이 4보다 작지 않다면 왼쪽의 계산
                        -- 짝수일경우 :V_CNT / 홀수일 경우 :V_CNT -1
                        END
); -- 별 생산기

-- 
                   


