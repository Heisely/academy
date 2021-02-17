SELECT * FROM emp2;
UPDATE emp2
	SET ename = ename||'(변경)',
		job = job||'(변경)',
		mgr = mgr+10,
		hiredate = to_date('2000-12-12','YYYY-MM-DD'),
		sal = sal + 1000,
		comm = comm+10,
		deptno = deptno + 10
WHERE empno = 7369;

/*UPDATE emp2
	SET ename = ?,
		job = ?,
		mgr = ?,
		hiredate = to_date(?,'YYYY-MM-DD'),
		sal = ?,
		comm = ?,
		deptno = ?
WHERE empno = ?*/

SELECT * FROM DEPT2;
UPDATE DEPT2 
	SET dname = dname||'(변경)',
		loc = loc||'(변경)'
WHERE deptno = 50;
/*UPDATE DEPT2 
	SET dname = ?,
		loc = ?,
WHERE deptno = ?*/

SELECT * FROM PRODUCT2;
UPDATE product2
	SET name = name||'(변경)',
		price = price - 2000,
		CREDTE = to_date(CREDTE, 'YY-MM-DD'),
		COMPANY = COMPANY||'(변경)',
		INCOMEDTE = to_date(INCOMEDTE, 'YY-MM-DD'),
		INMANAGER = INMANAGER
WHERE pno = 10040;
/*UPDATE product2
	SET name = ?||'(변경)',
		price = ? - 2000,
		CREDTE = to_date(?, 'YY-MM-DD'),
		COMPANY = ?||'(변경)',
		INCOMEDTE = to_date(?, 'YY-MM-DD'),
		INMANAGER = ? ||'(변경)'
WHERE pno = ?;*/