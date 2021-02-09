/*
 1. 테이블명의 변경
	rename 기존테이블명 to 새로운 테이블명;
 */
SELECT * FROM emp51;
RENAME emp51 TO emp52;
SELECT * FROM emp52;
/*
 2. 컬럼명 변경
 	alter table 테이블명
 	rename column 기존컬럼명 to 새로운 컬럼명;
 */
SELECT * FROM emp50;
ALTER TABLE emp50
RENAME COLUMN empno TO NO;

/*
 ex. 테이블 변경명 명령어를 활용해 아래 내용을 처리
 	1) emp53으로 구조복사해서 테이블 만들기
 	2) dept테이블의 dname, loc 및 salgrade의 grade를 emp53에 추가
 	3) deptno 컬럼 삭제
 	4) subquery를 이용해 해당 데이터에 맞게 데이터를 입력
 	5) hiredate를 credte로 컬럼명 변경
 	6) 데이터 삭제(credte데이터만)
 	7) credte 형식을 varchar2로 변경하여 2001/12/12 형식으로 데이터 입력
 */
-- 1) emp53으로 구조복사해서 테이블 만들기
CREATE TABLE emp53
AS SELECT * FROM emp WHERE 1=0;
-- 2) dept테이블의 dname, loc 및 salgrade의 grade를 emp53에 추가
ALTER TABLE emp53
ADD (dname varchar2(30), loc varchar2(30), grade NUMBER(1));
-- 3) deptno 컬럼 삭제
ALTER TABLE emp53 DROP COLUMN deptno;
-- 4) subquery를 이용해 해당 데이터에 맞게 데이터를 입력
INSERT INTO emp53 
SELECT empno, ename, job, mgr, hiredate, sal, comm, dname, loc, grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno
AND e.sal BETWEEN s.losal AND s.hisal;
-- 5) hiredate를 credte로 컬럼명 변경
ALTER TABLE emp53
RENAME COLUMN hiredate TO credte;
-- 6) 데이터 삭제(credte데이터만), 
UPDATE emp53
	SET credte = NULL;
ALTER TABLE emp53
MODIFY credte varchar2(10);
-- 7) credte 형식을 varchar2로 변경하여 2001/12/12 형식으로 데이터 입력
UPDATE emp53 b
	SET credte = (SELECT to_char(hiredate, 'YYYY/MM/DD')
				  FROM emp a
				  WHERE a.empno = b.empno);-- 수정처리할 기준으로 기존테이블에 있는 empno와 입력할 테이블 empno를 join관계로 수정
SELECT * FROM emp53;
/*
 데이터가 입력된 상황에서 데이터 유형이 다른 컬럼으로 변경하려고 할 때
 1. 임시 테이블이나 다른 테이블에 해당 key와 변경할 데이터가 저장돼 있어야 한다.
 
 */









