-- 제품번호, 물건명, 물건가격, 재고량, 신규등록일, 제조사, 최근입고일, 입고책임자
CREATE TABLE product2(
	pno NUMBER PRIMARY KEY,
	name varchar2(50),
	price NUMBER,
	cnt NUMBER,
	credte DATE,
	company varchar2(100),
	incomedte DATE,
	inmanager varchar2(30)
);
CREATE SEQUENCE prod2_seq
	START WITH 10000
	INCREMENT BY 1
	MINVALUE 10000
	MAXVALUE 99999;
-- 등록 sql
INSERT INTO product2 
VALUES (prod2_seq.nextval, '사과', 2000, 100, sysdate,'좋은농원', sysdate, '홍길동');
-- 조회 sql
SELECT * FROM product2 WHERE name LIKE '%'||''||'%' AND price BETWEEN 0 AND 99999 ORDER BY pno DESC;
-- 상세 sql
SELECT * FROM product2 WHERE pno = 10000;
SELECT * FROM product2;