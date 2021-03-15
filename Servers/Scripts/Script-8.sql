CREATE TABLE emp01
AS SELECT * FROM emp;
SELECT * FROM emp01;

SELECT max(empno)+1 FROM emp01;
CREATE SEQUENCE emp01_seq
	START WITH 7935
	MINVALUE 1000
	MAXVALUE 9999
	CYCLE;
INSERT INTO emp01 VALUES (emp01_seq.nextval,'홍길동','CLERK','7902',sysdate, 3000, 1000, 10);


SELECT  DISTINCT e.empno, e.ename
			FROM emp01 e, emp01 m
			WHERE e.empno = m.mgr
			ORDER BY empno DESC;