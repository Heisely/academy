--[하] 1. exists, not exists 연산자의 기능과 기본예제를 기술하세요.
/*
 서브쿼리의 결과값이 있는지의 여부를 확인해서 메인쿼리를 실행하는 연산자이다.
 exists: 서브쿼리 데이터가 있을 때 데이터가 나오고, 데이터가 없으면 아무런 데이터가 나오지 않는다
 not exists: 서브쿼리 데이터가 없을 때 데이터가 출력된다.
 */
-- exists 예제 (comm is not null인 데이터가 있으면 emp테이블의 데이터 출력)
SELECT * FROM emp
WHERE exists(SELECT * FROM emp WHERE comm IS NOT null);
-- not exists 예제(deptno=40인 데이터가 없으면 emp테이블의 데이터 출력)
SELECT * FROM emp
WHERE NOT EXISTS(SELECT * FROM emp WHERE deptno=40);

--[하] 2. sql을 통해서 부서번호 40이 없을 때, 부서번호 10인 데이터를 조회하는 처리를 하세요.
SELECT * FROM emp
WHERE deptno=10 and NOT EXISTS (SELECT * FROM emp WHERE deptno=40);

--[하] 3. 데이터의 단일행 입력 구문 2가지 형식과 예제를 통해 처리해 보세요.
/*
 형식: insert into 테이블명(컬럼1, 컬럼2, ...) values(데이터1, 데이터2, ...);
 	  insert into 테이블명 values(테이블 구조 순서에 따른 데이터1, 데이터2, ...);
 */
-- 수업 때 생성한 emp11테이블 이용
INSERT INTO emp11(empno, ename, job, sal, deptno) values(5005,'민영환','부사장',4567,20);
INSERT INTO emp11 values(5006,'김철수','인턴',5001,'2021-01-01',2800,NULL,30);
SELECT * FROM emp11;

--[하] 4. 복사테이블 emp15(구조만 복사)를 만들고, ename/job의 크기를 50으로 변경하고,
--		 데이터를 입력처리(전체데이터입력, 부분컬럼입력) 하세요
CREATE TABLE emp15
AS SELECT * FROM emp WHERE 1=0;
INSERT INTO emp15 values(1001,'이영희','인턴',1004,'2021-01-07',2500,NULL,10);
INSERT INTO emp15(ename, job, sal, comm) VALUES('마동석','회장','6700',500);
SELECT * FROM emp15;

--[하] 5. 다중행 insert 형식을 기술하세요.
/*
 insert all|first: all(전체), first(첫번째 데이터)
 into 테이블1(컬럼명1, 컬럼명2, ...) values (컬럼명1, 컬럼명2, ...)
 into 테이블2(컬럼명1, 컬럼명2, ...) values (컬럼명1, 컬럼명2, ...)
 into 테이블3(컬럼명1, 컬럼명2, ...) values (컬럼명1, 컬럼명2, ...)
 서브쿼리;
 */

--[중] 6. 부서별 최고급여의 구조와 데이터를 가진 복사 테이블 emp20을 만들고,
--		 emp20테이블에 subquery를 활용하여, 부서번호 10 데이터를 입력하세요.
SELECT max(sal), deptno
FROM emp
GROUP BY deptno;
SELECT * FROM emp;
--[하] 7. emp21,emp22,emp23 테이블을 만들고, 급여 2000인 이상의 데이터를 각 테이블에 입력 처리하세요.
CREATE TABLE emp21 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp22 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp23 AS SELECT * FROM emp WHERE 1=0;
INSERT ALL
INTO emp21(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES (empno,ename,job,mgr,hiredate,sal,comm,deptno)
INTO emp22(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES (empno,ename,job,mgr,hiredate,sal,comm,deptno)
INTO emp23(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES (empno,ename,job,mgr,hiredate,sal,comm,deptno)
SELECT * FROM emp WHERE sal>=2000;

--[하] 8. 수정문의 기본형식을 기술하세요.
/*
 update 테이블명
 set 컬럼1 = 변경할 데이터,
 	 컬럼2 = 변경할 데이터,
 	 컬럼3 = 변경할 데이터
 where 조건문
 */

--[중] 9. emp10 테이블에서 입사일이 2000년도 이전 데이터에 대하여, 
--입사년도는 + 10(년)을 더하고, 급여는 +1000을 더하여 수정 처리하세요.
SELECT * FROM emp;
UPDATE emp10
	SET hiredate = hiredate+3650,
		sal = sal+1000
	WHERE to_char(hiredate,'YYYY')<'2000';
SELECT * FROM emp10;