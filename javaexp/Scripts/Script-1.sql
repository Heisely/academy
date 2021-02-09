CREATE TABLE members(
	id varchar2(30),
	pw varchar2(20),
	name varchar2(50),
	point NUMBER,
	address varchar(100),
	regdte DATE,
	isAble varchar2(1)
);
INSERT INTO members values('himan','7777','홍길동',3000,'서울 신림동','2021/01/01','0');
INSERT INTO members values('higirl','1234','김영희',10000,'인천 미추홀구','2021/02/01','1');
INSERT INTO members values('mmgg','5678','마길동',1100,'경기 의정부시',sysdate,'0');
SELECT * FROM members;
/*
 private String id;
 private String pw;
 private String name;
 private int point;
 private String address;
 private Date regdte;
 private boolean isAble; 
 */