select *
from USER_TABLES;


--결제테이블
CREATE TABLE pay_order(    
    order_id    NUMBER(11) primary key, --주문 아이디
    s_no        NUMBER(5) NOT NULL,     --직원 아이디
    order_date  DATE DEFAULT SYSDATE,   --주문 날짜
    total_price NUMBER(11) NOT NULL,    --총 주문 합계
    order_state CHAR DEFAULT 'Y',       --결제 상태/ Y는 결제 완료, N은 결제취소로 할 예정
    card        CHAR DEFAULT 'N',
    cash        CHAR DEFAULT 'N',
    use_point   NUMBER(11) DEFAULT 0,   --포인트사용금액
    member_id   NUMBER(11),             --회원아이디
    CONSTRAINT FK_order FOREIGN KEY(s_no) REFERENCES staff
    --멤버 아이디 외래키로 지정하면 null 값 처리 안되서 조인으로 할 예정~
);

--결제 상세테이블
CREATE TABLE pay_order_detail(
    orderdetail_id  NUMBER(11) primary key,          --주문상세 아이디
    order_id        NUMBER(11) NOT NULL,             --주문아이디
    menu_id         NUMBER(5) NOT NULL,              --메뉴아이디
    count           NUMBER(11) NOT NULL,             --수량
    CONSTRAINT FK_detail_user FOREIGN KEY(order_id) REFERENCES pay_order,
    CONSTRAINT FK_detail_menu FOREIGN KEY(menu_id) REFERENCES menu
);

CREATE SEQUENCE pay_order_seq
    START WITH 1
    INCREMENT BY 1;
CREATE SEQUENCE pay_order_detail_seq
    START WITH 1
    INCREMENT BY 1;
    
select *
from pay_order;
