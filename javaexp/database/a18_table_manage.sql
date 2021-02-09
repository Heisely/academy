/*
# 테이블 관리
1. 테이블의 생성과 구조의 변경(추가, 수정)
2. 테이블 생성
	1) 테이블에 대한 구조를 정의하고, 테이블을 저장하기 위한 공간을 할당하는 과정
	2) 테이블에 대한 구조 정의는 테이블을 구성하는 컬럼의 데이터 유형과 제약조건을 정의
3. 테이블 생성 기본 형식
	CREATE 옵션1 TABLE 옵션2.테이블명(
		컬럼명 데이터유형 옵션3 옵션4,
		컬럼명 데이터유형 옵션3 옵션4,
		...
		컬럼명 데이터유형 옵션3 옵션4
	);
	옵션1: global temporary - 임시테이블을 만들 때 사용. 해당 세션(클라이언트)에만 보임
	옵션2: 스키마(사용자계정) - 다른 계정에서 호출해서 사용
			ex) system 계정으로 접속해서 scott계정에서 사용할 테이블을 만들 때, 반드시 스키마를 선언해야 한다.
	옵션3: default 데이터 선언 - 데이터를 입력하지 않을 때 null값 대신에 들어가는 데이터를 선언할 수 있음
	옵션4: 제약조건 - primary key, not null 등 무결성 제약조건을 선언할 수 있음
 */
-- 기본 테이블 생성
CREATE TABLE address(
	id number(3),
	name varchar2(50),
	addr varchar2(100),
	phone varchar2(30),
	email varchar2(100)
);
-- 현재 등록된 테이블 확인: cmd >> sqlplus >> scott & tiger >> select * from tab; >> desc address;
SELECT * FROM tab;

/*
# default 데이터의 선언
1. 컬럼의 입력 값이 묵시적 null인 경우에 기본값을 지정하기 위해 사용
2. 기본값을 설정하는 데이터:
		리터럴 값, 표현식, sql함수, sysdate, user를 사용할 수 있다.
		특정 컬럼이나 의사컬럼(nextval, currval)은 사용할 수 없다.
 */
CREATE TABLE address2(
	id number(3) DEFAULT 1,
	name varchar2(50) DEFAULT '이름',
	addr varchar2(100) DEFAULT '주소',
	phone varchar2(30) DEFAULT '전화번호',
	email varchar2(100) DEFAULT '이메일'
);
INSERT INTO address2(id) VALUES (null);
-- default는 명시적 null은 제외, 묵시적 null로 입력된 데이터
INSERT INTO address2(name) VALUES (NULL);
SELECT * FROM address2;

-- ex) 묵시적 데이터 선언에 대해 기본 형식을 기술하고
-- 	   회원가입 테이블(id, pass, name, regdte, uptdte)로 만들 때
--	   id, pass는 임시/1111, 익명, 날짜형은 현재날짜로 default로 선언되게 하세요.
-- 기본형식: CREATE 옵션1 TABLE 옵션2.테이블명(
--	 		컬럼명 데이터유형 옵션3 옵션4,
--			컬럼명 데이터유형 옵션3 옵션4,
--			...
--			컬럼명 데이터유형 옵션3 옵션4
--	    	);
/*
>> 내가 짠 코드 
CREATE TABLE signin(
	id varchar2(30) DEFAULT '임시',
	pass number(20) DEFAULT 1111,
	name varchar2(50) DEFAULT '익명',
	regdte DATE DEFAULT sysdate,
	uptdte DATE DEFAULT sysdate
);
INSERT INTO signin(id) VALUES (default);
INSERT INTO signin(id,pass) VALUES ('himan',7777);
SELECT * FROM signin;
 */
-- 풀이
CREATE TABLE MEMBER(
	id varchar2(50) DEFAULT '임시',
	pass varchar2(50) DEFAULT '1111',
	name varchar2(50) DEFAULT '익명',
	regdte DATE DEFAULT sysdate,
	uptdate DATE DEFAULT sysdate
);
INSERT INTO MEMBER (id) VALUES ('himan');
SELECT * FROM MEMBER;

/*
# 서브쿼리를 이용한 테이블 생성
1. CREATE TABLE 명령문에서 서브쿼리 절을 이용해 다른 테이블 구조와 데이터를 복사해 새로운 테이블 생성이 가능
	>> 손 쉽게 테이블 구조와 데이터의 입력을 할 수 있다.
2. 서브쿼리의 출력 결과가 테이블의 초기 데이터로 삽입 가능
3. CREATE TABLE 명령문에 지정한 컬럼 수 및 데이터 타입과 반드시 일치해야 만들어 진다.
	ps) 컬럼명은 다르더라도 컬럼 수와 데이터 타입만 맞으면 입력이 가능
4. 컬럼 이름을 명시하지 않은 경우 서브쿼리 컬럼 이름과 동일
5. 무결성 제약조건은 NOT NULL 조건만 복사.
	>> primary key, foreign key, check 등은 복사가 되지 않음.
	>> ex) 추후에 "alter 테이블 add 컬럼명 제약조건;"(컬럼 추가 제약조건 설정)
				"alter 테이블 modify 컬럼명 제약조건;"(컬럼 속성 변경 제약조건 설정)		   
6. DEFAULT 옵션은 정의한 값 그대로 복사
 */
CREATE TABLE EMP40
AS SELECT * FROM EMP;
SELECT * FROM EMP40;
-- >> 특정 컬럼명을 선택해서 갯수를 맞추면 원하는 컬럼명으로 테이블을 생성할 수 있다.
CREATE TABLE EMP41(NO, NAME, GRADE)
AS SELECT EMPNO, ENAME, JOB FROM EMP;
SELECT * FROM EMP41;

/*
# 테이블의 구조 변경
1. 개요
	ALTER TABLE 명령문을 이용해서 "컬럼의 추가/삭제/타입이나 길이의 재정의" 같은 작업을 할 수 있다.
2. 컬럼의 추가
	ALTER TABLE 테이블명
	ADD 컬럼명 데이터유형 [DEFAULT 디폴트데이터], [제약조건] >> []안의 내용은 옵션
3. 컬럼의 삭제 처리
	ALTER TABEL 테이블명 DROP COLUMN 컬럼명;
4. 컬럼의 변경
	1) 테이블의 컬럼의 타입, 크기, 기본값은 변경이 가능하다.
	2) 기본형식
		alter table 테이블명
		modify 컬럼 데이터유형 옵션1
		옵션1 (default 기본데이터)
	3) 기존 컬럼에 데이터가 없는 경우, 컬럼 타입이나 크기 변경 가능
		ex) 큰 데이터 할당 >> 작은 데이터 할당으로 변경 가능
	4) 기존 컬럼에 데이터가 있는 경우
		- 타입변경 char, varchar2 허용
		- "변경한 컬럼의 크기 >= 저장된 데이터"인 경우에만 가능
			varchar2(10) ==> varchar2(15) 변경가능(O)
			varchar2(5) ==> varchar2(4) 변경불가(X)
		ex) 기존 데이터가 있는 경우에 특정한 데이터 유형으로 변환이 필요한 경우
			1. key(primary key) empno와 함께 특정 입시 컬럼으로 저장
			2. update 테이블명 set 컬럼명 = null;
			3. 컬럼 타입 변경
			4. 해당 타입에 맞는 유형을 to_XXX() 함수를 이용해서 할당 후
			5. 필요없는 임시컬럼을 삭제 처리
			
	5) default 값 변경은 변경 후에 입력되는 데이터부터 적용
 */
-- 2. 컬럼 추가
SELECT * FROM address;
ALTER TABLE address 
ADD birth DATE; -- DATE 타입의 birth 컬럼이 추가됨

-- ex) emp4테이블에 salary(number(7,2))로 급여, departno(number(2,0))로 부서번호를 추가
ALTER TABLE emp41 
ADD salary number(7,2);
ALTER TABLE emp41
ADD departno number(2,0);
SELECT * FROM emp41;

-- ALTER TABLE emp41
-- ADD (salary number, departno number);

-- 3. 컬럼 삭제
ALTER TABLE emp41 DROP COLUMN departno;
SELECT * FROM emp41;

-- 4. 컬럼 변경
-- 데이터 없을 때 변경
CREATE TABLE emp50
AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp50;
/*
 * 초기 emp50 데이터 크기
 (	"EMPNO" NUMBER(4,0), 
	"ENAME" VARCHAR2(10), 
	"JOB" VARCHAR2(9), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER(2,0)	)
 */
ALTER TABLE EMP50 
MODIFY ename varchar2(50); -- refresh 후 ctrl로 상세 내용 확인
ALTER TABLE emp50 
MODIFY job varchar2(50);
-- 데이터 유형을 작게 처리
ALTER TABLE emp50 
MODIFY ename varchar2(10);
ALTER TABLE emp50
MODIFY job varchar2(10);

-- ex) 컬럼의 유형 변경 처리(크기, 유형, default 설정)
ALTER TABLE emp50
MODIFY (ename varchar2(10), job varchar2(20)); -- 두 개 이상 변경 가능
ALTER TABLE emp50
MODIFY job NUMBER; -- 자유롭게 유형 변경 가능
ALTER TABLE EMP50 
MODIFY job NUMBER(3,1);
ALTER TABLE EMP50 
MODIFY job NUMBER(3,1) DEFAULT 1;
ALTER TABLE EMP50 
MODIFY job varchar2(50) DEFAULT '값입력';

-- 데이터가 있는 테이블 컬럼 변경
CREATE TABLE emp51 
AS SELECT * FROM emp;
SELECT * FROM emp51;
/*
 (	"EMPNO" NUMBER(4,0), 
	"ENAME" VARCHAR2(10), 
	"JOB" VARCHAR2(9), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER(2,0)   )
 */
-- 작은 크기 >> 큰 크기로 변경
ALTER TABLE emp51 
MODIFY (ename varchar2(50), job varchar2(50));

-- ex) 다른 유형의 데이터로 변경, 큰 유형에서 작은 유형으로 변경 확인
-- 크게 변경하는 것은 가능
-- 있는 데이터의 범위까지 작게 변경하는 것도 가능
-- 그러나 있는 데이터의 범위보다 작게 변경하는 것은 불가능XXXX
/*
# 데이터가 있는 경우
1. 문자열(char, varchar2)
	- 현재 입력된 데이터의 크기 범위 안에서 작거나 크게 변경이 가능하다.
		입력된 데이터가 varchar2(10) length(컬럼명) 10이하일 때,
		20으로 변경하거나 다시 11로의 변경은 가능하다.
		그러나, 10미만으로 변경 시 에러가 발생.
		>> 주의: 현재 입력된 데이터 크기 범위에서 수정 가능
2. 숫자형
	- 입력된 데이터의 크기와 상관없이 정밀도를 한 번 크게 변경하면 다시 작게 변경이 불가능하다
		>> 주의: 현재 입력된 데이터와 상관 없음
 */
ALTER TABLE emp51
MODIFY deptno NUMBER(1,0); -- error




















