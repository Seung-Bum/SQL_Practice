/*
SELECT COUNT(*)
FROM SALE_TBL
*/
-- 61248000

/**/
SELECT *
FROM SALE_TBL


-- 영업점에서 특정한 물건을 어느나라로 팔았는지 => 내용 기억이 잘안남
/*
SELECT AREA_CD
      ,REGION_AREA
      ,PROD_ID
      ,SUM(SALE_CNT)
FROM SALE_TBL
*/

