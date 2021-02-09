CREATE TABLE members(
	id varchar2(30),
	pw varchar2(20),
	name varchar2(50),
	point NUMBER,
	address varchar2(100),
	regdte DATE,
	isAble varchar2(1)
);
INSERT INTO members VALUES ('himan','7777','홍길동',3000,'서울 신림동','2021/01/01','0');
INSERT INTO members VALUES ('higirl','1234','김영희',10000,'인천 미추홀구','2020/05/25','1');
INSERT INTO members VALUES ('mmgg','5678','마길동',0,'경기 성남시','2021/02/09','0');
SELECT * FROM members
WHERE id LIKE '%'||'h'||'%'
AND name LIKE '%'||'길동'||'%';