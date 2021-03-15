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
		1) DAO가 새로 추가될 때
			mybatis.Spring.xml안에 사용할 VO객체 추가, 사용할 업무단위 XXX.xml추가
		2) DAO를 기준으로 연동 처리 관계 설정
			// springweb.a02_mvc.a03_dao.A01_EmpDao
			   ArrayList<Emp> emplist(Emp sch);
			   - 인터페이스명 - namespace: 가능한 한 interface명과 패키지명을 복사해 붙인다.
			   - 리턴할 객체/변수
					> 단일 데이터: resultType으로 설정
						ex) public int totAll();
							<select resultType="int"
						ex) public Emp getEmp(int empno);
							<select resultType="emp"> mypatis.Spring.xml안 alias로 선언된 emp
					> 배열/ArrayList<VO>: resultMap을 일단 상단에 선언한 후, id 값으로 설정
						ex) public ArrayLIst<Emp> empList();
							<resultMap type="emp" id="empResult"/>
							<select resultMap="empResult">
						ex) public String[] getEnames();
							<resultMap type="java.lang.String" id="strResult"/>
							<select resultMap = "strResult">
				- 입력할 매개변수 - parameterType
					> 없을 때: 선언하지 않는다.
						ex) emplist();
							<select>
					> 단일 데이터:
						ex) emplist(int empno); 
							<select parameterType="int">
					> 단일 객체
						ex)	emplist(Emp sch);
							<select parameterType="emp">
					> 배열형 - parameterMap: 입력값이 배열형 객체일 때
						ex) public void insert(HashMap<String, Object> ins);
							<insert parameterType="hashmap" ${키값}>
				- id: 메서드명..
				
[하] 2. 다음의 sql에 해당 하는 dao단과 XXXMapper.xml을 선언하세요
		>> from 2개짜리는 잘 모르겠습니다,,
        0) select *
            from dept
            where dname like '%'||#{dname}||'%'
            and job  like '%'||#{job}||'%'
        >> DAO: 
        	public ArrayList<Dept> deptlist(Dept sch);
        >> XXXMapper.xml:
        	<resultMap type="dept" id="deptResult"/>
        	<select id="deptlist" resultMap="deptResult" parameterType="dept">
	        	select *
	            from dept
	            where dname like '%'||#{dname}||'%'
	            and job  like '%'||#{job}||'%'
        	</select>
        
        2) SELECT empno, ename, job, sal
            FROM EMP e 
            WHERE ( sal >=#{start} AND sal<=#{end} )
            OR job = #{job}
        >> DAO:
        	public ArrayList<Emp> empList(Emp sch);
        >> XXXMapper.xml:
        	<resultMap type="emp" id="empResult"/>
        	<select id="empList" resultMap="empResult" parameterType="emp">
	        	SELECT empno, ename, job, sal
	            FROM EMP e 
	            WHERE ( sal >=#{start} AND sal<=#{end} )
	            OR job = #{job}
        	</select>
		
[하] 3. 아래의 실제 업무바탕으로 dao단과 XXXMapper.xml을 선언하세요
		>> SQL까지는 작성하겠는데, DAO랑 XXXMapper.xml은 잘 모르겠습니다.
         1) 부서번호로 사원번호, 사원명, 부서명, 급여 조회
         	SQL: 
         		SELECT e.empno, e.ename, d.dname, e.sal
				FROM emp e, dept d
				WHERE e.DEPTNO = d.DEPTNO
			
         2) 관리자이름으로 사원명 리스트 조회
         	SQL:
         		SELECT e.*, m.ename
				FROM emp e, emp m
				WHERE e.mgr = m.EMPNO
         		
         3) 사원명 3명 입력하여 최고급여 조회
         	??
         4) 입사년도기준으로 사원정보(전체) 조회
         	SQL: SELECT * FROM EMP
				 WHERE to_char(HIREDATE, 'YYYY')= '1980'
				 
[하] 4. mybatis기준으로 부서정보 조회 화면을 만드세요(웹화면까지)   DeptDao(인터페이스), DeptMapper.xml 추가
		[VO - Dept.java]: deptno, dname, loc 선언 후 생성자, getter/setter 메서드 생성
		[mybatis.Spring.xml]: <typeAlias alias="dept" type="springweb.z02_vo.Dept"/> 추가
		[DAO - A02_DeptDao.java]: public ArrayList<Dept> deptlist(Dept sch);
		[Service - A02_DeptService.java]
			@Service
			public class A02_DeptService {
				@Autowired(required = false)
				private A02_DeptDao dao;
				
				public ArrayList<Dept> deptlist(Dept sch){
					if(sch.getDname()==null)
						sch.setDname("");
					if(sch.getLoc()==null)
						sch.setLoc("");
					
					return dao.deptlist(sch);
				}
			}
			
		[DeptMapper.xml]
			<?xml version="1.0" encoding="UTF-8"?>
			<!DOCTYPE mapper
			   PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
			   "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
			<mapper namespace="springweb.a02_mvc.a03_dao.A02_DeptDao">
				<resultMap type="dept" id="deptResult"/>
				<select id="deptlist" resultMap="deptResult" parameterType="dept">
					SELECT * FROM DEPT
					WHERE 1=1
					AND DNAME LIKE '%'||#{dname}||'%'
					AND LOC LIKE '%'||#{loc}||'%'
				</select>
			</mapper>
			
		[Controller - A02_DeptController.java]
			@Controller
			public class A02_DeptController {
				@Autowired(required = false)
				private A02_DeptService service;
				
				// http://localhost:7080/springweb/deptlist.do
				@RequestMapping("/deptlist.do")
				public String deptlist(@ModelAttribute("sch") Dept sch, Model d) {
					System.out.println("데이터 건수: "+service.deptlist(sch).size());
					d.addAttribute("deptlist", service.deptlist(sch));
					return "WEB-INF\\views\\a02_mvc\\a02_deptList.jsp";
				}
			}
		[View - a02_deptList.jsp]		
			<body>
			<div class="jumbotron text-center">
			  <h2>부서정보검색(MyBatis)</h2>
			</div>
			<div class="container">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<form class="form-inline" method="post">
					<input class="form-control mr-sm-2" type="text" name="dname" value="${sch.dname}" placeholder="부서명">
					<input class="form-control mr-sm-2" type="text" name="loc" value="${sch.loc}" placeholder="부서위치">
					<button class="btn btn-success" type="submit">Search</button>
				</form>
			</nav>
			<table class="table table-hover">
				<thead>
					<tr class="table-success text-center">
						<th>부서번호</th>
						<th>부서명</th>
						<th>부서위치</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dept" items="${deptlist}">
					<tr class="text-center">
						<td>${dept.deptno}</td>
						<td>${dept.dname}</td>
						<td>${dept.loc}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>    
			</div>
			</body>		
		
[중] 5. mybatis기준으로 사원정보+부서정보+급여등급 조회(직책/부서명/급여등급) 화면을 만드세요(웹화면까지)
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>부서정보검색(MyBatis)</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post">
		<input class="form-control mr-sm-2" type="text" name="dname" value="${sch.dname}" placeholder="부서명">
		<input class="form-control mr-sm-2" type="text" name="loc" value="${sch.loc}" placeholder="부서위치">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>부서번호</th><th>부서명</th><th>부서위치</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dept" items="${deptList}">
		<tr class="text-center">
			<td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>    
</div>
</body>
</html>