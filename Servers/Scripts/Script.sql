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

-- 0209 과제2번 해설 때 생성
CREATE TABLE member5(
	id varchar2(50),
	pass varchar2(30),
	name varchar2(100),
	point NUMBER,
	address varchar2(500),
	regdte DATE,
	auth varchar2(20)
);
SELECT * FROM member5;
INSERT INTO member5 VALUES ('himan','7777','홍길동',1000,'서울 강남',sysdate,'admin');
INSERT INTO member5 VALUES ('higirl','8888','심영희',1500,'대전',sysdate,'user');
INSERT INTO member5 VALUES ('goodman','9999','김철수',2000,'서울 방배',sysdate,'user');
INSERT INTO member5 VALUES ('prettyman','5555','김현석',1200,'인천계양',sysdate,'user');
INSERT INTO member5 VALUES ('whitewolf','6666','마동길',5000,'경기수원',sysdate,'quest');

SELECT * FROM member5
WHERE id LIKE '%'||'a'||'%'
AND name LIKE '%'||'철수'||'%';

CREATE TABLE emp2 AS SELECT * FROM emp;
SELECT * FROM emp2 ORDER BY empno desc;
SELECT * FROM emp21;

SELECT TO_DATE('2021/05/01','YYYY/MM/DD') FROM dual;
INSERT INTO emp2 VALUES (emp21_seq.nextval, '홍길동', '사원', 7780,TO_DATE('2021/05/01','YYYY/MM/DD'), 3500, 100, 10);
INSERT INTO emp2 VALUES (emp21_seq.nextval, '김길동','대리',7800,'2010/12/12',4000.0,100.0,20);



















