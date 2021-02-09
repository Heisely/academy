SELECT * FROM emp;
/*
 # in 키워드를 이용한 조건 검색 처리
 1. 기본형식
 	where 컬럼명 in (데이터1, 데이터2, 데이터3)
 		- 해당 데이터1, 데이터2, 데이터3에 하나라도 맞으면 데이터를 처리해주는 구문
 2. 같은 컬럼명에서 여러 데이터가 맞을 때 쓰이는 구문으로,
 	where 컬럼명 = 데이터 1
 	   or 컬럼명 = 데이터 2
 	   or 컬럼명 = 데이터 3 을 간편하게 처리하는 구문
 3. subquery를 활용할 때에도 이용된다.
 	where 컬럼명 in (select 컬럼명 from 테이블명)
 */
-- 부서번호가 10이거나 20인 데이터를 조회하는 2가지 방법
SELECT *
FROM EMP
WHERE DEPTNO = 10 OR DEPTNO = 20;
SELECT *
FROM EMP 
WHERE DEPTNO IN (10,20);
-- ex) job이 SALESMAN 이거나 MANAGER인 경우를 IN 구문을 이용해서 출력하기
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER');
-- SUBQUERY를 활용해서 최고 연봉자인 사람의 정보 출력하기
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP);
-- SUBQUERY를 활용해서 부서번호가 30인 사람 중 연봉이 같은 사람 출력하기
SELECT *
FROM EMP
WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 30);

/*
 # like 연산자를 이용한 조건 검색
 1. 컬럼에 저장된 문자열 중, like 연산자에서 지정한 문자 패턴과 부분적으로 일치하면 참이 되어 조건문에서 검색되게 하는 것
 		ex) 사원명이 'A'라는 문자열을 포함하면 조회되게 처리
 	1) 위치 상관없이 검색: 검색컬럼 LIKE '%A%'
 	2) A로 시작하는것 검색: 검색컬럼 LIKE 'A%'
 	3) N로 끝나는것 검색: 검색컬럼 LIKE '%N'
 	4) 자릿수 위치에 맞는 데이터 검색(세번째 자리에 A가 나오는 데이터 검색): 검색컬럼 LIKE '__A%'
 */
SELECT empno, ename FROM emp WHERE ename LIKE '%A%';
SELECT empno, ename FROM emp WHERE ename LIKE 'A%';
SELECT empno, ename FROM emp WHERE ename LIKE '%N';
SELECT empno, ename FROM emp WHERE ename LIKE '__A%';
-- EX1) JOB 컬럼에 MAN이라는 글자가 포함되어 있으면 출력하세요
SELECT * FROM EMP WHERE JOB LIKE '%MAN%';
-- EX2) ename에서 A로 시작하는 글자와 A를 포함하는 글자가 있는 데이터를 구분해서 sql을 2개 작성하세요.
SELECT * FROM emp WHERE ename LIKE 'A%';
SELECT * FROM emp WHERE ename LIKE '%A%';
-- EX3) ename이나 job의 마지막에서 두번째 글자에 E가 들어가는 데이터를 조회하세요.
SELECT * FROM emp WHERE ename LIKE '%E_' OR job LIKE '%E_';
/*
 # 정렬 처리
 1. SQL 명령문에서 검색된 결과는 테이블에 데이터가 입력된 순서대로 출력
 2. 데이터의 출력 순서를 특정 컬럼을 기준으로 오름차순/내림차순으로 정렬하는 경우가 발생
 3. 여러 개의 컬럼에 대해 정렬 순서를 지정해서 처리해야 할 경우가 발생
 	- 입사일은 오름차순, 급여 기준으로는 내림차순..
 4. 기본적인 정렬방법
 	- 문자값은 알파벳 순 / 한글은 가나다 순
 	- 숫자 값은 가장 작은 값으로 먼저 출력
 	- 날짜는 과거 순으로 출력
 5. 기본 형식
 	 SELECT *
 	 FROM 테이블
 	 WHERE ..
 	 ORDER BY 컬럼명 [ASC/DESC]
 	 ASC: DEFAULT 오름차순 정렬
 	 DESC: 역순 정렬
 */
-- 사원 번호를 역순으로 사원번호와 이름을 조회
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;
-- 입사일을 기준으로 최근 입사한 사람부터 출력
SELECT ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;
-- DEPTNO 기준으로 오름차순, JOB 기준 내림차순으로 정렬하여 조회
SELECT ename, deptno, job
FROM emp 
ORDER BY deptno ASC, job DESC;
-- ex1) 관리자번호 mgr 기준, 내림차순으로 정렬
SELECT * FROM emp ORDER BY mgr DESC;
-- ex2) 급여 sal 기준, 오름차순
SELECT * FROM emp ORDER BY sal ASC;
-- ex3) 부서번호 deptno 기준 내림차순, sal 기준 오름차순
SELECT * FROM emp ORDER BY deptno DESC, sal ASC ;


