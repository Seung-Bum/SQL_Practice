SELECT
   ABS(-5) ABS1 --5
  ,ABS(5) ABS2 --5
  ,FLOOR(10.5) FLOOR1 --10
  ,FLOOR(10.4) FLOOR2 -- 10
  ,CEIL(10.1) CEIL_ -- 11
  ,POWER(2, 3) POWER_ --8
  ,SQRT(4) SQRT_ --2
  ,ROUND(10.4) ROUND1 -- 10
  ,ROUND(10.5) ROUND2 -- 11
  ,TRUNC(10.5, -2) TRUNC1 --0
  ,TRUNC(10.5) TRUNC2 -- 10
  ,TRUNC(10.5, -1) TRUNC3 --10
FROM DUAL;