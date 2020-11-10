select *
from USER_TABLES;

--#회원구역
--회원 테이블
CREATE TABLE member(    
    m_id    NUMBER(5) PRIMARY KEY, --회원 아이디
    m_name  VARCHAR2(10) NOT NULL, --회원 이름
    m_phone VARCHAR2(20) NOT NULL, --회원 연락처
    point   NUMBER(5) DEFAULT '0', --회원포인트
    total   NUMBER(5) DEFAULT '0', --회원 총 결제내역
    indate  DATE DEFAULT SYSDATE,  --회원 등록 날짜
    use CHAR(1) DEFAULT 'N'        --회원탈퇴
);

commit;
DESC member;
SELECT *
FROM member;

--회원 번호 부여 하기 위한 시퀀스
CREATE SEQUENCE member_seq START WITH 1;
COMMIT;
