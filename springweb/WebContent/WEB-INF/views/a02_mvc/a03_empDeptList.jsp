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
 
--%>
//
	$(document).ready(function(){
		$("[name=job]").val("${sch.job}"); // 검색 후, 다음 페이지에서 검색 내용 확인
		$("[name=deptno]").val("${sch.deptno}");
		$("[name=grade]").val("${sch.grade}");
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>사원/부서/등급정보검색(MyBatis)</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post">
		<select name="job" class="form-control mr-sm-2">
			<option value="">직책선택</option>
			<c:forEach var="job" items="${jobs}">
				<option>${job}</option>
			</c:forEach>
		</select>
		<select name="deptno" class="form-control mr-sm-2">
			<option value="0">부서선택</option>
			<c:forEach var="dept" items="${depts}">
				<option value="${dept.deptno}">${dept.dname}</option>
			</c:forEach>
		</select>
		<select name="grade" class="form-control mr-sm-2">
			<option value="">등급선택</option>
			<c:forEach var="cnt" begin="1" end="5">
				<option>${cnt}</option>
			</c:forEach>
		</select>		
		<button class="btn btn-success" type="submit">Search</button>
	</form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>관리자</th>
			<th>입사일</th>
			<th>급여</th>
			<th>보너스</th>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
			<th>등급</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="emp" items="${empDeptList}">
		<tr class="text-center">
			<td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.job}</td>
			<td>${emp.mgr}</td>
			<td><fmt:formatDate value="${emp.hiredate}"/></td>
			<td>${emp.sal}</td>
			<td>${emp.comm}</td>
			<td>${emp.deptno}</td>
			<td>${emp.dname}</td>
			<td>${emp.loc}</td>
			<td>${emp.grade}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>    
</div>
</body>
</html>