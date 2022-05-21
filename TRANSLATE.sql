/* TRANSLATE 
SELECT TRANSLATE('hello world!!!', 'hw', 'HW')
  FROM dual;
--결과 : Hello World!!!


SELECT TRANSLATE('hello world!!!', '!', '?')
  FROM dual;
--결과 : hello world???


SELECT TRANSLATE('hello world!!!', 'hw!', 'HW')
  FROM dual;
--결과 : Hello World


SELECT TRANSLATE('hello world!!!', 'o', ' ')
  FROM dual;
--결과 : hell  w rld!!! */


/* 전화번호 부호 제거 
대상문자에 원본 전화번호 문자를 결합하여 대상문자의 숫자만 변환문자로 변환되고, 
1:1 맵핑이 안되는 문자(추가로 합친)는 제거되는 방법이다

WITH TEMP AS (
    SELECT '010-1234-5678' TEL_NO FROM DUAL
)
SELECT TRANSLATE(TEL_NO, '0123456789'||TEL_NO, '0123456789') NUM
              --(원본,   찾아야될 문자,         바꿀문자)
              -- 원본에 찾아야될 숫자가 다있어서 바꿀숫자로 다바뀜 후에 
              -- 바꿀문자에 전화번호에있는 '-'는 없기 때문에 삭제됨
  FROM TEMP
--결과 : 01012345678 */


/* 숫자 제거 방법 
원본에 있는 숫자가 찾을문자에 있으면 
원본에 숫자가 반복되도 없어짐

SELECT TRANSLATE('ab12cd31ef', 'a0123456789', 'a')
  FROM dual
--결과 : abcdef */


/* 문자 제거 방법 
SELECT TRANSLATE('ab12cd3ef', '1abcdefg', '1')
  -- 찾을 문자에 없는애들은 살아남는다
  FROM dual
--결과 : 
*/


/* REPLACE와 TRANCELATE의 차이 
SELECT REPLACE('SDAF','A','=>') -- SD=>F 지정된 문자열 치환
      ,TRANSLATE('SDAF','A','=>') -- SD=F 지정된 문자 치환
FROM DUAL; */



