-- [하] 1. merge의 형식으로 테이블간, 입력데이터간 처리 기본형식을 기술하세요.
/*
# merge(병합처리 명령어)
1. 변경 내지 입력할 데이터의 구조가 같은 두 개의 테이블을 비교하여 하나의 테이블로 합치기 위한 오라클에서 지원하는 데이터 조작어
2. 조건문을 이용해서 해당 테이블의 특정한 컬럼값이 있으면 update구문처리하고, 데이터가 없으면 insert 구문을 처리한다.
3. 기본형식
	MERGE INTO 테이블명 A : 등록과 수정을 처리할 대상 테이블
	USING 테이블명 B : A테이블을 처리하기 위한 기준 테이블
	ON (A와 B의 특정한 컬럼 비교): 두 테이블을 입력하거나 등록할 기준(조건문 처리)
							 ex) emp의 경우 key인 empno가 두 테이블에 있는 지 여부 확인 >> a.empno = b.empno
	WHEN MATCHED THEN (>> 두 개의 테이블의 특정 컬럼에 데이터가 있을 때)
		UPDATE SET (>> 수정처리) ex) update set a.ename = b.ename, a.job = b.job ...
	WHEN NOT MATCHED THEN (>> 두 개 테이블에 on 조건 데이터가 없을 때)
							a에는 있는 empno가 b테이블에는 없을 때 등록처리
		INSERT VALUES (>> 등록 처리) ex) insert (컬럼명이 필요할 때 기입) values (empno, ename, job, ...)
 */
-- [중] 2. dept구조 복사 테이블 dept10, dept11을 만들고, 위에 기술한 merge입력처리 예제, 테이블간 복사 merge예제를 만드세요
SELECT * FROM dept;
-- 1) 구조 복사 테이블 dept10 & dept11
CREATE TABLE dept10
AS SELECT * FROM dept;
SELECT * FROM dept10;

CREATE TABLE dept11
AS SELECT * FROM dept WHERE 1=0;
SELECT * FROM dept11;

-- 2) 입력처리
MERGE INTO dept11 bb
USING dual
ON (bb.DEPTNO = 60)
WHEN MATCHED THEN 
	UPDATE SET bb.DNAME = '홍길동',
			   bb.LOC = 'S.Korea'
WHEN NOT MATCHED THEN 
	INSERT (deptno, dname, loc)
	VALUES (60, '홍길동', 'S.korea'); -- 입력처리됨

MERGE INTO dept11 bb
USING dual
ON (bb.DEPTNO = 70)
WHEN MATCHED THEN 
	UPDATE SET bb.DNAME = '구기리',
			   bb.LOC = 'Japan'
WHEN NOT MATCHED THEN 
	INSERT (deptno, dname, loc)
	VALUES (70, '구기리', 'Japan'); -- 입력처리됨

MERGE INTO dept11 bb
USING dual
ON (bb.DEPTNO = 70)
WHEN MATCHED THEN 
	UPDATE SET bb.DNAME = '김구',
			   bb.LOC = 'S.Korea'
WHEN NOT MATCHED THEN 
	INSERT (deptno, dname, loc)
	VALUES (70, '마오쩌둥', 'China'); -- deptno=70이 위에서 입력처리돼서 업데이트됨

SELECT * FROM dept11;

-- 3) 테이블 간 복사처리
MERGE INTO dept10 aa
USING dept dd
ON (aa.DEPTNO = dd.DEPTNO)
WHEN MATCHED THEN
	UPDATE SET aa.DNAME = dd.DNAME,
			   aa.loc = dd.loc 
WHEN NOT MATCHED THEN
	INSERT (deptno, dname, loc)
	VALUES (dd.deptno, dd.dname, dd.LOC);

SELECT * FROM DEPT10;



-- (강사 풀이) dept10을 기준으로 해서 dept11에 데이터 입력
MERGE INTO dept11 a -- dept11:입력할 테이블
USING dept10 b -- dept10: 기준테이블
ON (a.deptno = b.deptno) -- 입력/수정할 기준 조건 선언
WHEN MATCHED THEN -- 데이터(deptno)가 있으면 기준테이블 내용으로 업데이트
	UPDATE SET a.dname = b.dname, -- 기준 조건 컬럼은 수정에서 제외
			   a.loc = b.loc
WHEN NOT MATCHED THEN 
	INSERT VALUES (b.deptno, b.dname, b.loc);
	-- 데이터(deptno)가 없으면 입력. 부분 컬럼 입력시 insert(입력테이블 컬럼명1, 2, ...) values (기준테이블 데이터1, 2,...)
SELECT * FROM dept11 ORDER BY DEPTNO;
SELECT * FROM dept10;
UPDATE dept10
	SET dname = '회계'
WHERE deptno = 10;
INSERT INTO dept10 VALUES (50,'인사','서울 강남');

/*
 웹 프로그램에서
 	부서번호 [  ]
 	부서명 [  ]
 	부서위치 [  ]
 	 [등록/수정] - 요청 값을 전달해서 자바 프로그램에서 DB를 처리할 때 활용된다.
 */
-- 데이터가 없을 때
MERGE INTO dept11 a
USING dual
ON (a.deptno = 60)
WHEN MATCHED THEN
	UPDATE SET a.dname = 'it사업',
			   a.loc = '서초'
WHEN NOT MATCHED THEN
	INSERT (deptno, dname, loc)
	VALUES (60, 'it사업', '서초');
SELECT * FROM dept11 ORDER BY deptno;
-- 데이터가 있을 때
MERGE INTO dept11 a
USING dual
ON (a.deptno = 30)
WHEN MATCHED THEN
	UPDATE SET a.dname = '영업',
			   a.loc = '개포동'
WHEN NOT MATCHED THEN
	INSERT (deptno, dname, loc)
	VALUES (30, '영업', '개포동');
SELECT * FROM dept11 ORDER BY deptno;
