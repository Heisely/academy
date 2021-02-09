--[데이터베이스]
--[하] 1. 사원 테이블 emp60테이블을 emp테이블에서 복사를 하여, 
-- empno 프라이머리, ename not null, job (emp의 job데이터),
--hiredate(2001이후로 입력), sal(0이상) deptno(dept테이블 deptno참조) 로 설정해서 입력 하세요
CREATE TABLE EMP61 AS SELECT * FROM emp;

ALTER TABLE emp61 ADD CONSTRAINT emp61_empno_pk PRIMARY KEY (empno);
ALTER TABLE emp61 MODIFY (ename CONSTRAINT emp61_ename_nn NOT null);


ALTER TABLE emp61 ADD CONSTRAINT emp61_sal_ck CHECK (sal>=0);
ALTER TABLE emp61 ADD CONSTRAINT emp61_deptno_fk FOREIGN KEY (deptno) REFERENCES dept(deptno);

--[하] 2. emp60 설정된 제약조건, 삭제, 활성화/비활성화 처리를 하세요.
SELECT CONSTRAINT_name, status, table_name FROM ALL_CONSTRAINTS WHERE table_name = 'EMP61';
ALTER TABLE emp61 DROP CONSTRAINT emp61_sal_ck;
ALTER TABLE emp61 disable CONSTRAINT emp61_empno_pk;
ALTER TABLE emp61 enable CONSTRAINT emp61_empno_pk;
