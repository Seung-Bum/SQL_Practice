SELECT A || ' X ' || B || ' = ' || A * B AS GOOGOODAN
FROM
(SELECT LEVEL + 1 A FROM DUAL CONNECT BY LEVEL < 9) a, -- A: 2�ܺ��� ����
(SELECT LEVEL B FROM DUAL CONNECT BY LEVEL <= 9) b;    -- B: 1~9����
-- �ζ��κ� 