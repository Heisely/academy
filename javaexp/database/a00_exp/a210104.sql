--[하] 1. case문의 기본 형식을 기술하세요.
/*
 	case [컬럼명]
		when 논리|산술|관계 then 처리할 데이터,
		when 논리|산술|관계 then 처리할 데이터,
		else 기타 처리할 데이터
	end
 */
--[하] 2. job에 따른 인턴기간을 다르게 설정하였다고 한다.
--	  (ANALYST 5, CLERK 1, MANAGER 4, PRESIDENT 6, SALESMAN 2개월)
--    사원별 인턴기간의 만료일을 입사일과 인턴기간의 만료일을 설정하세요.
/*
1단계
job에 대한 인턴 개월수 처리
	CASE job WHEN 'ANALYST' THEN 5
	   		 WHEN 'CLERK' THEN 1
	   		 WHEN 'MANAGER' THEN 4
	   		 WHEN 'PRESIDENT' THEN 6
	   		 WHEN 'SALESMAN' THEN 2
	 		 ELSE 0
	END "인턴기간(개월)"
2단계
	add_months(컬럼명, 추가할월);
	입사일과 위 case문에 의해 계산된 결과를 데이터 추가월에 입력하여 인턴 마지막 일을 계산한다.
 */
SELECT ename 사원명, job 직업, hiredate 입사일,
	   CASE job WHEN 'ANALYST' THEN 5
	   			WHEN 'CLERK' THEN 1
	   			WHEN 'MANAGER' THEN 4
	   			WHEN 'PRESIDENT' THEN 6
	   			WHEN 'SALESMAN' THEN 2
	   			ELSE 0
	   END "인턴기간(개월)",
	   add_months(hiredate, CASE job WHEN 'ANALYST' THEN 5
	   								 WHEN 'CLERK' THEN 1
	   								 WHEN 'MANAGER' THEN 4
	   								 WHEN 'PRESIDENT' THEN 6
	   								 WHEN 'SALESMAN' THEN 2
	   								 ELSE 0
	   						END) "인턴만료일"
FROM EMP;

--[중] 3. sal등급을 만들고 0~999,1000~1999,.... 등급별 인원수를 group 함수를 통해 처리하세요.
SELECT trunc(sal/1000)*1000||'~'||(trunc(sal/1000)*1000+999) 범위,
	   decode(trunc(sal/1000),0,'F',1,'D',2,'C',3,'B','A') 등급,
	   count(*) 인원
FROM emp
GROUP BY trunc(sal/1000)
ORDER BY trunc(sal/1000) DESC;

SELECT decode(floor(sal/1000),5,'A',4,'B',3,'C',2,'D',1,'E','F') 등급, count(*) 인원수
FROM emp 
GROUP BY FLOOR(sal/1000)
ORDER BY floor(sal/1000) DESC;