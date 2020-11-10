select *
from USER_TABLES;

CREATE SEQUENCE WORKER_seq
    START WITH 1
    INCREMENT BY 1;
    
CREATE TABLE WORKER(
        w_id        NUMBER(5)       CONSTRAINT WORKER_pk PRIMARY KEY,
        w_name      VARCHAR2(20),
        w_pwd       VARCHAR2(20)    DEFAULT '0000',
        w_phone     VARCHAR2(20),
        indate      DATE            DEFAULT SYSDATE,
        use         CHAR(1)         DEFAULT 'Y'
);

CREATE TABLE ADMIN(
        a_id        NUMBER(5)       CONSTRAINT admin_pk PRIMARY KEY,
        a_name      VARCHAR2(20),
        a_pwd       VARCHAR2(20),
        indate      DATE            DEFAULT SYSDATE,
        a_use       CHAR(1)         DEFAULT 'Y'
);



--조회하기
SELECT * FROM worker;

UPDATE worker SET use='N' WHERE w_id=6;
delete worker where w_name='민재홍';

COMMIT;

--drop table worker;
--drop table admin;
--drop sequence WORKER_seq;
--drop sequence admin;