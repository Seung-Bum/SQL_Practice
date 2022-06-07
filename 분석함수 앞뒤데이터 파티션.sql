/* �м��Լ��� ����� ��/�� ������ ���� ��� 
SELECT NAME
      ,DENSE_RANK() OVER(ORDER BY KOR+ENG+MAT DESC) D_RK
      ,CLASS
      ,KOR
      ,ENG
      ,MAT
      ,KOR+ENG+MAT TOT
      ,KOR+ENG+MAT - LAG(KOR+ENG+MAT) OVER( ORDER BY KOR+ENG+MAT DESC ) AS LAG_CHA
FROM EXAM_RSLT
*/

/* */
SELECT NAME
      ,CLASS
      ,KOR
      ,ENG
      ,MAT
      ,TOT
      ,RANK() OVER(ORDER BY TOT DESC) RK -- ��ü ����
      ,DENSE_RANK() OVER(ORDER BY TOT DESC) D_RK
      ,SUM(TOT) OVER(ORDER BY TOT DESC) SUM_RK
      ,SUM(TOT) OVER(PARTITION BY CLASS ORDER BY TOT) PT_RK
      ,RANK() OVER(PARTITION BY CLASS ORDER BY TOT) PT_PK -- �ݺ��� ��� RANK
      ,TOT - LAG(TOT) OVER(ORDER BY TOT DESC ) AS LAG_CHA -- ������
      ,TOT - LEAD(TOT) OVER(ORDER BY TOT DESC) AS LEAD_CHA -- ������
FROM(
      SELECT NAME
          ,CLASS
          ,KOR KOR
          ,ENG ENG
          ,MAT MAT
          ,KOR + ENG + MAT TOT
      FROM EXAM_RSLT A      
)
