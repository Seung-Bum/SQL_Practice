--SELECT COUNT(*)
--FROM SALE_TBL
-- 61248000

-- ���������� Ư���� ������ �������� �ȾҴ���
SELECT AREA_CD
      ,REGION_AREA
      ,PROD_ID
      ,SUM(SALE_CUT)
FROM SALE_TBL;

