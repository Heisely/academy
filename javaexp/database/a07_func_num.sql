/*
# 숫자형 처리함수
1. 숫자형 데이터를 원하는 형태로 수학적 처리나 연산을 처리해주는 함수를 말한다.
2. 종류
	1) round: 지정한 소숫점 자리로 반올림 처리를 해준다.
		round(데이터, 자릿수)
		자릿수: +값은 소숫점 이하 자리수를 말한다.
			ex) round(45.2432, 2) ==> 45.24
			  -값은 소숫점 기준으로 10, 100, 1000 단위로 처리해준다. 10단위 이상의 자릿수 반올림 처리
			ex) round(2456435, -3) ==> 2456000
	2) trunc: 지정한 소숫점 자리까지 남기고 절삭처리
	3) mod: 데이터베이스에서 산술연산자 %대신 쓰이는 나머지 처리함수
		mod(데이터, m): 데이터를 m으로 나눈 나머지값
			ex) mod(10,3)==>1
	4) ceil: 지정한 값보다 큰 수 중에서 가장 작은 정수
			 소숫점 이하의 내용에 대하여 올림 정수
	5) floor: 지정한 값보다 작은 수 중에서 가장 큰 정수
			  소숫점 이하의 내용에 대하여 내림 정수
 */
SELECT ROUND(222452.7552,2) FROM dual;
SELECT ROUND(222452.7552) FROM dual;
SELECT ROUND(222452.7552,-3) FROM dual;
SELECT * FROM emp;
-- ex1) sal의 15% 인상 금액을 100자리 단위와 소숫점 1자리 단위로 출력하기
SELECT sal 연봉, sal*1.15 "15% 인상 연봉", round(sal*1.15,-2) "15% 인상 연봉1", round(sal*1.15,1) "15% 인상 연봉2"
FROM emp;
-- 절삭 처리
SELECT trunc(5734.24599,2) FROM dual;
SELECT trunc(5734.24599) FROM dual;
SELECT trunc(5734.24599,-2) FROM dual;
-- ex2) 급여를 부서번호 기준으로 올해 인상분을 %로 지정한다고 할 때, 100자리 단위 절삭과 소숫점2자리 절삭을 출력하기
SELECT sal, deptno, sal*deptno/100 인상분1, trunc(sal*deptno/100, 2) 인상분2, trunc(sal*deptno/100, -2) 인상분3, trunc(sal+sal*(deptno/100), 2) 총계
FROM emp;
-- mod
SELECT mod(10,3) 예제1, mod(10,2) 예제2 FROM dual;
-- 사번이 짝수인 데이터를 출력하기
SELECT *
FROM emp
WHERE mod(empno,2)=0;
-- ceil & floor
SELECT ceil(25.75) "올림 정수", floor(25.75) "내림 정수"
FROM dual;
-- ex) sal과 comm의 합산한 금액에 5% 향상된 최종 금액을 내년 급여로 선정하였다고 한다. 소숫점 이하 올림금액, 내림금액을 출력하세요.
SELECT sal "올해 연봉", nvl(comm, 0) "올해 상여금",
		(sal+nvl(comm,0))*1.05 "내년 연봉", ceil((sal+nvl(comm,0))*1.05) "올림 금액", floor((sal+nvl(comm,0))*1.05) "내림 금액"
FROM emp;