-- ���Խ� �Լ� ����
SELECT VAR_STR ORG 
      ,REGEXP_SUBSTR( 'ȫ�浿,��浿,�ڱ浿,1233,456'||',', '[^\,]+', 1, SEQ )
      -- ���Խ����� �޸��� �ƴ� ���ڸ� �޸��� ���ö����� ã��
FROM (
	SELECT VAR_STR, NO SEQ -- ���ڿ� ���� ��ŭ �����  SEQ 5����� 
	FROM (
	    SELECT 'ȫ�浿,��浿,�ڱ浿,1233,456' VAR_STR,
	    REGEXP_COUNT('ȫ�浿,��浿,�ڱ浿,1233,456', ',') +1 CNT -- ,�� ���� +1 = ���ڿ� ����
	    FROM DUAL
	) A, COPY_T B
	WHERE NO <= CNT
)

