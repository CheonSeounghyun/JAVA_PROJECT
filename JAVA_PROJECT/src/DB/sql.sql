
-- 기존 테이블 삭제 

DROP TABLE BOOK;
DROP TABLE USER_INFO;
DROP TABLE TRAIN;
DROP TABLE BUS;
DROP TABLE LOCATION_INFO;


-- create table
CREATE TABLE USER_INFO(
                USER_ID VARCHAR2(20) PRIMARY KEY,
                USER_PW VARCHAR2(20) NOT NULL,
                USER_NAME VARCHAR2(20),
                USER_BIRTH VARCHAR2(20),
                USER_PHONE VARCHAR2(20),
                USER_EMAIL VARCHAR2(20));
CREATE TABLE LOCATION_INFO(
                LOC_NUM VARCHAR2(20) PRIMARY KEY,
                LOC_NAME VARCHAR2(20) NOT NULL);
CREATE TABLE TRAIN(
                TRAIN_SERV_NUM VARCHAR2(20) PRIMARY KEY, 
                TRAIN_NUM VARCHAR2(20),
                TRAIN_DEP_LOC VARCHAR2(20),
                TRAIN_DEST_LOC VARCHAR2(20),
                TRAIN_DEP_TIME DATE,
                TRAIN_ARR_TIME DATE,
                TRAIN_GRADE VARCHAR2(20),
                TRAIN_SEAT NUMBER(10),
                TRAIN_FARE NUMBER(10));
CREATE TABLE BUS(
                BUS_SERV_NUM VARCHAR2(20) PRIMARY KEY,
                BUS_NUM VARCHAR2(20),
                BUS_DEP_LOC VARCHAR2(20),
                BUS_DEST_LOC VARCHAR2(20),
                BUS_DEP_TIME DATE,
                BUS_ARR_TIME DATE,
                BUS_GRADE VARCHAR2(20),
                BUS_SEAT NUMBER(10),
                BUS_FARE NUMBER(10));
CREATE TABLE BOOK(
                BOOK_NUM VARCHAR2(20) PRIMARY KEY,
                USER_ID VARCHAR2(20),
                DEP_LOC_NUM VARCHAR2(20),
                ARR_LOC_NUM VARCHAR2(20),
                SERV_NUM VARCHAR2(20),
                DEP_TIME DATE,
                ARR_TIME DATE,
                BOOK_NOM NUMBER(20),
                BOOK_DATE DATE,
                CONSTRAINT book_userid_fk FOREIGN KEY ("USER_ID")
                REFERENCES USER_INFO("USER_ID"),
                CONSTRAINT book_deplocbum_fk FOREIGN KEY ("DEP_LOC_NUM")
                REFERENCES LOCATION_INFO ("LOC_NUM"),
                CONSTRAINT book_arrlocnum_fk FOREIGN KEY ("ARR_LOC_NUM")
                REFERENCES LOCATION_INFO ("LOC_NUM"),
                CONSTRAINT book_busservnum_fk FOREIGN KEY ("SERV_NUM")
                REFERENCES BUS ("BUS_SERV_NUM"),
                CONSTRAINT book_trainservnum_fk FOREIGN KEY ("SERV_NUM")
                REFERENCES TRAIN ("TRAIN_SERV_NUM"));

-- insert

-- 유저 테이블 더미 데이터 삽입 
INSERT INTO USER_INFO
VALUES('TEST1','1111','김철수','1995/04/17','010-1111-1111','TEST1@TEST.MAIL');
INSERT INTO USER_INFO
VALUES('TEST2','1111','홍길동','1995/12/12','010-2222-2222','TEST2@TEST.MAIL');
INSERT INTO USER_INFO
VALUES('TEST3','1111','김예시','1995/12/17','010-3333-3333','TEST3@TEST.MAIL');

-- 지역 테이블 삽입
INSERT INTO LOCATION_INFO
VALUES('L1','서울');
INSERT INTO LOCATION_INFO
VALUES('L2','부산');
INSERT INTO LOCATION_INFO
VALUES('L3','대구');
INSERT INTO LOCATION_INFO
VALUES('L4','인천');
INSERT INTO LOCATION_INFO
VALUES('L5','광주');
INSERT INTO LOCATION_INFO
VALUES('L6','대전');
INSERT INTO LOCATION_INFO
VALUES('L7','울산');

-- 기차 운행 정보 테이블 
-- 서울->부산
INSERT INTO TRAIN
VALUES('Ts1','t1','L1','L2',TO_DATE('2020/01/01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),
                            TO_DATE('2020/01/01 15:30:00', 'yyyy/mm/dd hh24:mi:ss'),'ITX',1,1);
-- 서울->대구
INSERT INTO TRAIN
VALUES('Ts2','t2','L1','L3',TO_DATE('2020/01/01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),
                            TO_DATE('2020/01/01 13:30:00', 'yyyy/mm/dd hh24:mi:ss'),'ITX',1,1);
-- 서울->광주
INSERT INTO TRAIN
VALUES('Ts3','t3','L1','L4',TO_DATE('2020/01/01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),
                            TO_DATE('2020/01/01 15:30:00', 'yyyy/mm/dd hh24:mi:ss'),'ITX',1,1);
                            
-- 버스 운행 테이블
-- 서울->광주
INSERT INTO BUS
VALUES('Bs1','B1','L1','L2',TO_DATE('2020/01/01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),
                            TO_DATE('2020/01/01 15:30:00', 'yyyy/mm/dd hh24:mi:ss'),'ITX',1,1);
-- 서울->대구
INSERT INTO BUS
VALUES('Bs2','B2','L1','L3',TO_DATE('2020/01/01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),
                            TO_DATE('2020/01/01 13:30:00', 'yyyy/mm/dd hh24:mi:ss'),'ITX',1,1);
-- 서울->광주
INSERT INTO BUS
VALUES('Bs3','B3','L1','L4',TO_DATE('2020/01/01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'),
                            TO_DATE('2020/01/01 15:30:00', 'yyyy/mm/dd hh24:mi:ss'),'ITX',1,1);
