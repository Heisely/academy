--[하] 1. subquery를 통한 수정 처리 기본형식을 기술하세요
/*
 update 테이블명
 	set 컬럼1 = 변경할 데이터,
 		컬럼2 = 변경할 데이터,
 		컬럼3 = 변경할 데이터
 where 조건문
 */

--[하] 2. job이 CLERK이고 부서번호가 20인 사람을 SAL와 COMM을 각각20% 인상 처리 하세요.
CREATE TABLE emp14
AS SELECT * FROM emp;
SELECT sal, comm FROM emp14 WHERE deptno=20 AND job='CLERK'; -- 수정 전: sal=800, comm = null
UPDATE emp14
	SET sal = sal*1.2,
		comm = comm*1.2
WHERE deptno=20 AND job='CLERK';
SELECT sal, comm FROM emp14 WHERE deptno=20 AND job='CLERK'; -- 수정 후: sal=960, comm=null

--[하] 3.  comm이 null이거나 0인데이터를 sal의 15%로 comm으로 지정하고, 
--      hiredate를  2000-01-01로 변경하세요.
CREATE TABLE emp19
AS SELECT * FROM emp;
UPDATE emp19
	SET comm = sal*0.15,
		hiredate = '2000-01-01'
WHERE (comm=0 OR comm IS null);
SELECT * FROM emp19;

--[중] 4. emp21복사테이블을 만들고, 부서별 최고 급여자의 사원번호를 확인하고, 
--        10=>20, 20=>30, 30 => 10으로 변경하고, 평균 급여로 변경처리하세요.
-- 어제 과제에 emp21, emp22, emp23을 만들어서 4번 문제는 emp24로 진행했습니다.
CREATE TABLE emp21
AS SELECT * FROM emp;
SELECT * FROM emp21;

-- 1) 부서별 최고급여
SELECT deptno, max(sal) FROM emp21 GROUP BY deptno ORDER BY deptno;
-- 2) 부서별 최고 급여자의 사원번호, 부서번호, 급여
SELECT empno, deptno, sal
FROM emp21
WHERE (deptno, sal) IN (SELECT deptno, max(sal) FROM emp21 GROUP BY deptno)
ORDER BY deptno; -- 10번:7839, sal=5000 / 20번:7902, sal=3000 / 30번:7698, sal=2850
-- 3) 사원번호 별로 변경 - decode 함수 이용
update emp21
	set deptno = decode(deptno, 10, 20, 20, 30, 10),
		sal = (select avg(sal) from emp21)
where empno in (7839, 7902, 7698);
/*
UPDATE emp24
	SET deptno = 20,
		sal = (SELECT avg(sal) FROM emp24 WHERE deptno=20)
WHERE empno=7839;

UPDATE emp24
	SET deptno = 30,
		sal = (SEL	ECT avg(sal) FROM emp24 WHERE deptno=30)
WHERE empno = 7902;

UPDATE emp24
	SET deptno = 10,
		sal = (SELECT avg(sal) FROM emp24 WHERE deptno=10)
WHERE empno = 7698;
 */

-- 4) 변경된 내용 확인
SELECT empno, deptno, sal
FROM emp21
WHERE empno IN (7839, 7902, 7698);
-- 10번: 7698, sal=1875 / 20번: 7839, sal=2258.33 / 30번: 7902, sal=1566.67

--[하] 5. 삭제구분의 기본형식을 기술하세요
/*
 DELETE
 FROM 테이블명
 WHERE 조건;
 */

--[하] 6. emp22복사 테이블 만들고, 부서별 최저 급여 데이터를 삭제 처리하세요.
-- emp25로 진행
CREATE TABLE emp25
AS SELECT * FROM emp;
SELECT * FROM emp25;
SELECT deptno, min(sal) FROM emp25 GROUP BY deptno;
-- 삭제 전 부서별 최저급여 min(sal) : 10번 - 1300 / 20번 - 800 / 30번 - 950
DELETE 
FROM emp25
WHERE sal = (SELECT min(sal) FROM emp25 WHERE deptno=10);
DELETE 
FROM emp25
WHERE sal = (SELECT min(sal) FROM emp25 WHERE deptno=20);
DELETE 
FROM emp25
WHERE sal = (SELECT min(sal) FROM emp25 WHERE deptno=30);

SELECT deptno, min(sal) FROM emp25 GROUP BY deptno;
-- 삭제 후 부서 별 최저 급여 min(sal): 10번 - 2,450 / 20번 - 2,975 / 30번: 1,250 으로 바뀜