/*
 # 서브쿼리
 1. 하나의 sql명령문의 결과를 이를 포함하고 있는 상위 sql명령문에 전달하기 위해
 	두 개 이상의 sql명령문을 상위 sql명령문과 연결하여 처리하는 방법
 */
-- 사원명 ALLEN의 직책과 같은 사원의 정보를 출력
SELECT *
FROM emp 
WHERE job = (SELECT job
			 FROM emp
			 WHERE ename = 'ALLEN');
-- ex1) SMITH와 같은 부서번호를 가진 사원정보를 출력
SELECT *
FROM emp 
WHERE deptno = (SELECT DEPTNO
				FROM emp
				WHERE ename='SMITH');
-- ex2) MARTIN의 급여보다 같거나 작은 사원정보를 출력
SELECT *
FROM emp 
WHERE sal <= (SELECT SAL
			  FROM emp 
			  WHERE ename = 'MARTIN');

/*
 # 단일행 서브쿼리
 1. 단 하나의 행만을 검색하여 메인 쿼리에 변환하는 질의문
 2. 비교연산자: =, >=, >, <, <=, <>(같지 않음)
 */
-- deptno가 10인 사원의 평균 급여보다 많은 사원을 출력
SELECT avg(sal)
FROM emp
WHERE deptno=10;-- deptno가 10인 사원의 평균 급여
SELECT *
FROM emp 
WHERE sal > (SELECT avg(sal)
			 FROM emp
			 WHERE deptno=10); --deptno가 10인 사원의 평균급여보다 많은 사원의 정보 출력
-- ex) SALESMAN 중에서 가장 많은 급여보다 많이 받는 사원 출력
SELECT *
FROM emp 
WHERE sal > (SELECT max(SAL)
			 FROM emp 
			 WHERE job = 'SALESMAN');

/*
 # 다중행 서브쿼리
 1. 서브쿼리에서 실행한 결과값이 1행 이상일 때 사용하는 쿼리
 2. 사용되는 연산자
 	in: 결과값이 or 조건으로 처리해야할 필요가 있는 경우 사용
 	any, some: 결과값이 1개라도 있는 경우
 	all: 모든 결과값이 일치하는 경우
 	exist / not exist: 해당 subquery 값이 존재하는 경우 / 존재하지 않는 경우
 */
SELECT empno 
FROM emp 
WHERE job='SALESMAN';
SELECT *
FROM emp
WHERE empno IN (SELECT empno
				FROM emp
				WHERE job='SALESMAN');
-- ex) BLAKE를 관리자로 하는 사원을 조회하세요.(SUBQUERY 사용)
SELECT *
FROM emp 
WHERE mgr IN (SELECT empno
			  FROM emp
			  WHERE ename='BLAKE');
			 
-- any, some: 하나라도 일치하면 참이 되는 연산자
-- 부서번호가 10인 사원의 급여 중 하나라도 보다 많으면 처리
SELECT ename, sal
FROM emp 
WHERE sal > any(SELECT sal FROM emp WHERE deptno=10);

SELECT ename, sal 
FROM emp 
WHERE sal > (SELECT min(sal) FROM emp WHERE deptno=10);
-- all: 모두 다 일치하면 참이 되는 연산자
SELECT sal 
FROM emp 
WHERE deptno=20;
SELECT *
FROM emp 
WHERE sal > all(SELECT sal FROM emp WHERE deptno=20);

-- 서브쿼리 // 가장 급여가 많은 사원의 정보를 출력하세요.
/*
 사원 번호, 이름 별로 그룹을 처리하여 최대값을 급여출력(X)
 SELECT empno, ename, max(sal)
 FROM emp 
 GROUP BY empno, ename;
 의미 없음
 */
-- 1. 최고 급여를 호출
SELECT max(sal) FROM emp;
-- 2. 최고 급여에 해당하는 정보를 조건 처리
SELECT * FROM emp WHERE sal = 5000;
-- 3. 1과 2의 sql을 혼합
-- 	1) 단일 데이터 subquery: 1개의 subquery 결과로 처리하는 형식
SELECT * FROM emp WHERE sal = (SELECT max(sal) FROM emp);
--	2) 다중 데이터 subquery: subquery의 결과를 다중으로 처리
-- 부서번호 별 최고 급여 출력
SELECT deptno, max(sal) FROM emp GROUP BY deptno;
-- 부서 별 최고급여자의 정보 출력
SELECT * FROM emp WHERE (deptno, sal) IN (SELECT deptno, max(sal) FROM emp GROUP BY deptno) ORDER BY deptno;


/*
 # exists 연산자
 1. 서브쿼리의 결과값이 있는지 여부를 확인해서 메인쿼리를 실행
 
 # not exists 연산자: 결과값이 없을 때 실행 처리
 */
SELECT *
FROM emp 
WHERE comm IS NULL;

SELECT *
FROM emp 
WHERE comm IS NOT NULL;

SELECT *
FROM emp 
WHERE deptno=40;

-- SUBQUERY 데이터가 있을 때
SELECT *
FROM emp 
WHERE EXISTS(SELECT *
			 FROM emp
			 WHERE comm IS NOT NULL);
-- SUBQUERY 데이터가 없을 때
SELECT *
FROM emp 
WHERE not exists(SELECT *
			 FROM emp 
			 WHERE deptno=40);











