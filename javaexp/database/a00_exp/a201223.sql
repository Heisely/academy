--database
--1. 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 이름과 알파벳 순으로 정렬되도록 질의문을 만드세요.
SELECT ename 사원명, deptno 부서번호
FROM emp
WHERE deptno BETWEEN 10 AND 30
ORDER BY ename ASC;
--2. 1982년도에 입사한 모든 사원의 이름과 입사일을 출력하세요(like %활용).
SELECT * FROM emp;
SELECT ename 사원명, hiredate 입사일
FROM emp
WHERE hiredate LIKE '%82%';
/*
SELECT ''||hiredate
FROM emp;
로 확인하면 hiredate의 입력된 형식을 볼 수 있다.
*/

--3. 보너스가 급여의 20%이상이고 부서번호가 30인 모든 사원에 대하여 이름, 급여, 그리고 보너스를 출력하세요. 급여(sal), 보너스(comm)
SELECT ename 이름, sal 급여, comm 보너스
FROM emp 
WHERE comm >= (sal*0.2) AND deptno=30;

--4. like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
/*
 1) 위치 상관없이 검색: 검색컬럼 LIKE '%A%'
 2) A로 시작하는것 검색: 검색컬럼 LIKE 'A%'
 3) N로 끝나는것 검색: 검색컬럼 LIKE '%N'
 4) 자릿수 위치에 맞는 데이터 검색(세번째 자리에 A가 나오는 데이터 검색): 검색컬럼 LIKE '__A%'
 */
-- ename에서 위치에 상관 없이 A를 포함하는 데이터 검색
SELECT empno, ename FROM emp WHERE ename LIKE '%A%';
-- ename에서 A로 시작하는 데이터 검색
SELECT empno, ename FROM emp WHERE ename LIKE 'A%';
-- ename에서 N으로 끝나는 데이터 검색
SELECT empno, ename FROM emp WHERE ename LIKE '%N';
-- ename에서 세번째 자리에 A가 나오는 데이터 검색
SELECT empno, ename FROM emp WHERE ename LIKE '__A%';

--5. 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요(in subquery구문 활용)
SELECT ename 사원명, hiredate 입사일
FROM emp 
WHERE hiredate IN (SELECT max(hiredate) FROM emp);


