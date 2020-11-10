select *
from USER_TABLES;

CREATE SEQUENCE category_seq
    START WITH 1
    INCREMENT BY 1;
CREATE SEQUENCE menu_seq
    START WITH 1
    INCREMENT BY 1;
CREATE TABLE category(
        category_no         NUMBER(5)       CONSTRAINT category_pk PRIMARY KEY,
        category_name       VARCHAR2(50)    CONSTRAINT category_name_uk UNIQUE
);

CREATE TABLE menu(
        menu_id         NUMBER(5)       CONSTRAINT menu_pk          PRIMARY KEY,
        menu_name       VARCHAR2(50)    CONSTRAINT menu_name_uk     UNIQUE NOT NULL,
        price           NUMBER(5)       CONSTRAINT menu_price_nn    NOT NULL,
        category_no     NUMBER(5)       NOT NULL,       
        CONSTRAINT menu_fk  FOREIGN KEY(category_no) REFERENCES category(category_no) ON DELETE CASCADE 
);

--카테고리 추가
----커피종류
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, 'Coffee');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, 'Beverage');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, 'Tea');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, 'Ade');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, 'Shake');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, 'Bakery');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, '테스트1');
INSERT INTO CATEGORY VALUES(category_seq.NEXTVAL, '테스트2');
COMMIT;
--메뉴 추가
--커피번호,이름,가격,카테고리 번호(외래키)
----Coffee
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'아메리카노',5000,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'아이스 카페 모카',5000,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'에스프레소',5500,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'나이트로 쇼콜라 클라우드',5800,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'제주 비자림 콜드브루',5000,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'콜드 브루 몰트',4800,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'콜드 브루 플로트',4800,1);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'돌체 콜드 브루',5800,1);
COMMIT;
----Beverage
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'매직 팝 스플래쉬 피지오',5800,2);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'블랙 티 레모네이드 피지오',5500,2);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'쿨 라임 피지오',5500,2);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'핑크 자몽 피지오',5500,2);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'패션 탱고 티 레모네이드 피지오',5500,2);
COMMIT;
----Tea
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'그린마 애플 블랙티',4800,3);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'라임 패션티',5500,3);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'민트 블렌드 티',4800,3);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'아이스 그랜마 애플 블랙티',5300,3);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'아이스 유자 민트 티',5500,3);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'아이스 제주 유기 녹차',5000,3);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'얼 그레이 티',5000,3);
COMMIT;
----Ade
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'레몬 에이드',3500,4);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'블루레몬 에이드',3500,4);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'자몽에이드',3500,4);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'체리콕',4000,4);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'라임 모히또(무알콜)',4000,4);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'청포도 모히또(무알콜)',4000,4);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'유니콘 매직에이드',4500,4);
COMMIT;
----Shake
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'망고 패션 후르츠 쉐이크',3500,5);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'딸기 요거트 쉐이크',3500,5);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'익스트림 티 쉐이크',3500,5);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'자몽 셔벗 쉐이크',4000,5);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'제주 레드 빈 쉐이크',4000,5);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'피치레몬 쉐이크',4000,5);
COMMIT;
----Bakery
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'쿠키 블루베리 잼 머핀',9800,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'올래미니 크루아상',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'딸기 앙모스',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'소시지 불고기 베이크',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'스모크드 소시지 브레드',8000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'프롯티 오렌지 케이크',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'백년초콜릿 크런치 케이크',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'새코롬 한라봉 케이크',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'화이트 돌체 케이크',9000,6);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'피칸 브라우니',9000,6);
COMMIT;

--조회하기
----메뉴 없는 카테고리도 조회
SELECT *
FROM category left outer join menu
ON category.category_no = menu.category_no
ORDER BY menu.menu_id asc;
----메뉴 있는 카테고리만 조회
SELECT *
FROM category right outer join menu
ON category.category_no = menu.category_no
ORDER BY category.category_no asc;

SELECT * FROM category;
SELECT * FROM category outer join menu
ON outer.category_no = menu.category_no
WHERE outer.category_no=1;

SELECT * FROM menu;
SELECT * FROM category;
SELECT category_no, category_name FROM category;

DELETE category WHERE category_no=21;
COMMIT;

drop table category;
drop table menu;
drop table category cascade constraints;
drop sequence category_seq;
drop sequence menu_seq;