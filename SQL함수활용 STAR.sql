/*
SELECT DECODE(SIGN(:V_CNT/2) -ROWNUM),-1,:V_CNT-ROWNUM, ROWNUM) SEQ
      ,LPAD('*', DECODE(SIGN(:V_CNT/2) -ROWNUM),-1,:V_CNT-ROWNUM, ROWNUM), '*') STR
FROM DUAL
CONNECT BY LEVEL < :V_CNT */

/* */
-- ������ NUMBER �ؾ��Ѵ�.
SELECT LPAD('*', DECODE(SIGN(CNT/2 -ROWNUM), -1, CNT-ROWNUM, ROWNUM), '*') STR 
            -- ���ʺ��� ���� ä�� / ������ �ڸ��� / �������� ����
FROM (
SELECT CASE WHEN :V_CNT < 4 THEN 4 -- ���� ������ 4�� ������ ��� �ﰢ���� �ϼ��� �ȵȴ�.
            ELSE DECODE(MOD(:V_CNT,2),0,:V_CNT,:V_CNT -1) -- ¦���� Ȧ���ϰ�� -1 �ؼ� ¦�� ���� CNT�� ����
            END CNT
FROM DUAL
CONNECT BY LEVEL < CASE WHEN :V_CNT < 4 THEN 4
                        ELSE DECODE(MOD(:V_CNT,2),0,:V_CNT,:V_CNT -1) -- ����� �Է°��� 4���� ���� �ʴٸ� ������ ���
                        -- ¦���ϰ�� :V_CNT / Ȧ���� ��� :V_CNT -1
                        END
); -- �� �����

-- 
                   


