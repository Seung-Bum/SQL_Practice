-- 정규식 함수 응용
SELECT VAR_STR ORG 
      ,REGEXP_SUBSTR( '홍길동,김경동,박길동,1233,456'||',', '[^\,]+', 1, SEQ )
      -- 정규식으로 콤마가 아닌 문자를 콤마가 나올때까지 찾음
FROM (
	SELECT VAR_STR, NO SEQ -- 문자열 갯수 만큼 출력함  SEQ 5번출력 
	FROM (
	    SELECT '홍길동,김경동,박길동,1233,456' VAR_STR,
	    REGEXP_COUNT('홍길동,김경동,박길동,1233,456', ',') +1 CNT -- ,의 갯수 +1 = 문자열 갯수
	    FROM DUAL
	) A, COPY_T B
	WHERE NO <= CNT
)

