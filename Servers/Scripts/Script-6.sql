-- # dao, mapper 연습예제
-- ex1) SELECT count(*) FROM emp;
SELECT count(*) FROM emp;
-- ex2)
SELECT * FROM emp
WHERE empno = 7369;
-- ex3)
SELECT empno FROM emp
WHERE sal BETWEEN 2000 AND 3000;

SELECT * FROM dept;
/*
ex1) SELECT * FROM dept WHERE deptno=#{deptno};
ex2) SELECT deptno, max(sal) sal FROM emp GROUP BY deptno
ex3) SELECT * FROM emp WHERE job = #{job}
ex4) SELECT max(sal) FROM emp WHERE deptno = ${deptno}
 */

SELECT * FROM dept WHERE deptno=20;
SELECT deptno, max(sal) sal FROM emp GROUP BY deptno;
SELECT * FROM emp WHERE job ='SALESMAN';
SELECT max(sal) FROM emp WHERE deptno = 10;

SELECT e.empno, e.ename, d.dname, e.sal
FROM emp e, dept d
WHERE e.DEPTNO = d.DEPTNO;
SELECT e.*, m.ename
FROM emp e, emp m
WHERE e.mgr = m.EMPNO; 

SELECT * FROM EMP
WHERE to_char(HIREDATE, 'YYYY')= '1980';
SELECT * FROM DEPT;

SELECT * FROM DEPT
		WHERE 1=1
		AND DNAME LIKE '%'||'ACCOUNTING'||'%'
		AND LOC LIKE '%'||'NEW YORK'||'%';
SELECT * FROM DEPT;