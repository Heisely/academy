/*
 # 그룹 함수
 1. 테이블의 전체 행을 하나 이상의 컬럼을 기준으로 그룹화하여 그룹별로 결과를 출력하는 함수
 	그룹함수는 통계적인 결과를 출력하는데 자주 사용
 2. 기본형식
 	SELECT 컬럼명, 그룹함수()
 	FROM 테이블명
 	WHERE 조건문
 	GROUP BY 그룹할 컬럼
 	HAVING 그룹함수의 조건
 3. 그룹함수의 종류
 	count(): 행의 갯수
 	max, min, sum, avg
 	stddev(표준편차), variance(분산): 데이터 분포의 밀집도
 	grouping: 해당 컬럼의 그룹화 사용 여부(1/0)
 	grouping sets: 한 번의 질의로 여러 그룹화하는 기능.
 */
-- ex) 부서별 인원수
SELECT deptno, count(*) 인원
FROM emp 
GROUP BY deptno 
ORDER BY deptno;
-- ex1) job별 인원수 출력
SELECT job, count(*) 인원
FROM emp 
GROUP BY job 
ORDER BY job;
-- ex) 입사분기별로 인원수 출력
SELECT to_char(hiredate,'Q') "분기", count(*) 인원
FROM emp 
GROUP BY to_char(hiredate,'Q')
ORDER BY to_char(hiredate,'Q');

/*
# avg(컬럼): 평균값
  sum(컬럼): 합산값
  min(컬럼): 최소값
  max(컬럼): 최대값
  stddev(컬럼명): 표준편차
  variance(컬럼명): 분산
 */
SELECT deptno, count(*) 건수, round(avg(sal),1) "평균", sum(sal) "총합",
	   min(sal) "최소연봉", max(sal) "최대연봉", stddev(sal) "표준편차", variance(sal) "분산"
FROM emp 
GROUP BY deptno
ORDER BY deptno;
-- ex1) 부서별로 가장 최근에 입사한 사람의 입사일과 입사일이 가장 오래된 입사일을 출력하세요.
SELECT ename, hiredate, deptno
FROM emp 
WHERE (deptno, hiredate)
	  in(SELECT deptno, max(hiredate)
	  	 FROM emp
	  	 GROUP BY deptno)
ORDER BY deptno;

SELECT deptno, min(hiredate) "가장오래된입사일", max(hiredate) "가장최근입사일"
FROM emp
GROUP BY deptno
ORDER BY deptno;

/*
# rollup
1. GROUP BY절과 같이 사용되며, GROUP BY 절에 의해 그룹 지어진 집합 결과에 대해 좀 더 상세한 정보를 반환하는 기능 수행.
2. 그룹 데이터와 데이터의 총계를 구할 수 있다.
 */
-- job별 급여 합계
SELECT job, sum(sal)
FROM emp 
GROUP BY job;
-- 급여 합계의 총계를 다시 구할 때
SELECT job, sum(sal)
FROM emp 
GROUP BY rollup(job);
-- 부서와 직책별 급여와 데이터 건수
-- 그룹할 컬럼이 2개일 때, group by에 컬럼명1, 컬럼명2
SELECT deptno, job, sum(sal) "합계", count(*) "데이터건수"
FROM emp 
GROUP BY deptno, job
ORDER BY deptno, job;
-- 각각의 상위 항목별 통계치와 전체 통계치를 처리할 때 rollup을 활용한다
SELECT deptno, job, sum(sal) "합계", count(*) "데이터건수"
FROM emp 
GROUP BY ROLLUP(deptno, job)
ORDER BY deptno, job;

/*
# cube: rollup에서 전체데이터 summary 기능을 포함할 때 활용된다
 */
SELECT deptno, job, sum(sal) "합계", count(*) "데이터건수"
FROM emp 
GROUP BY cube(deptno, JOB)
ORDER BY deptno, job;







