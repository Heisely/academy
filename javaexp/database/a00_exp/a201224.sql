-- # 주간정리과제
--1. 컬럼과 테이블의 별칭에 대하여 예제를 통해서 기술하세요.
/*  select 컬럼명 as 별칭명, 컬럼명 별칭명
 	1) 기본 테이블에서 지정한 컬럼명 이외에 다른 이름으로 컬럼명을 위 형식으로 처리하면 출력할 수 있다.
 	2) 컬럼명 안에 공백이나 특수문자(#,@)를 활용할 때는 "별칭" 사용
 */
SELECT empno AS "사원 번호", ename 사원명, sal "# 연봉 #"
FROM emp;
SELECT * FROM emp;

--2. 아래의 형식으로 emp 테이블을 출력하세요.
--    사원명(사원번호)의 급여는 @@, 보너스는 @@ 합계 @@ 이다.
SELECT ename||'('||empno||')의 급여는 '||sal||', 보너스는 '||nvl(comm,0)||', 합계 '||(sal+nvl(comm,0))||'이다.' "12월 24일 sql 예제2"
FROM emp;

--3. sql 명령문의 표준 형식을 간단한 예제를 통해서 설명하세요.
/*
 sql 명령문
 	select distinct { /컬럼명}
 		- distinct: 중복된 데이터 배제 처리
 	from 테이블명
 	where 조건: 특정 컬럼의 조건
 	group by: 그룹함수를 사용할 때, 그룹핑할 컬럼
 	order by: 정렬할 컬럼
 */
-- distinct : 중복배제
SELECT DISTINCT MGR 
FROM emp;
-- where 조건: 특정 컬럼의 조건
SELECT *
FROM emp
WHERE deptno=10; -- database에서는 =, >=, <, >, !=
-- group by: 그룹핑할 컬럼
SELECT job, max(SAL) "최고 연봉"
FROM emp
GROUP BY JOB;
-- order by: 정렬
SELECT * 
FROM EMP
ORDER BY sal;

--4. sql에서 null이란 무엇을 의미하는지 기술하고, null인 컬럼과 그렇지 않는 컬럼을 구분하세요.
-- 데이터가 할당되지 않은 경우를 의미
-- 컬럼명 is null: 해당 컬럼에 데이터가 할당되지 않은 경우
SELECT sal, comm
FROM emp 
WHERE comm IS NULL;
-- 컬럼명 is not null: 해당 컬럼에 데이터가 할당된 경우
SELECT * FROM emp 
WHERE comm IS NOT NULL;

--5. sql의 논리연산자와 비교연산자를 구분하여 기술하세요.
/*
 논리연산자: AND/OR/NOT 등 논리적으로 필요할 시 사용
 비교연산자: +, =, !=, <>, !>, !<, >, <, >=, <=, BETWEEN, IS NULL 등 데이터값 비교시 사용
 */

--6. 데이터베이스에서 사용하는 데이터 타입의 종류를 기술하세요.
/*
	1) varchar2(최고크기):
		- 사용하는 최고크기를 설정하고 입력되는 데이터에 따라 가변적으로 데이터크기가 설정됨
		- 최대 4000바이트 - 메모리효율화를 이룰 수 있다.
	2) number, number(p,s):
		- 정수/실수 등 숫자형 데이터를 설정할 때 활용된다.
		- 정밀도(p)와 스케일(s)로 표현된다.
		- 전체크기, 소숫점 이하 크기로 쉽게 표현한다.
	3) date: 날짜/시간 형식을 저장하기 위한 데이터 타입
	4) char(고정크기):
		- 고정길이 문자 데이터 타입, 최대 2000바이트
		- 코드성 데이터. 즉, 학번/사번/주민번호 등과 같이 길이가 일정하여 변경될 일이 없는 경우 사용된다.
		- 가변형에 비해 입력속도가 빠르다.
	-----------------------------------------------------------------------------------
	5) nvarchar2(최고크기): 국가별 문자 집합에 따른 최고 크기의 문자를 설정하는 가변형 데이터처리
	6) rowid: 테이블 내 행의 고유 주소를 가지는 64진수 문자타입. 행당 6바이트 또는 10바이트
	7) blob: 대용량의 바이너리 데이터를 저장하기 위한 데이터타입, 최대 4GB
	8) clob: 대용량의 문자열 데이터를 저장하기 위한 데이터타입, 최대 4GB
	9) bfile: 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입, 4GB
	10) timestamp(n): 날짜형 데이터타입의 확장된 형태
					  n은 millisecond. 자릿수는 최대 9자리까지 표현 가능
 */

--7. 위 데이터 타입을 이용하여 
--    학번, 이름, 전공, 주소, 학년, 입학일 의  테이블을 구성하고, 데이터를 입력하세요.
CREATE TABLE sch(
	sid char(8),
	name varchar2(30),
	major varchar2(30),
	ad varchar2(30),
	enterdate date
);
INSERT INTO sch values('20202037','홍길동','수학과','서울특별시 성북구','2020-03-04');
INSERT INTO sch values('20191754','김길동','컴퓨터공학과','경기도 의정부시','2019-09-02');
INSERT INTO sch values('20191877','신길동','기계공학과','대구광역시 북구','2019-03-04');
SELECT * FROM sch;

--8. 함수란 무엇이며, 함수에 단일행 함수와 다중행 함수의 차이점을 예시를 통해서 설명하세요.
/*
 # database에서 함수(function)
 1. sql에서 함수(주로 내장함수)
 	1) 컬럼의 값이나 데이터 타입을 변경하는 경우
 	2) 숫자 또는 날짜 데이터의 출력 형식을 변경하는 경우
 	3) 하나 이상의 행에 대한 집계(aggregation)를 하는 경우
 2. sql 함수의 유형
 	1) 단일 행 함수: 테이블에 저장되어 있는 개별 행을 대상으로 하는 함수를 적용하여 하나의 결과를 반환하는 함수
 	2) 복수 행 함수: 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩 반환하는 함수 
 3. 단일행 함수
 	1) 데이터 값을 조작하는데 주로 사용한다.
 	2) 행별로 함수를 적용하여 하나의 결과를 반환하는 함수이다.
 	3) 단일행 함수의 종류
 		문자함수, 숫자함수, 날짜함수,
 		변환함수(묵시적데이터변환/명시적데이터변환 - 문자==>숫자, 숫자==>날짜, 날짜==>문자),
 		일반함수
 4. 단일행 함수의 사용법
 	SELECT 함수명(컬럼명/데이터, 매개변수1, 매개변수2, ...)
 	WHERE 컬럼명 = 함수명(컬럼명/데이터, 매개변수1, 매개변수2, ...)
 */
-- 단일행 함수
SELECT ename, comm, nvl(comm, 0) 보너스2
FROM emp;
-- 복수행 함수
SELECT deptno, max(sal) "부서별 최고 연봉"
FROM emp 
GROUP BY deptno;

--9. 문자 함수가 사용되는 용도에서 웹화면에 물품명을 대소문자 관련없이 검색한다고 가정할 때,
--    product(테이블명), pname(검색할 물건명) 을 기준으로 sql을 작성하세요.
CREATE TABLE product(
	pname varchar2(30),
	price number
);
INSERT INTO product values('apple', 3000);
INSERT INTO product values('green apple', 2500);
INSERT INTO product values('water mellon', 8000);
SELECT * FROM product;
SELECT *
FROM product
WHERE upper(pname) LIKE upper('%apple%');

--10. length와 lengthb를 차이를 기술하고,  dual을 이용해서 한글과 영문을 비교하세요.
/*
 1. length: 입력되는 문자열의 길이(글자수)를 반환하는 함수
 2. lengthb: 입력되는 문자열의 바이트를 반환하는 함수
 * 한글이나 특수문자는 1글자의 바이트가 3bytes인 경우가 있어서 글자수와 byte수의 차이가 있다.
 * dual: 오라클에서 지원되는 가상테이블로, 테스트용으로 한 라인에 데이터와 함수를 적용할 때 사용된다.
 */
SELECT '안녕하세요' greet, 'hello' greet2 FROM dual;
SELECT '안녕하세요' 기본출력, LENGTH('안녕하세요') "length(한)", lengthb('안녕하세요') "lengthb(한)",
		length('Hello!') "length(영)", lengthb('Hello!') "lengthb(영)"
FROM dual;

--11. ||, substr  이용하여  [ename(deptno)의 직책은 job 입니다. ] 형식으로 출력하세요.   
--    ename : 앞에서 3자 추출
--    job :뒤에서 5자 추출
SELECT '['||substr(ename,1,3)||'('||deptno||')의 직책은 '||substr(job,-5,5)||'입니다. ]'
FROM emp;

--12. lpad와 ltrim의 기본적인 형식을 기본예제와 함께 기술하세요.
-- lpad(컬럼/데이터, 지정한크기, 덧붙일문자열): 왼쪽에 문자열 덧붙이기
SELECT lpad(ename,9,'#')
FROM emp;
-- ltrim: 왼쪽 지정 문자 삭제 처리
SELECT ltrim('****sql****','*') s1
FROM dual;