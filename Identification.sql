/* 주민번호 검사로직 
주민번호 1번 2번 3번 4번 5번 6번 - 7번 8번 9번 10번 11번 12번 13번 

합계 = 마지막수를 제외한 12자리의 숫자에 2, 3, 4, 5, 6, 7 8, 9, 2, 3, 4, 5 를 순서대로 곱한수의 합 
1번X2 + 2번X3 + 3번X4 + 4번X5 + 5번X6 + 6번X7 + 7번X8 + 8번X9 + 9번X2 + 10번X3 + 11번X4 + 12번X5

나머지 = 합계를 11로 나눈 나머지

검증코드 = 11 - 나머지(MOD)

검증코드와 주민번호 13번째 자리와 비교
*/

SELECT SUBSTR( TO_CHAR( 11 - MOD( SUM( SUBSTR(REPLACE(:JUMIN,'-'),ROWNUM,1 ) * SUBSTR('23456789234',ROWNUM,1) ), 11) ), -1 ) VF
      --                    MOD로 SUM % 11의 나머지   곱한값을 바로 SUM   - 표시를뺀 주민번호  *  곱해야할 수를 한개씩 꺼냄
      --       마지막으로 TO_CHAR로 결과값 출력
       , SUBSTR(:JUMIN,-1) PRT -- 마지막 자리 숫자 검증코드
FROM DUAL
CONNECT BY LEVEL <= LENGTH(REPLACE(:JUMIN,'-'))





