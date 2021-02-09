/*
 # 조인
 1. 하나의 sql명령문에 의해 여러 테이블에 저장된 데이터를 한 번에 조회할 수 있는 기능
 2. 두 개 테이블에서 공통되는 컬럼을 기준으로 조건문을 만들어 조인함
 3. 기본형식
 	select 테이블별칭.컬럼명, 테이블별칭.컬럼명...
 	from 테이블1 별칭, 테이블2 별칭
 	where 별칭.공통컬럼 = 별칭.공통컬럼
 */
-- emp의 마지막 컬럼인 deptno를 통해서 부서 번호를 가지고 있다
SELECT *
FROM emp;
-- dept는 첫 번째 컬럼인 deptno를 통해서 부서정보를 가지고 있다.
SELECT *
FROM dept;
-- 사원별로 부서이름을 가져오려면 다음 같은 sql을 사용해야 한다.
SELECT *
FROM emp 
WHERE deptno=20;
-- 부서 테이블에서 부정 정보 sql을 사용해서 가져온다
SELECT *
FROM dept
WHERE deptno=20;
-- 두 개의 테이블에 공통되는 부서번호(deptno)가 있기 때문에 join관계를 활용하면 사원별 부서정보(부서번호, 부서명, 부서위치)를 가져올 수 있다.
SELECT e.*, d.*
FROM emp e, dept d
WHERE e.DEPTNO=d.DEPTNO;
-- 부서명, 사원명, 급여
SELECT d.dname, e.ename, e.sal
FROM emp e, dept d
WHERE e.deptno = d.deptno;
--
SELECT deptno 부서번호, dname 부서이름, loc 부서위치
FROM dept;
-- ex) 사원번호, 사원명, 부서이름, 부서위치 출력
-- 컬럼명이 해당 테이블의 고유 컬럼이면, 테이블의 별칭을 사용하지 않아도 된다.
SELECT empno 사원번호, ename 사원명, dname 부서명, loc 부서위치
FROM emp e, dept d
WHERE e.deptno = d.deptno;
-- 검색 조건의 추가 또는 기존의 여러가지 sqlquery 사용하기
-- 급여가 3000이상인 직원의 부서명, 부서위치, 사원명, 급여를 출력
SELECT dname, loc, ename, sal
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO 
AND sal >= 3000;
-- ex1) 3,4분기에 입사한 사원의 이름과 부서위치, 분기를 출력
SELECT ename, loc, to_char(hiredate,'Q')||'분기' 입사분기
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND to_char(hiredate,'Q') IN ('3','4');
-- ex2) 부서명별 최고급여를 출력(부서명, 급여)
SELECT dname 부서명, max(sal) 최고급여
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY dname;
/*
 # 카티션 곱
 1. 전체 데이터 내용을 리스트 처리하는 것
 	where 조건을 걸지 않을 때, 연관 관계와 별도로 하나의 테이블의 한 행에 반대쪽 테이블의 전체행이 연결되어 리스트된다.
 */
SELECT e.*, d.*
FROM emp e, dept d;
SELECT e.*, d.*
FROM emp e CROSS JOIN dept d;
-- # equi join = natural join
-- 두 개의 공통되는 컬럼으로 조인 하는 것
SELECT *
FROM emp NATURAL JOIN dept;
SELECT e.*, d.*
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO;

/*
 # non-equi join
 1. 두 개의 테이블에 조인할 조건이 '='(동일) 조건이 아니고, 범위를 지정할 때 사용
 */
SELECT * FROM SALGRADE s ;
-- grade: 등급 / losal: 최소범위 / hisal: 최대범위
-- 사원의 이름과 급여, 등급을 표시
SELECT ename, sal, grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;

/*
 # outer join
 1. 두 개의 테이블에서 equi join 시, 한 쪽에 해당 데이터가 없으면 나타나지 않는 특징이 있다.
 	이 때, 특정한 테이블을 기준으로 해당 테이블과 조인하는 테이블이 데이터가 없더라도 데이터를 출력해주는 join이
 	outer join이다.
 */
SELECT *
FROM dept;
SELECT DISTINCT deptno
FROM emp;
-- emp에 있는 deptno데이터와 dept에 있는 deptno에는 차이가 발생한다.
-- 데이터 존재여부에 상관없이 조인하여 현재 부서번호에 따른 할당 내용을 확인하고자 outer join을 사용한다.
SELECT d.*, ename, job, sal
FROM dept d, emp e
WHERE d.deptno = e.deptno(+)
ORDER BY d.deptno;

/*
 # Self 조인
 1. 한 테이블 연관 관계가 있는 컬럼들을 Join 형식으로 데이터 처리하는 것
 2. 형식
 	SELECT
 	FROM 테이블1 a, 테이블1 b
 	WHERE a.컬럼1 = b.컬럼2 
 */
SELECT * FROM emp;
-- empno: 사원번호, mgr: 관리자 사원번호
-- SMITH의 관리자의 이름을 알고자 한다.
SELECT empno, ename, mgr
FROM emp 
WHERE ename='SMITH';
SELECT empno, ename
FROM emp 
WHERE empno=7902;
-- 사원의 이름과 사원의 관리자 이름을 출력
-- 1. 연관관계가 있는 컬럼을 선택: empno, mgr
-- 2. 하나의 테이블을 두 개로 alias이름으로 선언하고, 두 개의 컬럼을 연관관계 설정
SELECT a.empno, a.ename, a.mgr, b.empno, b.ename
FROM emp a, emp b -- TABLE 내에 SELF 조인이 있으면 ALIAS를 사용
WHERE a.mgr = b.empno;
/*
 ex)
 1. 테이블 만들기
 	family
 	num(번호) pos(역할) name(이름) parno(부모번호)
 	1		 할아버지	  홍말순			0
 	2		 아버지	  홍판서			1
 	3		 아들1	  홍길동			2
 	4		 아들2	  홍진필			2 
 	=> sample 데이터를 3개 이상 입력해보세요.
 2. 데이터 입력
 3. sql을 이용해서 @@@의 부모 이름은 @@@이다. 출력
 */
CREATE TABLE family(
	num NUMBER,
	pos varchar2(20),
	name varchar2(20),
	parno number
);
INSERT INTO family values(1,'할아버지','홍말석',0); -- 최상위 계층
-- NO와 PARNO의 연관관계를 설정하여 데이터를 입력
INSERT INTO family values(2,'아버지','홍판서',1); 
INSERT INTO family values(3,'아들1','홍길동',2);
INSERT INTO family values(4,'아들2','홍진필',2);
INSERT INTO family values(5,'손자1','홍진실',3);
INSERT INTO family values(6,'손자2','홍순이',4);
SELECT * FROM family;
-- @@@의 부모의 이름은 @@@ 이다.
SELECT a.name||'의 부모 이름은 '||b.name||'이다' 가족관계
FROM family a, family b
WHERE a.parno = b.num;













