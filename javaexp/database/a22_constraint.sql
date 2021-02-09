/*
# foreign key: 한 열과 참조된 테이블의 열 간에 외래 키 관계를 설정하고 실행가능하게 처리
>> ex) 아래와 같이 사원 테이블 부서번호(e.deptno)의 참조키관계를 부서테이블의 부서번호(d.deptno)로 설정하면
	   반드시 부서테이블에 데이터가 있어야 사원테이블에 부서번호 입력이 가능하다.
1. 기본 형식
	컬럼명 데이터유형 constraint 제약조건명 references 참조할테이블(참조할컬럼)
 */
SELECT * FROM emp;
SELECT * FROM dept;
SELECT max(empno) FROM emp;
INSERT INTO emp(empno, deptno) values(7935,50);--dept테이블에 deptno=50인 데이터가 없어서 입력 불가능

-- ex) 학사 관리 시스템의 학생테이블과 학과테이블을 만들고, 학과테이블의 학과번호와 학생테이블의 학과번호를 참조키 관계를 설정해보자
CREATE TABLE studept(
	deptno number(3) PRIMARY KEY,
	dname varchar2(50),
	loc varchar2(50)
);
INSERT INTO studept values(101,'컴퓨터공학과','1호관');
SELECT * FROM studept;
CREATE TABLE STUDENT002(
	studno NUMBER PRIMARY KEY,
	name varchar2(50) NOT NULL,
	deptno number(3) CONSTRAINTS STUDENT002_DEPTNO_FK REFERENCES studept(deptno)
);
INSERT INTO student002 values(1000,'홍길동',101); -- 테이블에 있는 데이터 정상 입력
INSERT INTO student002 values(1001,'신길동',102); -- 참조테이블에 없는 데이터 입력시 에러
SELECT * FROM student002;

/*
# check 제약조건 설정
1. 컬럼에서 허용 가능한 데이터의 범위나 조건을 지정할 때 사용
   ex) 학년은 1~4학년 까지만 입력 / 시험점수의 범위 0~100 / 성별은 남,여만 입력 가능
2. 기본형식
   컬럼명 데이터유형 constraint 제약키명 check(컬럼명 조건문)
   >> check안의 "컬럼명 조건문"은 where 조건문에 들어가는 내용
   ex1) 1, 2, 3, 4 입력 가능
      grade number(1)   constraint stud_grade_ck check(grade in(1, 2, 3, 4))
   ex2) 1~100만 입력 가능
      kor number(3) constraint stud_kor_ck check(kor between 1 and 100)
 */
CREATE TABLE STUDENT03(
   name varchar2(50) NOT NULL,
   grade number(1) CONSTRAINT STUDENT03_GRADE_CK CHECK(grade IN (1,2,3,4))
);
SELECT * FROM ALL_CONSTRAINTS
WHERE owner = 'SCOTT'; -- 제약조건 내용 확인
INSERT INTO STUDENT03 VALUES('홍길동',1);
INSERT INTO STUDENT03 VALUES('김길동',NULL); -- CHECK제약조건에서 NULL은 허용됨
INSERT INTO STUDENT03 VALUES('김길동',5); -- ERROR. 범위 1~4에 포함되지 않음.
SELECT * FROM STUDENT03;

-- ex) no는 primary key, 이름은 not null, 성별은 남/여, 국어/영어/수학 점수는 0~100만 입렵가능한 student04테이블 생성
CREATE TABLE STUDENT04(
   NO NUMBER PRIMARY KEY,
   NAME VARCHAR2(50) NOT NULL,
   GENDER CHAR(3) CONSTRAINTS STUD04_GENDER_CK CHECK(GENDER IN('남','여')),
   KOR NUMBER(3) CONSTRAINTS STUD04_KOR_CK CHECK(KOR BETWEEN 0 AND 100),
   ENG NUMBER(3) CONSTRAINTS STUD04_ENG_CK CHECK(ENG BETWEEN 0 AND 100),
   MATH NUMBER(3) CONSTRAINTS STUD04_MATH_CK CHECK(MATH BETWEEN 0 AND 100)
);
INSERT INTO STUDENT04 VALUES (1,'홍길동','남',90,80,85);
INSERT INTO STUDENT04 VALUES (2,'신길동','남자',70,80,85); -- 한글 3BYTES로 제약조건 에러발생
INSERT INTO STUDENT04 VALUES (3,'오영희','여',90,80,85);
INSERT INTO STUDENT04 VALUES (4,'신영희','여',90,80,101); -- 범위 제약조건 에러발생
SELECT * FROM ALL_CONSTRAINTS WHERE OWNER='SCOTT';
SELECT * FROM STUDENT04;

/*
# 기존 테이블에 무결성 제약조건 추가
1. null을 제외한 무결성 제약조건 추가
   1) 기본 형식
      alter table 테이블명
      add constraint 제약조건이름 제약조건타입 컬럼;
2. null 무결성 제약 조건 추가
      alter table 테이블명
      modify (컬럼명 constraint 제약조건이름 제약조건타입);
 */
CREATE TABLE student05(
   NO NUMBER,
   name varchar2(50),
   kor number(3),
   eng number(3),
   math number(3)
);
-- 고유 키 제약조건 설정
ALTER TABLE STUDENT05 
ADD CONSTRAINT stud05_no_uk unique(no);
-- not null 제약조건 설정
ALTER TABLE STUDENT05 
MODIFY (name CONSTRAINT stud05_name_nn NOT null);
-- 제약조건 설정 확인
SELECT * FROM user_constraints WHERE table_name='STUDENT05';

-- ex) emp55로 복사테이블을 만들고,
--      empno - unique / ename - not null / deptno - dept테이블의 deptno 참조 / sal - 0이상으로 제약조건 추가
CREATE TABLE emp55
AS SELECT * FROM emp;
-- add constraint 제약키명 제약조건(컬럼명);
ALTER TABLE emp55 ADD CONSTRAINT emp55_empno_uk unique(empno);
-- ALTER TABLE emp55 ADD CONSTRAINT emp55_empno_pk PRIMARY KEY (empno); --primary key 설정
-- not null 관련 제약 조건: modify(컬럼명 constraint 제약명 not null)
ALTER TABLE emp55 MODIFY (ename CONSTRAINT emp55_ename_nn NOT NULL);
-- 참조 조건: add constraint 제약키명 foreign key (컬럼명) refereences 테이블명(컬럼명)
ALTER TABLE emp55 ADD CONSTRAINT emp55_deptno_fk FOREIGN KEY (deptno) REFERENCES dept(deptno);
-- check조건: add constraint 제약키명 check (제약조건)
ALTER TABLE emp55 ADD CONSTRAINT emp55_sal_ck CHECK (sal>=0);
-- 제약조건 확인
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'EMP55';

/*
# 무결성 제약조건 삭제
1. 기본 형식
   alter table 테이블명
   drop constraint 제약조건명;
 */
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'EMP55';
SELECT CONSTRAINT_name, status, table_name FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'EMP55';
ALTER TABLE emp55
DROP CONSTRAINT emp55_empno_uk;

/*
# 무결성 제약조건의 비활성화
1. 무결성 제약조건은 한시적으로 설정값에 의해 비활성화/활성화 가능
2. 기본 형식
   >> 비활성화
   alter table 테이블명
   disable constraint 제약조건명;
   >> 활성화
   alter table 테이블명
   enable constraint 제약조건명;
 */
-- 비활성화
ALTER TABLE emp55
disable CONSTRAINT emp55_ename_nn;
-- 활성화
ALTER TABLE emp55
enable CONSTRAINT emp55_ename_nn;
-- 제약조건 확인
SELECT CONSTRAINT_name, status, table_name FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'EMP55';

-- EX) 제약조건이 있는 STUDENT04테이블의 제약조건을 삭제하고 비활성화/활성화 해보기
-- >> 전체 제약조건 확인
SELECT CONSTRAINT_name, status, table_name FROM ALL_CONSTRAINTS WHERE OWNER = 'SCOTT';
-- >> STUDENT04의 제약조건 확인
SELECT CONSTRAINT_name, status, table_name FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'STUDENT04';
-- >> STUDENT04의 제약조건 삭제
ALTER TABLE STUDENT04 
DROP CONSTRAINT SYS_C007027;
ALTER TABLE STUDENT04
DROP CONSTRAINT SYS_C007032;
-- >> STUDENT04의 제약조건 비활성화
ALTER TABLE STUDENT04
DISABLE CONSTRAINT STUD04_GENDER_CK;
ALTER TABLE STUDENT04
DISABLE CONSTRAINT STUD04_MATH_CK;
-- >> 재활성화
ALTER TABLE STUDENT04 
ENABLE CONSTRAINT STUD04_GENDER_CK;


-- SCOTT.sql 복사해서 데이터베이스폴더에 넣기