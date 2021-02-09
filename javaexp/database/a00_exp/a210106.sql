--[하] 1. self 조인이란 무엇인가? 개념을 기술하세요.
--한 테이블 연관 관계가 있는 컬럼들을 Join 형식으로 데이터 처리하는 것을 self 조인이라 한다.

--[중] 2. company테이블을 만들고 아래와 같은 직책과 상위 관리자를 만들어 
--         @@@님의 현재 직잭은 @@이고 직속상관은 @@@이며 @@직책에 있다. 출력하세요.
CREATE TABLE company(
	NO NUMBER,
	name varchar2(50),
	job varchar2(30),
	mgr number
);
INSERT INTO company values(1, '김진숙', '사장', 0);
INSERT INTO company values(2, '이중석', '부사장', 1);
INSERT INTO company values(3, '신민숙', '이사', 2);
INSERT INTO company values(4, '김민아', '부장', 3);
INSERT INTO company values(5, '김철용', '과장', 4);
INSERT INTO company values(6, '이시민', '차장', 5);
INSERT INTO company values(7, '최영희', '대리', 6);
INSERT INTO company values(8, '홍길동', '사원', 7);
SELECT a.name||'님의 현재 직책은 '||a.job||'이고 직속상관은 '||b.name||'이며 '||b.job||'직책에 있습니다.' SHOW
FROM company a, company b
WHERE a.mgr = b.NO;

--[하] 3. sub query란 무엇인가? 기본 예제를 통해 개념을 설명하세요.
-- 하나의 sql 명령문의 결과를 이를 포함하고 있는 상위 sql명령문에 전달하기 위해
-- 두 개 이상의 sql명령문을 상위 sql명령문과 연결하여 처리하는 방법을 말한다.
-- 사원명 ALLEN의 직책과 같은 사원의 정보를 출력
SELECT *
FROM emp 
WHERE job = (SELECT job
			 FROM emp
			 WHERE ename = 'ALLEN');
-- 이름이 ALLEN인 사람의 직업과 같은 사람의 정보를 출력한다.

--[하] 4. 단일행과 다중행 subquery의 차이점은 무엇인가 기술하세요.
/*
 단일행 서브쿼리는 단 하나의 행을 검색해서 메인 쿼리에 변환하는 질의문이고,
 다중행 서브쿼리는 서브쿼리에서 실행한 결과값이 1행 이상일 때 사용하는 쿼리이다.
 즉, 도출하고자 하는 결과값의 행의 갯수에 따라 사용할 서브쿼리의 종류와 방법이 달라진다.
 */
			
--[중] 5. 1981년 1~2사분기에 입사한 사람 중에서 가장 급여가 높은 사람보다 많은 사원의 정보를 출력하세요.
SELECT *
FROM emp
WHERE sal > (SELECT max(sal) FROM emp
			 WHERE to_char(hiredate,'Q') IN ('1', '2'));

--[하] 6. 다중행 subquery의 연산자에 대하여 차이점을 기술하세요.
/*
 in: 결과값이 or 조건으로 처리해야할 필요가 있는 경우 사용
 any, some: 결과값이 1개라도 있는 경우
 all: 모든 결과값이 일치하는 경우
 exist / not exist: 해당 subquery 값이 존재하는 경우 / 존재하지 않는 경우
 */