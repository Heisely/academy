/* 
 1. 조회의 기본 형식을 기술하고, 예제를 통해서 그 의미를 기술하세요.
	SELECT * | 컬럼리스트
	FROM 테이블명
 */
-- 1번 예제1)
SELECT *
FROM emp; -- emp테이블의 전체컬럼 조회
-- 1번 예제2)
SELECT empno 
FROM emp; -- emp 테이블의 empno 컬럼만 조회


/*
 2. 컬럼의 별칭사용 형식을 기술하고, 기본 예제를 통해 기술하세요.
  	- select 컬럼명 as 별칭명, 컬럼명 별칭명
 		1) 기본 테이블에서 지정한 컬럼명 이외에 다른 이름으로 컬럼명을 위 형식으로 처리하면 출력할 수 있다.
 		2) 컬럼명 안에 공백이나 특수문자(#,@)를 활용할 때는 "별칭" 사용
 */
-- 2번 예제)
SELECT empno AS 사원번호, sal "# 연 봉 #"
FROM emp;


/*
3. dbeaver에서 데이터 베이스서버에 연결하는 핵심 정보를 기술하세요.
	- empno, ename, job, MGR, HIREDATE, SAL, COMM, DEPTNO
	1) jdbc 드라이버 설정: 클라이언트 툴에 jdbc 드라이버 설정
		ex) dbeaver: 메뉴(데이터베이스 ==> 드라이버 관리자)
	2) 데이터베이스 서버 연결:
		host: 특정 db서버의 ip주소,
			  현재 사용자(클라이언트) 컴퓨터와 서버위치가 동일하면 localhost
		port: DB서버에 접근할 port  ex) 1521
		database sid: 데이터베이스 식별자  ex) xe
		username: 사용자 계정명  ex) scott
		password: 비밀번호  ex) tiger
 */


/*
4. @@님의 사원번호는 @@이고, 올해 연말보너스는 연봉의 20%인 @@원입니다.
 */
SELECT ename||'님의 사원번호는 '||empno||'이고, 올해 연말 보너스는 연봉의 20%인 '||sal*0.2||'만원 입니다.' show
FROM emp;


/*
5. sql문의 기본 형식을 기술하고, 각 기본 형식에서 활용되는 keyword를 예제별로 기술하세요.
	- 기본 형식:
		SELECT * (또는) 컬럼명
		FROM 테이블명;
	- 명령문 형식:
		1)	SELECT DISTINCT {/컬럼명}
			- distinct: 중복된 데이터 배제 처리
			FROM 테이블명;
		2)	WHERE 조건: 특정 컬럼의 조건
		3)	GROUP BY: 그룹 함수를 사용할 때 그룹핑할 컬럼
		4)	ORDER BY: 정렬할 컬럼
 */
-- 5-1)예제
SELECT DISTINCT sal 
FROM emp; -- emp테이블의 sal컬럼 데이터 중 중복된 데이터 배제처리
-- 5-2)예제
SELECT *
FROM emp 
WHERE sal>=2000; --emp테이블의 모든컬럼 중, sal이 2000이상인 경우만 조회
-- 5-3)예제
SELECT job 직업, max(sal) 최고연봉, min(sal) 최저연봉, round(avg(sal)) 평균연봉
FROM emp
GROUP BY job; --job별로 그룹을 묶어서 최고연봉, 최저연봉, 평균연봉 조회
-- 5-4) 예제
SELECT *
FROM emp 
ORDER BY deptno; -- deptno에 따른 정렬


/*
6. 컬럼명을  별칭명으로 사용할 때, ""를 활용하는 이유는 무엇인가?
	- 컬럼명 안에 공백이나 특수문자(#,@ 등)를 사용할 때 ""를 활용하지 않으면 에러가 일어나기 때문이다.
	  (공백 사용 에러명: SQL Error[923][42000]: ORA-00923: FROM keyword not found where expected)
	  (특수문자 사용 에러명: SQL Error[911][22019]: ORA-00911: invalid character)
 */


/*
7. sql에서 ||와 + 의 차이점을 기술하세요.
	- ||는 문자열형 컬럼과 문자열형 컬럼을 연결, 혹은 숫자형 데이터까지도 연결할 수 있고, ''를 이용하여 문장을 삽입할 수 있다.(특수문자, 공백은 "" 사용)
	  +는 숫자형 데이터간의 계산을 할 때 쓰인다	
 */


/*
8. sql을 이용하여 "@@번 부서의  사원 @@@(사원번호)의 현재 연봉은 @@ 만원입니다." 를 한 라인으로 출력하되, 연봉이 3000이상인 사원만 출력되게 하세요.
 */
SELECT deptno || '번 부서의 사원 '||empno||'의 현재 연봉은 '||sal||'만원입니다.' show
FROM emp
WHERE sal>=3000;