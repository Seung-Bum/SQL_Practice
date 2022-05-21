/* TRANSLATE 
SELECT TRANSLATE('hello world!!!', 'hw', 'HW')
  FROM dual;
--��� : Hello World!!!


SELECT TRANSLATE('hello world!!!', '!', '?')
  FROM dual;
--��� : hello world???


SELECT TRANSLATE('hello world!!!', 'hw!', 'HW')
  FROM dual;
--��� : Hello World


SELECT TRANSLATE('hello world!!!', 'o', ' ')
  FROM dual;
--��� : hell  w rld!!! */


/* ��ȭ��ȣ ��ȣ ���� 
����ڿ� ���� ��ȭ��ȣ ���ڸ� �����Ͽ� ������� ���ڸ� ��ȯ���ڷ� ��ȯ�ǰ�, 
1:1 ������ �ȵǴ� ����(�߰��� ��ģ)�� ���ŵǴ� ����̴�

WITH TEMP AS (
    SELECT '010-1234-5678' TEL_NO FROM DUAL
)
SELECT TRANSLATE(TEL_NO, '0123456789'||TEL_NO, '0123456789') NUM
              --(����,   ã�ƾߵ� ����,         �ٲܹ���)
              -- ������ ã�ƾߵ� ���ڰ� ���־ �ٲܼ��ڷ� �ٹٲ� �Ŀ� 
              -- �ٲܹ��ڿ� ��ȭ��ȣ���ִ� '-'�� ���� ������ ������
  FROM TEMP
--��� : 01012345678 */


/* ���� ���� ��� 
������ �ִ� ���ڰ� ã�����ڿ� ������ 
������ ���ڰ� �ݺ��ǵ� ������

SELECT TRANSLATE('ab12cd31ef', 'a0123456789', 'a')
  FROM dual
--��� : abcdef */


/* ���� ���� ��� 
SELECT TRANSLATE('ab12cd3ef', '1abcdefg', '1')
  -- ã�� ���ڿ� ���¾ֵ��� ��Ƴ��´�
  FROM dual
--��� : 
*/


/* REPLACE�� TRANCELATE�� ���� 
SELECT REPLACE('SDAF','A','=>') -- SD=>F ������ ���ڿ� ġȯ
      ,TRANSLATE('SDAF','A','=>') -- SD=F ������ ���� ġȯ
FROM DUAL; */



