/*
# 정규화
1. 데이터베이스 설계 시, 정규화를 통해서 데이터의 중복과 이상현상을 사전에 방지할 수 있다.
2. 정규화의 주요 개념
	1) 이상현상
	2) 함수 종속성
3. 정규화 과정
	1) 제1 정규화
	2) 제2 정규화
	3) 제3 정규화
	-------------
	4) BCNF 정규화
	5) 제4 정규화
	6) 제5정규화

# 이상현상
1. 잘못된 데이터베이스 설계는 이상현상을 발생시키며, 데이터의 중복이 일어나거나 잘못된 update 및 입력이 될 수 있다.
2. 종류
	1) 삽입이상: 데이터 입력 시 특정 속성에 해당하는 값이 null로 입력되어 데이터의 낭비를 초래할 수 있다.
	2) 삭제이상: 데이터 row 단위 삭제 시 저장된 다른 정보까지 연쇄적으로 삭제되어,
			   추후에 해당 정보를 확인할 수 없는 상황이 발생한다.
	3) 수정이상: 수정시 중복된 데이터의 일부만 수정되어 데이터의 불일치 문제가 발생할 수 있다.
 */
-- 이상 현상 예제 확인
CREATE TABLE Summer(
	sid NUMBER,
	class varchar2(20),
	price number
);

INSERT INTO Summer VALUES (100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
SELECT * FROM summer;
-- sql을 작성해보세요
-- 계절학기를 듣는 학생의 학번과 수강하는 과목?
SELECT sid, class FROM summer;
-- C강좌의 수강료는?
SELECT class, price FROM summer WHERE class = 'C';
-- 수강료가 가장 비싼 과목?
SELECT * FROM summer
WHERE price = (SELECT max(price) FROM summer);
-- 계절학기를 듣는 학생 수와 수강료 총합은?
SELECT count(*) "학생 수", sum(price) "수강료 총계"
FROM summer;
-- # 삭제 이상의 예
-- 1. 200번 학생의 계절학기 수강신청을 취소처리 sql 작성
DELETE FROM summer WHERE sid=200;
-- 2. C강좌의 수강료 조회..?
--	  200번 학생을 삭제하는 순간 C강좌 정보와 수강료 정보까지 삭제됨 >> 삭제이상
--	  정규화 과정은 이와 같이 특정 정보를 삭제하더라도 연관된 다른 정보는 다시 볼 수 있게 하는 것을 말한다.
--	  즉, 삭제 이상을 보완한다.
--	  실습을 위한 재 입력
INSERT INTO summer VALUES (200,'C',10000);
-- # 삽입 이상의 예
-- 1. 계절학기에 새로운 자바 강좌를 수강료 25000으로 개설하세요.
INSERT INTO summer VALUES (NULL,'Java',25000);
-- 수강인원 확인
SELECT count(*) "학생 수", sum(price) "수강료 총계"
FROM summer;
-- >> row단위의 튜플은 4이지만, 수강인원은 sid를 기준으로 해야한다. (하위 2개 중 선택해서 해야 함)
SELECT count(sid) "학생 수", sum(price) "수강료 총계"
FROM summer;
SELECT count(*) "학생 수", sum(price) "수강료 총계"
FROM summer WHERE sid IS NOT NULL;
-- sid가 수강인원이 없을 때는 null로 비워져 있고, 통계치나 자료를 활용하고자 할 때 문제가 발생 >> 삽입이상
-- 정규화 과정을 거치면 이와 같이 필요없는 null 데이터가 처리되는 것을 방지할 수 있다.
-- 입력 이상은 학생 정보나 과목 정보를 입력할 때, 매핑되지 않는 정보는 null로 처리되어 있는 현상

-- 다음 예제를 위해 250 FORTRAN 15000을 입력
INSERT INTO summer VALUES (250, 'FORTRAN', 15000);
SELECT * FROM summer;
-- # 수정 이상의 예
-- 1) sid가 100인 사람이 수강하는 FORTRAN 강좌 수강료를 15000으로 수정
UPDATE summer
	SET price = 15000
WHERE sid=100;
-- 특정한 사람의 수강료를 변경했는데, 과목이 같지만 다른 사람의 수강료는 수정이 되지 못한 것을 확인할 수 있다.
-- 특정한 사람이 실수를 하더라도 과목의 수강료를 수정하면 다음부터 해당 수강료가 다 수정되게 수정오류를 정규식에서는 방지할 수 있다.
-- # 정규화
-- 1. 다음 단계 처리를 위해 원상복구
UPDATE summer
	SET price = 20000
	WHERE class='FORTRAN' AND sid=100;
SELECT * FROM SUMMER;
-- 2. 테이블 분리로 과목별 가격이 있는 테이블과 학번 별로 수강클래스 분리하여 구성
--	1) 계절학기 강좌 수강료 확인
SELECT class, price FROM summer;
--	중복내용 distinct
SELECT DISTINCT class, price FROM summer ORDER BY class;
CREATE TABLE summerprice AS SELECT DISTINCT class, price FROM summer ORDER BY class;
SELECT * FROM summerprice;
--	2) 학번별 수강클래스 테이블 생성
SELECT sid, class FROM summer WHERE sid IS NOT NULL ORDER BY sid;
CREATE TABLE summerenroll AS SELECT sid, class FROM summer WHERE sid IS NOT NULL ORDER BY sid;
SELECT * FROM summerenroll;


-- SQL을 작성해보세요. 새로 만든 summerprice, summerenroll을 통해 작성
-- 계절학기를 듣는 학생의 학번과 수강하는 과목
SELECT sid, class FROM summerenroll;
-- C강좌의 수강료
SELECT price FROM summerprice WHERE class='C';
-- 수강료가 가장 비싼 과목
SELECT class FROM summerprice WHERE price = (SELECT max(price) FROM summerprice);
-- 계절학기를 듣는 학생 수와 수강료 총합은?
SELECT  count(*), sum(price) FROM summerprice a, summerenroll b
WHERE a.class = b.class;

/*
# 정규화 처리 후 이상현상 확인
1.   삭제 이상 확인
   200번이 계절학기를 수강 취소했을 때 해당 과목의 정보를 확인할 수 있는지
*/
SELECT * FROM summerenroll
WHERE sid=200;
DELETE FROM summerenroll WHERE sid=200;
SELECT * FROM summerenroll; -- 수강신청 항목에는 없어짐
SELECT * FROM summerprice; -- 수강가능항목에는 C가 있음
-- 2. 삽입이상의 정규화를 통한 정상 확인
--	  계절학기 과목을 등록하더라도, 수강신청자에 영향없게 처리
INSERT INTO summerprice values('JSP', 23000);
SELECT * FROM summerenroll;
SELECT * FROM summerprice;
--	  테이블 분리로 정상적인 입력이 가능한 것을 알 수 있다.
-- 3. 수정이상의 정규화를 통한 정상 확인
-- fortran강좌의 수강료를 20000에서 15000으로 수정하고, 신청자들의 수강료를 확인해보세요.
UPDATE SUMMERPRICE 
	SET price = 15000
WHERE class = 'FORTRAN';
SELECT b.*, a.* FROM summerprice a, summerenroll b WHERE a.class = b.class;


-- ex) 전체 테이블 생성, 데이터 등록, 수정, 삭제이상 확인 >> 2개 테이블로 분리 이상현상 보완 확인
CREATE TABLE stud_reg(
	no NUMBER,
	name varchar2(50),
	subject varchar2(50),
	address varchar2(100),
	course varchar2(100),
	room varchar2(100)
);
INSERT INTO stud_reg VALUES (501,'박지성','컴퓨터과','영국 맨체스타','데이터베이스','공학관 110');
INSERT INTO stud_reg VALUES (401,'김연아','체육학과','대한민국 서울','데이터베이스','공학관 110');
INSERT INTO stud_reg VALUES (402,'장미란','체육학과','대한민국 강원도','스포츠경영학','체육관 103');
INSERT INTO stud_reg VALUES (502,'추신수','컴퓨터과','미국 클리블랜드','자료구조','공학관 111');
INSERT INTO stud_reg VALUES (501,'박지성','컴퓨터과','영국 맨체스타','자료구조','공학관 111');
INSERT INTO stud_reg VALUES (401,'김연아','체육학과','대한민국 서울','스포츠경영학','체육관 103');
SELECT * FROM stud_reg;

CREATE TABLE stud_reg2 AS SELECT * FROM stud_reg;
-- 1. 등록 이상: 학생만 등록을 하는데 수강과목과 강의실은 null이 되어 있음
INSERT INTO stud_reg(NO, name, subject, address) VALUES (503,'손흥민','체육학과','영국 런던');
SELECT * FROM stud_reg;
-- 2. 수정 이상: 데이터베이스 공학과 정보가 다 변경되지 않음
UPDATE stud_reg
	SET room='공학과 109'
WHERE NO=401 AND course = '데이터베이스';
SELECT * FROM stud_reg;
-- 3. 삭제이상: 502, 502 수강 자료구조 정보가 없어짐
--		학번의 특정 정보를 삭제하든지, course로 조건을 삭제하면 연결된 모든 정보가 삭제되어 삭제이상 발생
DELETE FROM stud_reg WHERE NO IN (501, 502);
SELECT * FROM stud_reg;
-- 학생테이블
SELECT * FROM stud_reg2;
SELECT DISTINCT NO, name, subject, address FROM stud_reg2 ORDER BY NO;
CREATE TABLE stud AS SELECT DISTINCT NO, name, subject, address FROM stud_reg2 ORDER BY NO;
SELECT * FROM stud;
-- 강의테이블, cno는 강의테이블에 강의 번호 입력하는 것(key값)
CREATE TABLE course
AS SELECT 100 cno, a.* 
from(SELECT DISTINCT course, room FROM stud_reg2 ORDER BY course) a;
SELECT * FROM course; -- 후에 테이블들어가서 cno 수정(100, 101, 102)
-- 수강테이블(강의테이블의 key값을 맵핑)
CREATE TABLE course_reg(
	NO NUMBER,
	cno NUMBER
);
INSERT INTO course_reg VALUES (501,100);
INSERT INTO course_reg VALUES (401,100);
INSERT INTO course_reg VALUES (402,101);
INSERT INTO course_reg VALUES (502,102);
INSERT INTO course_reg VALUES (501,102);
INSERT INTO course_reg VALUES (401,101);
SELECT * FROM stud; -- 학생정보(no)
SELECT * FROM course; -- 강의정보(cno 추가)
SELECT * FROM course_reg; -- 수강정보(no와 cno 엮음)
-- 학생별 수강 정보 출력
SELECT a.name, b.*, c.course
FROM stud a, course_reg b, course c
WHERE a.NO = b.NO AND b.cno = c.cno;
-- 1. 등록이상: 학생정보, 수강신청정보, 과목정보를 각 테이블에 등록 시 등록 이상이 생기지 않음
-- 2. 수정이상: 학생정보 수정, 수강신청정보 수정, 과목정보를 수정하더라도 수정이상이 생기지 않음
-- 3. 삭제이상: 수강신청 정보가 삭제되더라도 학생정보나 과목정보에 영향을 미치지 않음.

















