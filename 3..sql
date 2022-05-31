--SELECT COUNT(*)
--FROM SALE_TBL
-- 61248000

-- 영업점에서 특정한 물건을 어느나라로 팔았는지
SELECT AREA_CD
      ,REGION_AREA
      ,PROD_ID
      ,SUM(SALE_CUT)
FROM SALE_TBL;

