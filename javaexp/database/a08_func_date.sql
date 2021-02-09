/*
# 날짜 함수
1. 날짜형 데이터 타입에 사용하는 함수
2. 기본연산
	1) 날짜 +/- 숫자: 해당 일자의 일수를 가산/감산 하여 처리
	2) 날짜 +/- 1/24: 시간단위 연산처리
	   1일이 24시간이기 때문에 5시간 이후인 경우, 날짜 + 5/24로 처리한다.
	cf) sysdate 현재 날짜 시간을 나타낸다.
 */
SELECT sysdate "현재 날짜와 시간",
	   sysdate+1 "내일 현재 시간",
	   sysdate-1 "어제 현재 시간",
	   sysdate+(8/24) "현재시간에서 8시간 후"
FROM dual;
-- 사원명과 입사일, 입사후 120일 후 인턴기간, 입사 8시간전, 근무일수 시간을 출력하세요
SELECT ename 사원명, hiredate 입사일, hiredate+120 "3달 인턴 종료", hiredate-(8/24) "입사 8시간 전",
	   sysdate 현재일시, sysdate-hiredate 근무일수1, floor(sysdate-hiredate) 근무일수2 
FROM emp;
-- 소수점 이하로 시간이 나오기 때문에, 나머지 시간을 절삭처리 (floor(sysdate-hiredate))
/*
# 날짜 함수
1. sysdate: 오라클 서버시스템의 현재 날짜와 시간
2. months_between(날짜데이터1, 날짜데이터2): 날짜와 날짜 사이의 개월을 계산
	1개월 = 1, 15일 = 0.5를 기준으로 하여 날짜/시간/분/초 등을 소숫점으로 계산한다. 
 */
SELECT ename 사원명, hiredate 입사일, MONTHS_BETWEEN(sysdate, hiredate) "근무 개월1",
	   floor(MONTHS_BETWEEN(sysdate, hiredate)) "근무 개월2",
	   floor(MONTHS_BETWEEN(sysdate, hiredate)/12) "근무 연한"
FROM emp;
-- ex1) dual 테이블로 오늘을 1일로 해서 만난 지 100일후, 1000일후 날짜와 10년 뒤 날짜 출력
SELECT sysdate "오늘", sysdate+100 "100일 후", sysdate+1000 "1000일 후", sysdate+3650 "10년 뒤"
FROM dual;
-- ex2) emp 테이블에서 근무개월이 470~480사이인 데이터를 출력하세요.
SELECT ename, hiredate, sysdate, floor(MONTHS_BETWEEN(sysdate, hiredate)) 근무개월
FROM emp
WHERE MONTHS_BETWEEN(sysdate, HIREDATE) BETWEEN 470 AND 480;
-- 함수를 이용해서 조건문의 데이터를 조회할 때 활용
/*
3. add_months(날짜데이터, 추가개월): 날짜에 개월을 더한 날짜 계산
 */
SELECT sysdate, ADD_MONTHS(SYSDATE, 3) "3개월 후" FROM emp;
-- ex) 사원번호는 부서별 업무파악을 난이도에 따라 3개로 분류한다. 바로 파악되는 것은 0, 1개월 1, 2개월 2로 사원번호에서 나머지값으로 처리했다.(사원번호/3)
--	   입사해서 업무파악 만료일을 출력하세요.
--	   사원번호 사원명, 업무파악난이도, 입사일, 업무파악만료일
SELECT empno "사원번호", ename "사원명", mod(empno, 3) "업무파악난이도", hiredate "입사일", add_months(hiredate, mod(empno,3)) "업무파악만료일"
FROM emp;