/*
 # 중첩함수
 1. 가장 내부에 있는 함수 f1의 결과값ㅇ블 다음 함수 f2의 인수로 적용하고
 	다시 f2의 결과값을 f3의 인수로 사용할 때 활용하는 함수형태
 	f3(f2(f1(데이터, 매개변수),매개변수),매개변수)
 	- 특정한 데이터에서 여러가지 함수의 기능을 처리하고자 할 때 사용
 */
-- 현재 데이터의 입사연도를 올해 연도로 변경하여 출력
SELECT ename, to_char(sysdate,'YYYY') "올해연도", to_char(hiredate,'MMDD') "사원의 입사월일",
	   to_char(sysdate,'YYYY')||to_char(hiredate,'MMDD') "올해의 입사년월일",
	   to_date( to_char(sysdate,'YYYY')||to_char(hiredate,'MMDD'))"날짜형데이터"
FROM emp;
-- ex) 입사일의 분기를 추출하여 해당 보너스의 기준으로 설정하려고 한다.
--		1) 입사일, 분기, 급여
--		2) 분기 1 ==> 10% / 2 ==> 20% / 3 ==> 30% / 4 ==> 40%
-- 		3) 급여와 연산하여 보너스 금액 출력하기
--		to_char(@@@,'Q'), 숫자형데이터 to_number()
SELECT hiredate "입사일", to_char(hiredate,'Q') "입사분기", sal "급여",
	   to_number(to_char(hiredate,'Q'))*10||'%' "보너스(%)",
	   to_number(to_char(hiredate,'Q'))*0.1*sal "보너스",
	   to_number(to_char(hiredate,'Q'))*0.1*sal+sal "총급여"
FROM emp;


/*
 # 일반 함수
 1. nvl(데이터, null값일 때 처리할 데이터)
 	- 해당 데이터가 null값일 때, 처리할 데이터를 설정하므로 null에 대한 연산처리시 필요
 2. nvl2(데이터, null이 아닐 때 처리할 데이터, null일때 처리할 데이터)
 3. nullif(데이터1,데이터2)
 	1) 매개변수로 받는 두 개의 데이터를 비교하여 동일하면 null을 반환하고, 동일하지 않으면 데이터1을 반환처리하는 함수
 */
-- nvl
SELECT ename, sal, comm, sal+comm, nvl(comm,0), sal+nvl(comm,0)
FROM emp;
-- nvl2: comm이 null일때는 100으로 설정하고, null이 아닐때는 comm에서 10% 추가해서 결과값 처리
SELECT ename, sal, comm, nvl2(comm, comm*1.1, 100) "보너스" FROM emp;
-- ex1) comm이 null일때는 sal의 15%로 설정하고, null이 아닐 때는 comm에서 sal의 5%를 더하여 보너스 금액을 설정. 사원명,연봉,보너스를 출력하세요
SELECT ename, sal, comm, nvl2(comm, comm+sal*0.05, sal*0.15) "보너스" FROM emp;
-- nullif
SELECT nullif('a','a') show1, nullif('a','b') show2, nvl(NULLIF('a','a'),'동일') show3, nvl(NULLIF('a','b'),'동일') show4
FROM dual;
-- ex) 회사에서 일괄 보너스 지급 금액을 60으로 정하는데, 연봉의 5%와 같으면 60, 다르면 연봉의 5%로 처리하는 sql을 작성하세요.
SELECT ename, sal, trunc(sal*0.05, -1) "연봉의 5%",
	   NULLIF(trunc(sal*0.05,-1),60) "null 여부", nvl(NULLIF(trunc(sal*0.05,-1),60),60) "일괄보너스"
FROM emp;


/*
 # decode 함수
 1. 프로그래밍 언어의 if문이나 case문으로 표현되는 내용을 하나의 함수로 처리할 수 있게 해준다.
 2. 기본형식
 	decode(데이터1, case1, case1 data,
 				  case2, case2 data,
 				  case3, case3 data, default data)
 */
SELECT ename, deptno, decode(deptno, 10, '인사과', 20, '총무과', 30, '회계과', '부서미선정') 부서명
FROM emp;
-- ex) 사원번호를 기준으로 짝수이면 홍팀, 홀수이면 청팀으로 처리해 출력하기
SELECT ename, empno, decode(MOD(empno,2), 0, '홍팀','청팀') 팀
FROM emp;

/*
# 일반함수 case
1. decode의 확장된 함수 형식을 표현식 또는 컬럼 값 '=' 비교를 통해 조건에 일치하는 경우에만 다른 값으로 대치하지만,
   case 함수에서는 산술 연산, 관계 연산, 논리 연산과 같은 다양한 비교가 가능하다.
2. 기본 형식
	case [컬럼명]
		when 논리|산술|관계 then 처리할 데이터,
		when 논리|산술|관계 then 처리할 데이터,
		else 기타 처리할 데이터
	end   
*/
-- 부서 번호에 따라 처리하는 데이터를 다르게 할 때
SELECT ename, deptno, sal,
	CASE WHEN deptno = 10 THEN sal*0.2
		 WHEN deptno = 20 THEN sal*0.5
		 WHEN deptno = 30 THEN sal*0.7
		 ELSE sal*1.2
	END show
FROM emp;
SELECT ename, deptno, sal,
	CASE deptno
		WHEN 10 THEN sal*0.2
		WHEN 20 THEN sal*0.5
		WHEN 30 THEN sal*0.7
		ELSE sal*1.2
	END show
FROM emp
ORDER BY deptno;
-- ex) case문을 이용하여 분기별로 보너스 금액을 0.1, 0.2, 0.3, 0.4로 지정하여
-- 	   사원명, 입사일, 입사분기, 급여, 보너스를 출력하세요
SELECT ename 사원명, hiredate 입사일, to_char(hiredate,'Q') 입사분기, sal 급여,
	CASE WHEN to_char(hiredate,'Q')=1 THEN sal*0.1
		 WHEN to_char(hiredate,'Q')=2 THEN sal*0.2
		 WHEN to_char(hiredate,'Q')=3 THEN sal*0.3
		 ELSE sal*0.4
	END 보너스
FROM emp;
SELECT ename 사원명, hiredate 입사일, to_char(hiredate,'Q') 입사분기, sal 급여,
	CASE to_char(hiredate,'Q') 
		WHEN '1' THEN sal*0.1
		WHEN '2' THEN sal*0.2
		WHEN '3' THEN sal*0.3
		ELSE sal*0.4
	END 보너스
FROM emp
ORDER BY to_char(hiredate,'Q');
-- 급여별 등급 표기(조건-비교연산자활용)
SELECT ename, sal,
	CASE WHEN sal>=5000 THEN 'A등급'
		 WHEN sal>=4000	THEN 'B등급'
		 WHEN sal>=3000	THEN 'C등급'
		 WHEN sal>=2000	THEN 'D등급'
		 WHEN sal>=1000	THEN 'E등급'
		 ELSE 'F등급'
	END "급여등급"
FROM emp;




