SELECT m.ename mname, e.*, d.dname
FROM emp e, dept d, emp m
WHERE e.mgr = m.empno AND e.deptno=d.deptno 
AND e.ename LIKE '%'||upper('')||'%'
AND e.job LIKE '%'||upper('')||'%'
AND e.DEPTNO = 30 AND e.mgr = 7698
ORDER BY e.empno DESC;

SELECT * FROM PRODUCT2;