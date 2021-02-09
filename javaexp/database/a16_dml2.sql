/*
 # 데이터수정
 1. update명령문은 테이블에 저장된 데이터 수정을 위한 조작어
 2. 기본형식
 	update 테이블명
 	set 컬럼1 = 변경할 데이터,
 		컬럼2 = 변경할 데이터,
 		컬럼3 = 변경할 데이터
 	where 조건문
 3. 주의사항
 	1) where절을 생략하면 테이블의 모든 행이 수정된다.
 	2) 조건문과 변경할 데이터부분을 subquery를 이용해 처리할 수 있다.
 */
SELECT * FROM emp10;
-- '김철수'의 사원번호, 직책, 관리자번호, 급여, 보너스, 부서번호 수정처리
UPDATE emp10
	SET empno = 5005,
		mgr = 7698,
		sal = 3600,
		comm = 500,
		deptno = 40
	WHERE ename = '김철수';
SELECT * FROM emp10;
-- ex1) 5003과 5004에 null로 된 데이터를 update 구문을 이용해서 수정처리하세요.
UPDATE emp10 
	SET job = '사원',
		mgr = '7698',
		hiredate = sysdate,
		comm = 100
	WHERE empno = 5003;
UPDATE emp10 
	SET job = '대리',
		hiredate = sysdate
	WHERE empno = 5004;
SELECT * FROM emp10;
/*
 기존 데이터에서 추가하여 데이터를 수정할 때
 ex) 게시판의 조회수를 증가처리
 update board
 	set readcnt = readcnt + 1
 	where no = 25;
 */
/*
# subquery를 통한 수정 처리.
1. update 명령문에 set 절에 서브쿼리를 이용하여 수정 처리하는 것을 말한다.
2. 다른 테이블이나 현재 테이블의 정보를 변경할 때, 활용할 수 있다.
3. 변경할 컬럼의 타입과 갯수는 반드시 일치 하여야 한다.
*/
SELECT * FROM emp10;
--부서번호 10인 사원의 급여
SELECT * FROM emp10 
WHERE deptno=10;
--부서번호 20인 사원의 최대 급여
SELECT max(sal) FROM emp10 
WHERE deptno=20;

-- update 구문의 subquery는 해당하는 컬럽에 맞는 하나의 결과이므로 =(대입)으로 처리한다.
-- 1) 한 개의 컬럼	set 컬럼1 = (select 1개의 결과 컬럼)
-- 2) 한 개 이상의 컬럼
--		set (컬럼1, ..., 컬럼n) = (select n개의 결과 컬럼)

UPDATE emp10 
SET sal = (SELECT max(sal) FROM emp10 
WHERE deptno=20) 
WHERE deptno=10;
SELECT * FROM emp10;

--ex1) job이 SALESMAN의 평균 급여를 사원번호 7499에 할당하세요.

UPDATE emp10 
SET sal = (SELECT avg(sal)
   FROM EMP10 
   WHERE job='SALESMAN')
   WHERE empno = 7499;
  
  /*
   * SET SAL=(원래 구문) 
   * 바꿀 구문
   */

  SELECT * FROM emp10
  WHERE empno=7499;
 SELECT avg(sal) 
 FROM emp10 WHERE job ='SALESMAN';


--ex2) 사원번호 7369의 급여를 부서번호 30인 사원들의 평균급여와 부서번호로 변경처리
SELECT DEPTNO, AVG(SAL)
FROM EMP10 
WHERE DEPTNO=30
GROUP BY DEPTNO;

SELECT DEPNTO, SAL
FROM EMP10 
WHERE EMPNO=7369;

UPDATE EMP10 
SET(DEPTNO, SAL)=(SELECT DEPTNO, AVG(SAL)
				  FROM EMP10 
				  WHERE DEPTNO=30
				  GROUP BY DEPTNO
				 )
WHERE EMPNO=7369;

--EX3) SALESMAN의 평균 급여를 사원번호 7566인 사람의 JOB과 급여로 수정처리.
SELECT *FROM EMP10;

UPDATE EMP10 
SET(JOB,SAL)=(
SELECT AVG(SAL) FROM EMP10
WHERE JOB='SALESMAN'
GROUP BY JOB)
WHERE EMPNO=7566;
SELECT JOB,SAL
FROM EMP10
WHERE EMPNO=7566;

/*
 #삭제(delete)
 1. 행단위로 데이터를 삭제하는 구문을 말한다.
 2. 기본 형식
    delete
    from 테이블명
    where 조건;
    행 단위로 삭제가 되기 때문에 delete 구문 이하의 컬럼을 정할 필요가 없다.
 */
SELECT * FROM emp10;
--7369인 데이터를 삭제 처리
DELETE 
FROM EMP10 
WHERE empno=7369;

--subquery를 이용해서 10 부서번호의 평균값의 sal가 있는 사원정보를 삭제 처리
--평균값 이하의 데이터가 삭제 되는 것
SELECT avg(sal) FROM emp10;
SELECT deptno, sal FROM EMP10 
WHERE deptno = 10;

DELETE 
FROM emp10 
WHERE sal <(SELECT avg(sal) FROM emp10);

SELECT *FROM emp10;

--지웠던 테이블 다시 만들기
CREATE TABLE emp11 
AS SELECT * FROM emp;
SELECT * FROM emp11;

--ex1) job이 CLERK인 데이터를 삭제 처리
DELETE FROM EMP11
WHERE JOB ='CLERK';

--ex2) 부서번호 30의 sal의 평균을 기준으로  (그룹으로 묶는다는 의미)
-- 그 이하인 데이터를 삭제 처리.
DELETE FROM EMP11
WHERE SAL<(SELECT AVG(SAL) FROM EMP11 
WHERE DEPTNO=30
GROUP BY DEPTNO);

/*
# merge(병합처리 명령어)
1. 변경 내지 입력할 데이터의 구조가 같은 두 개의 테이블을 비교하여 하나의 테이블로 합치기 위한 오라클에서 지원하는 데이터 조작어
2. 조건문을 이용해서 해당 테이블의 특정한 컬럼값이 있으면 update구문처리하고, 데이터가 없으면 insert 구문을 처리한다.
3. 기본형식
	MERGE INTO 테이블명 A
	USING 테이블명 B
	ON A와 B의 특정한 컬럼 비교
	WHEN MATCHED THEN (>> 두 개의 테이블의 특정 컬럼에 데이터가 있을 때)
		UPDATE SET (>> 수정처리)
	WHEN NOT MATCHED THEN (>> 데이터가 없을 때)
		INSERT VALUES (>> 등록 처리)
 */
CREATE TABLE emp30
AS SELECT * FROM emp;
CREATE TABLE emp31
AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp30;
SELECT * FROM emp31;
-- 1) 두 개의 테이블 비교를 통해 입력하기
MERGE INTO emp31 s
USING emp30 t
ON (s.empno = t.empno)
WHEN MATCHED THEN
	UPDATE SET s.ename = t.ename,
			   s.job = t.job,
			   s.sal = t.sal
WHEN NOT MATCHED THEN
	INSERT (empno, ename, sal, deptno)
	VALUES (t.empno, t.ename, t.sal, t.deptno);
-- ON 부분에 있는 입력이나 수정처리의 기준이 되는 컬럼을 update set 구문에 아용하지 못한다.
SELECT * FROM emp31;
-- 2) 가상의 테이블로 데이터 입력 처리
-- 8000, '홍길동' 프로그램을 통해서 전달된 입력값
-- 해당 데이터의 KEY인 empno가 있으면 수정이 되고, 없으면 등록이 된다.
MERGE INTO emp31 s
USING dual
ON (s.empno=8001)
WHEN MATCHED THEN
	UPDATE SET s.ename = '마길동'
WHEN NOT MATCHED THEN 
	INSERT (s.empno, s.ename)
	values(8001, '마길동');
SELECT * FROM emp31;
-- ex) emp32테이블로 구조만 복사된 테이블을 만들고, 전체 데이터를 기준으로 수정/등록되게 3개정도 데이터를 입력/수정 테스트 해보세요.
CREATE TABLE emp32
AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp32;

MERGE INTO emp32 a
USING dual
ON (a.empno = 8000)
WHEN MATCHED THEN 
	UPDATE SET a.ename = '홍길동', a.job = '사원', a.mgr=7999, a.hiredate = SYSDATE, a.sal = 3000, a.comm = 100, a.deptno = 10
WHEN NOT MATCHED THEN
	INSERT (empno, ename, mgr, hiredate, sal, comm, deptno)
	VALUES (8000,'홍길동',7999,SYSDATE,3000,100,10);

MERGE INTO emp32 a
USING dual
ON (a.empno = 8000)
WHEN MATCHED THEN 
	UPDATE SET a.ename = '신길동', a.job = '대리', a.mgr = 7999, a.HIREDATE = SYSDATE, a.sal = 3200, a.comm = 200, a.deptno = 20
WHEN NOT MATCHED THEN
	INSERT (empno, ename, mgr, hiredate, sal, comm, deptno)
	VALUES (8000,'신길동',7999,SYSDATE,3200,200,20);

MERGE INTO emp32 a
USING dual
ON (a.empno = 8001)
WHEN MATCHED THEN 
	UPDATE SET a.ename = '마길동', a.job = '사원', a.mgr=7999, a.hiredate = SYSDATE, a.sal = 3000, a.comm = 100, a.deptno = 10
WHEN NOT MATCHED THEN
	INSERT (empno, ename, mgr, hiredate, sal, comm, deptno)
	VALUES (8001,'마길동',7999,SYSDATE,3000,100,10);

MERGE INTO emp32 a
USING dual
ON (a.empno = 8002)
WHEN MATCHED THEN 
	UPDATE SET a.ename = '고길동', a.job='과장', a.mgr=7999, a.HIREDATE =sysdate-10, a.SAL =4000, a.comm = 400, a.DEPTNO =30
WHEN NOT MATCHED THEN
	INSERT (empno, ename, mgr, hiredate, sal, comm, deptno)
	VALUES (8002,'고길동',7999,SYSDATE-10,4000,400,30);

SELECT * FROM emp32;

-- ex) emp 테이블의 구조만 복사한 emp33 테이블을 만들고 emp30의 기준이 되는 데이터 empno 컬럼으로 사원명, 부서명, 입사일을 입력하라
CREATE TABLE emp33
AS SELECT * FROM emp WHERE 1=0;
MERGE INTO emp33 s
USING emp30 t
ON (s.empno = t.EMPNO)
WHEN MATCHED THEN 
	UPDATE SET s.ename = t.ename,
			   s.deptno = t.deptno,
			   s.hiredate = t.hiredate
WHEN NOT MATCHED THEN
	INSERT (empno, ename, deptno, hiredate)
	VALUES (t.empno, t.ename, t.deptno, t.hiredate);
SELECT * FROM emp33;














