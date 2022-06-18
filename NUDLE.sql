/* 뷰만들기 
CREATE VIEW V_YSB_NUDLE AS */

/* 면요리집 테이블 생성 삭제 
-- nudle
DROP TABLE nudle;

-- nudle
ALTER TABLE nudle
 DROP CONSTRAINT PK_nudle; -- nudle 기본키

-- nudle
CREATE TABLE nudle (
	product_id INTEGER NOT NULL,
	product_category VARCHAR(50) NULL,
	product_name VARCHAR(50) NULL,
	product_price INTEGER NULL
);

-- nudle
ALTER TABLE nudle
	ADD CONSTRAINT PK_nudle -- nudle 기본키
	PRIMARY KEY (
	product_id -- product_id
	);
*/

/* 
INSERT INTO NUDLE 
(
PRODUCT_ID, 
PRODUCT_CATEGORY, 
PRODUCT_NAME,
PRODUCT_PRICE
) 
VALUES 
(
1,
'라멘',
'돈코츠라멘',
8000
);

INSERT INTO NUDLE(PRODUCT_ID, PRODUCT_CATEGORY, PRODUCT_NAME, PRODUCT_PRICE)
SELECT 2, '라멘', '소유라멘', 8000 FROM DUAL
UNION ALL
SELECT 3, '라멘', '시오라멘', 8000 FROM DUAL;
*/






/* 국수 주문 테이블 
-- nudle_order
DROP TABLE nudle_order;

-- nudle_order
ALTER TABLE nudle_order
 DROP CONSTRAINT PK_nudle_order; -- nudle_order 기본키

-- nudle_order
CREATE TABLE nudle_order (
	order_id INTEGER NOT NULL,
	member_id INTEGER NULL,
	order_date DATE NULL,
	total_price INTEGER NULL
);

-- nudle_order
ALTER TABLE nudle_order
	ADD CONSTRAINT PK_nudle_order -- nudle_order 기본키
	PRIMARY KEY (
	order_id -- order_id
	);
	
--데이터 타입 변경 : DATE -> TIMESTAMP
ALTER TABLE NUDLE_ORDER MODIFY ORDER_DATE TIMESTAMP;
*/

/* 주문 데이터 삽입 
INSERT INTO NUDLE_ORDER(ORDER_ID, MEMBER_ID, ORDER_DATE, TOTAL_PRICE)
SELECT 1, 1, '2022-06-14 12:33:33',16000 FROM DUAL
UNION ALL
SELECT 2, 2, '2022-06-14 13:33:33',8000 FROM DUAL;
*/






/* 국수 판매 상세 
-- order_product
DROP TABLE order_product;

-- order_product
ALTER TABLE order_product
	DROP FOREIGN KEY FK_nudle_TO_order_product; -- nudle -> order_product

-- order_product
ALTER TABLE order_product
	DROP FOREIGN KEY FK_nudle_order_TO_order_product; -- nudle_order -> order_product

-- order_product
ALTER TABLE order_product
 DROP CONSTRAINT PK_order_product; -- order_product 기본키

-- order_product
CREATE TABLE order_product (
	order_product_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	LOCATION VARCHAR(20) NULL
);

-- order_product
ALTER TABLE order_product
	ADD CONSTRAINT PK_order_product -- order_product 기본키
	PRIMARY KEY (
	order_product_id -- order_product_id
	);

-- order_product
ALTER TABLE order_product
	ADD CONSTRAINT FK_nudle_TO_order_product -- nudle -> order_product
	FOREIGN KEY (
	product_id -- product_id
	)
	REFERENCES MY_SCHEMA.nudle ( -- nudle
	product_id -- product_id
	);

-- order_product
ALTER TABLE order_product
	ADD CONSTRAINT FK_nudle_order_TO_order_product -- nudle_order -> order_product
	FOREIGN KEY (
	order_id -- order_id
	)
	REFERENCES MY_SCHEMA.nudle_order ( -- nudle_order
	order_id -- order_id
	);
*/

/* 
INSERT INTO order_product(ORDER_PRODUCT_ID, PRODUCT_ID, ORDER_ID, LOCATION)
SELECT 1, 1, 1, '배달' FROM DUAL
UNION ALL
SELECT 2, 2, 1, '배달' FROM DUAL
UNION ALL
SELECT 3, 3, 2, '매장' FROM DUAL;
*/



/* 전체 국수상품 확인 
SELECT *
FROM NUDLE;
*/

/* 국수 판매 상세 
SELECT *
FROM order_product; */

/* 국수 판매 현황 
SELECT *
FROM NUDLE_ORDER;*/

SELECT
     PRODUCT_ID
    ,PRODUCT_CATEGORY
    ,PRODUCT_NAME
    ,PRODUCT_PRICE
FROM
     NUDLE;

