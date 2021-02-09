--1. 숫자형 함수의 종류와 기능상 특징을 기술하세요.
/*
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

--2. 부서 번호를 %로 해서, 10 ==> 10%, 20==>20%..
--   보너스를 정하여, sal기준으로 원금+보너스 합산을 출력하되,
--   10자리단위로 반올림 처리하여 출력하세요
--   사원명, 급여, 보너스(%), 보너스, 총계
SELECT ename 사원명, sal 급여, deptno||'%' "보너스(%)", (sal*(deptno/100)) 보너스, round(sal+sal*(deptno/100),-1) 총계
FROM emp;

--3. 사번이 짝수인 사원의 사번과 이름과 급여를 출력하되, 급여는 100자리 수로 절삭하여 처리하세요.
SELECT empno 사번, ename 이름, round(sal,-2) 급여
FROM emp
WHERE mod(empno, 2)=0;

--4. floor와 trunc의 차이점을 기본 예제로 설명하세요.
/*
 floor는 정수표현, trunc는 소숫점이하 절삭처리이므로 소숫점이하까지 표현 가능
 */
SELECT 5734.24599, trunc(5734.24599,2), floor(5734.24599)
FROM dual;

--5. 날짜형 데이터에 증감단위를 일, 월, 년을 정할 때, 사용되는 연산자와 함수 또는 연산자+함수 조합으로 처리되는 내용을 예제로 기술하세요.
/*
 1) 날짜 +/- 숫자: 해당 일자의 일수를 가산/감산 하여 처리
 2) 날짜 +/- 1/24: 시간단위 연산처리
 3) months_between(날짜데이터1, 날짜데이터2): 날짜와 날짜 사이의 개월을 계산
 4) add_months(날짜데이터, 추가개월): 날짜에 개월을 더한 날짜 계산
 5) 연수는 365일을 기준으로 일수계산
 */
SELECT ename, hiredate "입사일", hiredate+1 "입사 후 1일",
	   add_months(hiredate, 1) "입사 후 한 달", add_months(hiredate, 12) "입사 후 일년", add_months(hiredate,12*10) "입사 후 10년"
FROM emp;

--6. 사원, 이름과 입사후 300일 날짜, 지금까지 근무연한(일년 - 365 기준)를 출력
SELECT ename 사원명, hiredate 입사일, hiredate+300 "입사 300일 후", floor(MONTHS_BETWEEN(sysdate, hiredate)/12) 근무연한1,
	   floor((sysdate-hiredate)/365) 근무연한2
FROM emp;

--7. 오늘을 1일로, 1000일 후 개월수, 10000 후 년수를 출력하세요.
SELECT sysdate 오늘, floor(MONTHS_BETWEEN(sysdate+1000, sysdate)) "1000일 후 개월수", floor(MONTHS_BETWEEN(sysdate+10000, sysdate)/12) "10000일 후 연수"
FROM dual;
