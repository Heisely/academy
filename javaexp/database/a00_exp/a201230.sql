--[하]1. nvl2, nullif의 기본형식을 예제를 통해 기술하세요
/*
 nvl2(데이터1, null이 아닐 때 처리할 데이터, null일 때 처리할 데이터)
 nullif(데이터1, 데이터2): 매개변수로 받는 두 개의 데이터를 비교하여 동일하면 null, 아니면 데이터1값 반환
 */
-- nvl2 예제
SELECT ename, sal, comm, nvl2(comm, comm*1.1, 100) "보너스"
FROM emp;
-- nullif 예제
SELECT nullif('a','a') show1, nullif('a','b') show2, nvl(NULLIF('a','a'),'동일') show3, nvl(NULLIF('a','b'),'동일') show4
FROM dual;

--[중]2. deptno가 30이면 보너스는 sal 기준 100%, 그외에는 deptno로 보너스를 처리하고자 한다.
--      이름, 부서번호, 보너스(%), 보너스 를 출력하세요
-- nullif(deptno,30): deptno와 30을 비교해서 같으면 null, 다르면 deptno 출력 처리
-- nvl(nullif(deptno,30),100): 중첩함수 적용해서 deptno가 30이면 100, 그 외에는 deptno 데이터 로딩
-- sal*(nvl(nullif(deptno,30),100)/100): %를 연산 표기
SELECT ename, deptno, decode(deptno, 30, 100, deptno)||'%' "보너스(%)", decode(deptno,30,sal,sal*deptno/100) 보너스
FROM emp;
SELECT ename, deptno, sal, nullif(deptno, 30), nvl(NULLIF(deptno,30),100)||'%' "보너스(%)", sal*(nvl(nullif(deptno,30),100)/100) "보너스"
FROM emp;
--[하]3. decode함수의 기본형식을 예제를 통해 기술하세요.
/*
 decode(데이터, case1, case1일 때 반환할 data,
 			  case2, case2일 때 반환할 data,
 			  case3, case3일 때 반환할 data, default(어떤 케이스도 아닐 때 값))
 */
-- decode 예제
SELECT ename, deptno, decode(deptno, 10, '인사과', 20, '총무과', 30, '회계과', '부서미선정') 부서명
FROM emp;

--[중]4. hiredate기준  상반기(1~6), 하반기(7~12) 하여 sal 기준으로 보너스를 100%, 200%
--      처리하고자 한다. 중첩함수 이용해서 출력하세요
--      사원명, 상/하반기구분(보너스%), 급여, 보너스
-- to_char(hiredate,'MM'): hiredate에서 월 출력
-- floor(to_number(to_char(hiredate,'MM'))/7): 7미만은 0, 7이상은 1
-- decode(floor(to_number(to_char(hiredate,'MM'))/7),0,'상반기','하반기'): 0,1 기준으로 상/하반기 구분
-- decode(floor(to_number(to_char(hiredate,'MM'))/7),0,sal*1, sal*2): 보너스를 기준으로 상반기는 sal의 100%, 하반기는 200% 설정 처리
SELECT ename "사원명",
	   decode(to_char(hiredate, 'Q'),'1','상반기','2','상반기','하반기') "상/하반기 구분",
	   decode(decode(to_char(hiredate, 'Q'),'1','상반기','2','상반기','하반기'),'상반기',100,200) "보너스%",
	   sal "급여",
	   sal*decode(decode(to_char(hiredate, 'Q'),'1','상반기','2','상반기','하반기'),'상반기',100,200)/100 "보너스"
FROM emp;
SELECT ename, hiredate,
	   to_number(to_char(hiredate,'MM')) 월,
	   decode(floor(to_number(to_char(hiredate,'MM'))/7),0,'상반기','하반기') "상/하반기 구분"
	   decode(floor(to_number(to_char(hiredate,'MM'))/7),0,sal*1, sal*2) 보너스

--[하]5. sal를 기준으로 5000이상 A등급, 4000이상 B등급, 3000이상 C등급, 2000이상 D등급, 
--      1000이상 E등급, 1000미만 F등급으로 급여등급표기하세요
--      사원명, 급여, 등급
SELECT ename "사원명", sal "급여", decode(trunc(sal/1000), 0,'F', 1,'E', 2,'D', 3,'C', 4,'B', 'A')||'등급' "등급"
FROM emp;
