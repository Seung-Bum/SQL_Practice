/* CREATE TABLE EXAM_RSLT_1
( 
    NAME        VARCHAR2(10)	NOT NULL,
    CLASS       VARCHAR2(10),
    GRADE       NUMBER(1),
    KOR         NUMBER(3),
    ENG         NUMBER(3),
    MAT         NUMBER(3) 
); 

insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('홍길동', '달림반', 2, 10, 30, 50);
insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('이정우', '달림반', 1, 80, 90, 80);
insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('김진우', '별림반', 2, 90, 80, 90);
insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('송해', '샛별반', 1, 80, 100, 70);
insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('신성남', '별림반', 2, 80, 100, 90);
insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('강감찬', '달림반', 3, 90, 80, 80);
insert into EXAM_RSLT_1(NAME, CLASS, GRADE, KOR, ENG, MAT) values('이순신', '별림반', 4, 90, 80, 80); */

-- 테이블 조회
--SELECT * FROM EXAM_RSLT_1;