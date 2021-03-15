SELECT e.*, dname, loc, grade
			FROM emp e, dept d, salgrade s
			WHERE d.deptno = d.deptno
			AND e.sal BETWEEN s.losal AND s.hisal
			AND job = 'MANAGER'
			AND d.deptno = 20
			AND grade = 4;
/*
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST	

10	ACCOUNTING
20	RESEARCH
30	SALES
40	OPERATIONS */
SELECT DISTINCT e.mgr, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;
/*
7566	JONES
7782	CLARK
7839	KING
7698	BLAKE
7902	FORD
 */