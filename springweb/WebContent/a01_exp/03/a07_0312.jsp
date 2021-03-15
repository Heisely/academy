<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--
[스프링]
[하] 1. dao와 XXXMapper.xml 관계를 선언형식을 리턴값(단일/다중), 매개변수(변수/객체)에 따른 선언방법을 기술하세요
		public int totCnt();
		// 리턴값 단일 <select id="totCnt" resultType="int">
		public ArrayList<String> getEnames(int deptno);
		// 리턴값 다중	<resultMap type="String" id="strMap"/>
					<select id="getEnames" resultMap="strMap" parameterType="int">
		public ArrayList<Emp> getEmpList(ArrayList<Integer> empnos);
			<resultMap type="emp" id="empMap"/>
			<parameterMap type="int" id="intParams"/>
			<select id="getEmpList" resultMap="empMap" parameterMap="intParams">

[하] 2. 다음의 sql에 해당 하는 dao단과 XXXMapper.xml을 선언하세요
        0) select *
            from dept
            where dname like '%'||#{dname}||'%'
            and job  like '%'||#{job}||'%'
        1) SELECT empno, ename, sal, grade
            FROM emp, salgrade
            WHERE sal BETWEEN losal AND hisal
            AND sal>=#{sal}
        2) SELECT empno, ename, job, sal
            FROM EMP e 
            WHERE ( sal >=#{start} AND sal<=#{end} )
            OR job = #{job}
        3) SELECT ename, loc, to_char(hiredate, 'Q') part
            FROM emp e, dept d
            WHERE e.deptno = d.deptno
            AND to_char(hiredate, 'Q') IN (#{p01},#{p02})
            
        ==> Z01_ExpDap.java, ExpMapper.xml에 작성
        
[하] 3. 아래의 실제 업무바탕으로 dao단과 XXXMapper.xml을 선언하세요
         1) 부서번호로 사원번호, 사원명, 부서명, 급여 조회
         <select id="empSch4">
	        select e.empno, e.ename, d.dname, e.sal
	        from emp e, dept d
	        where e.deptno = d.deptno
	        and deptno = #{deptno}
	     </select>
	         	
         2) 관리자이름으로 사원명 리스트 조회
         <select id="empMgrSch">
         	select e.ename
         	from emp e, emp m
         	where e.mgr = m.empno
         	and m.ename = #{ename}
         </select>
         	
         3) 사원명 3명 입력하여 최고급여 조회
         <select id="emgMaxSal">
         	select max(sal)
         	from emp
         	where ename in (#enames[0], #enames[1], #enames[2])
         </select>
         
         4) 입사년도기준으로 사원정보(전체) 조회
         <select id="empSch5">
         	select * from emp
         	where to_char(hiredate,'YYYY')=#{year}
         </select>
         
         public ArrayList<EmpDept> empSch4(int deptno);
         public ArrayList<String> empMgrSch(String ename);
         public double emgMaxSal(ArrayList<String> enames);
         public ArrayList<Emp> empSch5(String year);
         
[하] 4. mybatis기준으로 부서정보 조회 화면을 만드세요(웹화면까지)   DeptDao(인터페이스), DeptMapper.xml 추가
		springweb/a02_mvc 하위에 만듦
[중] 5. mybatis기준으로 사원정보+부서정보+급여등급 조회(직책/부서명/급여등급) 화면을 만드세요(웹화면까지)
		1) SQL 작성
			SELECT e.*, dname, loc, grade
			FROM emp e, dept d, salgrade s
			WHERE d.deptno = d.deptno
			AND e.sal BETWEEN s.losal AND s.hisal
			AND job = 'MANAGER'
			AND d.deptno = 20
			AND grade = 4;
		2) VO 작성		
			EmpDept에 수정
		3) dao단 선언
			A01_EmpDao(interface)에 작성
		4) mapper 선언
		5) service
		6) controller
			- 요청
			- 모델데이터처리
		7) view단
		
/* combo box */
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST	

10	ACCOUNTING
20	RESEARCH
30	SALES
40	OPERATIONS
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>부트스트랩 form</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post" action="${path}/">
		<input class="form-control mr-sm-2" type="text" name="ename" value="" placeholder="사원명">
		<input class="form-control mr-sm-2" type="text" name="job" value="" placeholder="직책명">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>타이틀</th>
		</tr>
	</thead>
	<tbody>
		<tr class="text-center">
			<td>내용</td>
		</tr>
	</tbody>
</table>    
</div>
</body>
</html>