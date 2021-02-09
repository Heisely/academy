--[하] 1. 직책별로 급여가 가장 많은 사람과 가장 적은 사람을 출력하세요
SELECT job, max(sal), min(sal)
FROM emp
GROUP BY job;

--[중] 2. 월별로 평균 급여를 출력하세요.
SELECT to_char(hiredate, 'MM')||'월' 입사월, ROUND(avg(sal),1) 평균급여 
FROM emp
GROUP BY to_char(hiredate, 'MM')
ORDER BY to_char(hiredate, 'MM');

--[중] 3. 직책별로 근무일수가 가장 오래된 사원의 직책, 이름, 입사일을 출력(직책으로 정렬)하세요
SELECT job, ename, hiredate
FROM emp 
WHERE (job, hiredate)
	  in(SELECT job, min(hiredate)
	  	 FROM emp
	  	 GROUP BY job)
ORDER BY job;

--[하] 4. rollup와 cube의 차이점을 기본예제를 통해서 기술하세요.
-- rollup은 group by 절에 의해 그룹 지어진 집합결과에서 그룹데이터와 데이터의 총계를 구할 수 있고,
-- cube는 rollup에서 summary기능을 포함할 때 사용
SELECT deptno, job, sum(sal) "합계", count(*) "데이터건수"
FROM emp 
GROUP BY ROLLUP(deptno, job)
ORDER BY deptno, job;
SELECT deptno, job, sum(sal) "합계", count(*) "데이터건수"
FROM emp 
GROUP BY cube(deptno, JOB)
ORDER BY deptno, job;

--[하] 5. 조인이란 무엇인가? 개념과 기본형식을 기술하세요.
/*
 # 조인
 1. 하나의 sql명령문에 의해 여러 테이블에 저장된 데이터를 한 번에 조회할 수 있는 기능
 2. 두 개 테이블에서 공통되는 컬럼을 기준으로 조건문을 만들어 조인함
 3. 기본형식
 	select 테이블별칭.컬럼명, 테이블별칭.컬럼명...
 	from 테이블1 별칭, 테이블2 별칭
 	where 별칭.공통컬럼 = 별칭.공통컬럼
 */

--[하] 6. 급여가 3000~4000 사이에 있는 부서명과 사원명,급여를 출력하세요.
SELECT dname, ename, sal
FROM emp e, dept d
WHERE e.deptno = d.DEPTNO
AND (sal>=3000 AND sal<=4000);

--[하] 7. 부서위치가 DALLAS인 사원정보를 출력하세요.
SELECT loc, e.*
FROM emp e, dept d
WHERE loc='DALLAS';

--[하] 8. natural join과 일반 where문에 의한 조인을 차이점을 기술하세요.
/*
 두 조인의 공통점은 두 개의 테이블에서 공통되는 컬럼을 기준으로 조인하는 것이고,
 where문에 의한 조인은 공통되는 조건을 붙여줘야 하지만,
 Natural join은 공통된 것을 알아서 찾아서 정렬해준다..
 
 => 두 형식에서 테이블에서 join하는 컬럼명을 지정하는 부분에 있어서
 	명시성과 내부적 자동 조인처이에서 차이가 난다.
 	natural join은 foregin key관계(제약키에서 언급)에 있으면
 */

--[하] 9. non equi join에 대하여 emp, salgrade를 활용하여 설명하세요.
-- 두 개의 테이블에 조인할 조건이 동일조건(=)이 아니고 범위를 지정할 때 사용
SELECT ename, sal, grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;

--[하]10. outer join과 일반 공통 컬럼 join과의 차이점을 기술하세요.
/*
 일반 공통 컬럼 join은 한 쪽에 해당 데이터가 없으면 나타나지 않는다.
 그러나 outer join은 특정 테이블을 기준으로 해당 테이블과 조인하는 테이블에 데이터가 없더라도 데이터를 출력해준다.
 */