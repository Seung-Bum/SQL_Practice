  SELECT AREA_CD
      ,CD_NM
      ,REGION_AREA
      ,C0||
      ' '||DECODE(C0,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C0,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C0,0,:v_last) -- COUNT로 PROD_ID 새는게 좋을것 같음
      ||LTRIM(DECODE(GR,'00',SUBSTR(R0,1,2),'01',SUBSTR(R0,3,2),SUBSTR(R0,5)),'0') C0 -- LTRIM으로 0 없앰
       ,C1||
       ' '||DECODE(C1,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C1,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C1,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R1,1,2),'01',SUBSTR(R1,3,2),SUBSTR(R1,5)),'0') C1
       ,C2||
       ' '||DECODE(C2,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C2,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C2,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R2,1,2),'01',SUBSTR(R2,3,2),SUBSTR(R2,5)),'0') C2
       ,C3||
       ' '||DECODE(C3,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C3,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C3,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R3,1,2),'01',SUBSTR(R3,3,2),SUBSTR(R3,5)),'0') C3
       ,C4||
       ' '||DECODE(C4,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C4,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C4,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R4,1,2),'01',SUBSTR(R4,3,2),SUBSTR(R4,5)),'0') C4
       ,C5||
       ' '||DECODE(C5,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C5,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C5,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R5,1,2),'01',SUBSTR(R5,3,2),SUBSTR(R5,5)),'0') C5
       ,C6||
       ' '||DECODE(C6,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C6,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C6,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R6,1,2),'01',SUBSTR(R6,3,2),SUBSTR(R6,5)),'0') C6
       ,C7||
       ' '||DECODE(C7,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C7,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C7,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R7,1,2),'01',SUBSTR(R7,3,2),SUBSTR(R7,5)),'0') C7
       ,C8||
       ' '||DECODE(C8,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C8,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C8,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R8,1,2),'01',SUBSTR(R8,3,2),SUBSTR(R8,5)),'0') C8
       ,C9||
       ' '||DECODE(C9,GREATEST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9), '▲')
      ||DECODE(C9,LEAST(C0,C1,C2,C3,C4,C5,C6,C7,C8,C9),'▼')||' *'||DECODE(C9,0,:v_last)
      ||LTRIM(DECODE(GR,'00',SUBSTR(R9,1,2),'01',SUBSTR(R9,3,2),SUBSTR(R9,5)),'0') C9
      ,TOT
FROM (
  SELECT AREA_CD 
        ,DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA),
         '00',MIN(CD_NM),'01',MIN(CD_NM)||'합계','총계') CD_NM
        ,REGION_AREA
        ,NVL(SUM(DECODE(PROD_ID,'100000',SALE_CNT)),0)C0
        ,NVL(SUM(DECODE(PROD_ID,'100001',SALE_CNT)),0)C1
        ,NVL(SUM(DECODE(PROD_ID,'100002',SALE_CNT)),0)C2
        ,NVL(SUM(DECODE(PROD_ID,'100003',SALE_CNT)),0)C3
        ,NVL(SUM(DECODE(PROD_ID,'100004',SALE_CNT)),0)C4
        ,NVL(SUM(DECODE(PROD_ID,'100005',SALE_CNT)),0)C5
        ,NVL(SUM(DECODE(PROD_ID,'100006',SALE_CNT)),0)C6
        ,NVL(SUM(DECODE(PROD_ID,'100007',SALE_CNT)),0)C7
        ,NVL(SUM(DECODE(PROD_ID,'100008',SALE_CNT)),0)C8
        ,NVL(SUM(DECODE(PROD_ID,'100009',SALE_CNT)),0)C9
        ,MIN(DECODE(PROD_ID,'100000',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R0 -- D_RK 03 M_RK 07 T_RK 06
        ,MIN(DECODE(PROD_ID,'100001',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R1
        ,MIN(DECODE(PROD_ID,'100002',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R2
        ,MIN(DECODE(PROD_ID,'100003',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R3
        ,MIN(DECODE(PROD_ID,'100004',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R4
        ,MIN(DECODE(PROD_ID,'100005',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R5
        ,MIN(DECODE(PROD_ID,'100006',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R6
        ,MIN(DECODE(PROD_ID,'100007',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R7
        ,MIN(DECODE(PROD_ID,'100008',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R8
        ,MIN(DECODE(PROD_ID,'100009',LPAD(D_RK,2,'0')||LPAD(M_RK,2,'0')||LPAD(T_RK,2,'0'))) R9
        ,SUM(SALE_CNT) TOT
        ,GROUPING(AREA_CD)||GROUPING(REGION_AREA) GR
  FROM (
    SELECT AREA_CD 
          ,REGION_AREA
          ,PROD_ID
          ,SALE_CNT
          ,DENSE_RANK() OVER(PARTITION BY AREA_CD,REGION_AREA ORDER BY SALE_CNT DESC) D_RK
          ,DENSE_RANK() OVER(PARTITION BY AREA_CD ORDER BY M_CNT DESC) M_RK
          ,DENSE_RANK() OVER(ORDER BY T_CNT DESC) T_RK
    FROM (
      SELECT AREA_CD 
            ,REGION_AREA
            ,PROD_ID
            ,SUM(SALE_CNT) SALE_CNT
            ,SUM(SUM(SALE_CNT)) OVER(PARTITION BY AREA_CD,PROD_ID) M_CNT
            ,SUM(SUM(SALE_CNT)) OVER(PARTITION BY PROD_ID) T_CNT
      FROM SALE_TBL
      GROUP BY AREA_CD 
              ,REGION_AREA
              ,PROD_ID
    )  
  )A , CD_TBL B
WHERE A.AREA_CD = B.CD_ID
AND   LENGTH(B.CD_ID) = 2 
GROUP BY ROLLUP(AREA_CD,REGION_AREA)       
ORDER BY AREA_CD
        ,REGION_AREA        
);
