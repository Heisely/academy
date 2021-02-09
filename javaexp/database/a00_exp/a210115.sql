--[데이터베이스]
--[하] 1. 데이터베이스 설계에서 entity, entity type, reference를 구분하여 기술하세요.
/*
# 개체(entity)
	1) 현실 세계에서 조직을 운영하는 데 꼭 필요한 사람이나 사물과 같이 구별되는 모든 것
	2) 저장할 가치가 있는 중요 데이터를 가지고 있는 사람이나 사물, 새념, 사건
	3) 다른 개체와 구별되는 이름을 가지고 있고, 각 객체만의 고유한 특성이나 상태, 즉 속성을 하나 이상 가지고 있음
		ex) 서점: 고객, 책
			학교: 학과, 과목, 선생님
	4) 파일 구조의 레코드와 대응된다.

# 개체 타입(entity type)
	1) 객체를 고유의 이름과 속성들로 정의한 것
	2) 파일 구조의 레코드 타입에 대응된다.
	3) 추후 컬럼의 데이터 타입으로 설정된다.

# references: 참조키를 설정할 때 사용됨
 */

--[하] 2. 무결성 제약조건 5가지를 기술하세요.
/*
1. NOT NULL: 입력 필수
2. UNIQUE: 중복성 배제. '유일한 값'으로 존재해야 함
3. PRIMARY KEY: NOT NULL + UNIQUE. 테이블에서 대표되는 컬럼
4. FOREIGN KEY: 참조하는 테이블에서 존재하는 값만 사용 가능(reference: 참조할 테이블과 컬럼 지정)
5. CHECK: 주어진 조건에 해당하는 값만 입력 가능
 */

--[하] 3. 가계부테이블을 만들어 온라인 가계부를 처리할려고 한다.
--		 pk를 비롯한 제약조건이 있는 속성을 도출하고 테이블을 만들고 데이터를 등록해서 select문으로 출력하세요.
/*
CREATE TABLE accountbook(
	accbno NUMBER CONSTRAINT accb_accbno_pk PRIMARY KEY,
	accbDate DATE,
	accbText varchar2(100),
	accbInput NUMBER CONSTRAINT accb_nn_exp_accbInput_nn NOT NULL,
	accbOutput NUMBER CONSTRAINT accb_nn_exp_accbOutput_nn NOT NULL
);
INSERT INTO ACCOUNTBOOK VALUES (1, sysdate, '용돈', 100000, 0);
INSERT INTO ACCOUNTBOOK VALUES (2, sysdate, '사과', 0, 3000);
INSERT INTO ACCOUNTBOOK VALUES (3, sysdate, '바나나', 0, 5000);
INSERT INTO ACCOUNTBOOK VALUES (4, sysdate, '바나나', 0, 5000);
SELECT * FROM ACCOUNTBOOK;

					--- 가계부 ---
[no]	날짜		수입/지출구분	항목		금액		잔액
1		1/18	수입			용돈		100000	100000
2		1/18	지출			차비		  5000	 95000

1. 설계 시 화면에 보이지 않지만 반드시 추가할 컬럼 ex) no(식별자)
2. 화면에 보이지만 데이터로 관리되지 않은 데이터 ex) 잔액/총계/평균값 등 연산처리 결과값
 */
CREATE TABLE mn_book(
	NO number CONSTRAINT mn_book_no_pk PRIMARY KEY,
	idate DATE NOT NULL,
	kind char(6) NOT NULL,
	content char(50),
	val number
);

--[하] 4. primary key와 not null을 함께 사용하는 테이블을 일상에서 생각해서 테이블을 각각의 컬럼에 지정하고 선언해 보세요.
/*
계좌
CREATE TABLE account(
	name varchar2(50) CONSTRAINT acc_nn_exp_name_nn NOT NULL,
	birth DATE CONSTRAINT acc_nn_exp_birth_nn NOT NULL,
	accNum varchar2(100) CONSTRAINT acc_accNum_pk PRIMARY key
);
INSERT INTO ACCOUNT VALUES ('홍길동','1990-06-17','02-1234-567890');
--INSERT INTO ACCOUNT VALUES ('마길동','1996-03-14','02-1234-567890'); -- accNum이 pk이므로 에러
--INSERT INTO ACCOUNT VALUES (null,'1996-03-14','02-1234-567890'); -- name이 null이므로 에러
--INSERT INTO ACCOUNT VALUES ('마길동',NULL,'02-1234-567890'); -- birth가 null이므로 에러
INSERT INTO ACCOUNT VALUES ('마길동',sysdate,'03-1234-567890');
SELECT * FROM account;
 */
/*
학과 관리 프로그램에서 학생의 식별자와 이름, 도서관리 프로그램에서 도서식별자와 도서명 등은 PRIMARY KEY와 NOT NULL로 사용
 */
CREATE TABLE book(
	bk_id NUMBER PRIMARY KEY,
	bname varchar2(50) NOT NULL,
	isuse number(1), -- 대출여부 boolean값은 데이터베이스에 없다. number(1) 0/1로 설정하면 boolean 전환 가능
	loc char(7) -- 위치를 코드값으로 설정, 코드값을 일반적으로 지정된 크기인 char로 설정	
);