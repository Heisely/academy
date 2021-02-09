--1. [하]타입변환에서 명시적/묵시적 형변환의 의미를 기술하고, 묵시적 형변환이 일어나는 이유와 해당 예제를 간단한 코드로 기술하세요.
/*
 1) 묵시적 데이터 타입의 변환
 		조건문에서 정확하게 해당 type을 설정하지 않더라도 결과를 검색해주는 경우가 있는데
 		이것은 오라클 시스템 내부에서 내부적으로 타입을 변환했기 때문이다.
 		ex) SELECT *
 			FROM emp
 			WHERE sal>='2000';
 		문제는 시스템에서 index라는 빠르게 검색을 해주는 내용에 대해서는
 		묵시적으로 함수가 적용된 형변환을 했기 때문에 효율적으로 처리하지 못한다.
 		cf) index 책에서 책갈피를 끼워놓으면 빠르게 해당 내용을 찾을 수 있듯이
 			DB시스템 내부에 해당 객체를 설정해서 효과적으로 검색을 빠르게 한다.
 	2) 명시적 데이터 타입의 변환
 		일반적으로 데이터베이스는 변환함수를 이용하여 데이터 타입을 변환하여 효과적으로 처리한다.
 		(1) to_char(문자열로): 숫자/날짜 타입을 문자열로 변환해주는 함수
 		(2) to_number(숫자로): 날짜/문자 타입을 숫자로 변환해주는 함수
 		(3) to_date(날짜로): 문자/숫자 타입을 날짜로 변환해주는 함수
 */

--2. [하]명시적 형변환 3가지의 기본형식과 기본예제를 기술하세요.
/*
 1) to_char(데이터, '출력할 형식')
 		SELECT ename, sal,
	  		   to_char(sal,'9999') "형식1",
	   		   to_char(sal,'0000') "형식2",
	   		   to_char(sal,'$9999') "형식3",
	   		   to_char(sal,'9,999') "형식4",
	   		   to_char(sal,'9,999.999') "형식5"
		FROM emp;
 2) to_number(문자열)
 		SELECT '25'+25, to_number('25')+25 -- 자동 형변환
		FROM dual;
 3) to_date('문자열데이터','형식')
 		CREATE TABLE emp02
		AS SELECT * FROM emp;
		INSERT INTO emp02(ename,hiredate) values('홍길동',to_date('2020-01-01','YYYY-MM-DD'));
		INSERT INTO emp02(ename,hiredate) values('신길동',to_date('2020-12-29 16:30:20','YYYY-MM-DD HH24:MI:SS'));
		INSERT INTO emp02(ename,hiredate) values('김길동',to_date('2020-12-31 23:59:59','YYYY-MM-DD HH24:MI:SS'));
		SELECT * FROM emp02;
 */

--2. [중]매월 첫째주에 입사한 사원의 이름과 년도 입사월과 주,요일을 표기하세요.
SELECT ename 사원명, to_char(hiredate, 'YYYY"년 "MM"월 "W"째주 "DAY" 입사')
FROM emp
WHERE to_char(hiredate,'W')='1';

--3. [중]입사일을 상/하반기로 나누어서 상반기에 입사한 사람의 이름, 입사월, 상하반기구분으로 출력하세요.
-- 		to_number(to_char(hiredate,'Q'))>=3
--		to_number(to_char(hiredate,'MM"))>=7
   SELECT ename, to_char(hiredate,'MM') 입사월
   FROM EMP e
   WHERE to_number( to_char(hiredate,'Q') ) < 3;
  
-- to_char(hiredate,'Q'): 1~4 문자열  
-- to_number()/3: 숫자로 전환해서 1,2 1 미만 / 3,4는 1이상
-- floor(): 소수점 이하 제거. 1,2==>0 / 3,4==>1
   SELECT ename, to_char(hiredate,'MM') 입사월,
         floor(to_number(to_char(hiredate,'Q'))/3) "상하반기 구분"
   FROM emp;
--   WHERE to_number( to_char(hiredate,'Q') ) < 3;

   SELECT ename, to_char(hiredate,'MM') 입사월,
         decode( floor(to_number(to_char(hiredate,'Q'))/3),0,'상반기','하반기') "상하반기구분"
-- floor()값이 0이면 상반기, 1이면 하반기 출력
-- decode(특정 데이터, 첫 번째 경우, 첫 번째 경우 처리할 데이터, 두 번째 경우, 두 번째의 경우 처리할 데이터, 그 외 처리 데이터)
   FROM emp;
   --WHERE to_number( to_char(hiredate,'Q') ) < 3; 
   SELECT ename, to_char(hiredate,'MM') 입사월,
         decode( to_char(hiredate,'Q'),'1','상반기','2','상반기','하반기') "상하반기구분"
   FROM emp;

--4. [하]시간의 문자열 형식을 나열하고, 입사일을 기준으로 @@@@년 @@월 @@일 @@시@@분@@초 형식으로 입사일 표기하세요.
/*
 1) AM/PM: 오전/오후 시간 표시
 2) A.M/P.M: 오전/오후 시각 표시
 3) HH/HH12: 시각(1~12) 표시
 4) HH24: 24시간(0~23) 표시
 5) MI: 분
 6) SS: 초
 */
SELECT ename||'은 '||to_char(hiredate,'YYYY"년 "MM"월 "DD"일 "HH24"시 "MI"분 "SS" 초 입사했다.') "입사일"
FROM emp;

--5. [중] emp03 복사테이블을 만들고 각분기별로 입사한 사원정보를 시간까지 입력하여 등록하고, 
--   YYYY/MM/DD일 @@/4분기에 @@요일 @@:@@:@@ 입사 형식으로 출력하세요.
CREATE TABLE emp03
AS SELECT * FROM emp;
INSERT INTO emp03(ename, hiredate) values('홍길동', to_date('2020-01-01 09:00:40','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emp03(ename, hiredate) values('김길동', to_date('2020-04-23 14:25:12','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emp03(ename, hiredate) values('신길동', to_date('2019-08-06 11:11:11','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emp03(ename, hiredate) values('마길동', to_date('2016-11-23 18:07:30','YYYY-MM-DD HH24:MI:SS'));
SELECT ename, to_char(hiredate, 'YYYY/MM/DD Q"/4분기에 "DAY HH24:MI:SS"입사"')
FROM emp03;





