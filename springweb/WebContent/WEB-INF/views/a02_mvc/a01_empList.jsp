<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		$("[name=job]").val("${sch.job}"); // 검색 후, 다음 페이지에서 확인
		$("#regBtn").click(function(){
			location.href="${path}/insEmpForm.do"; // 등록 Controller 호출
		});
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>사원정보검색(MyBatis)</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<%--
ex) <form:form 과 ModelAttribute를 활용해서 사원검색 처리하기
	<form class="form-inline" method="post">
		<input class="form-control mr-sm-2" type="text" name="ename" value="${sch.ename}" placeholder="사원명">
		<select name="job" class="form-control mr-sm-2">
			<option value="">직책선택</option>
			<c:forEach var="job" items="${jobs}">
				<option>${job}</option>
			</c:forEach>
		</select>
--%>
	<form:form modelAttribute="sch" class="form-inline" method="post">
		<form:input path="ename" class="form-control mr-sm-2" placeholder="사원명" style="width:30%"/>
		<form:select path="job" class="form-control mr-sm-2">
			<option value="">직책선택</option>
			<form:options items="${jobs}"/>
		</form:select>
		<button class="btn btn-success" type="submit">Search</button>&nbsp;
		<button class="btn btn-info" type="button" id="regBtn">등록</button>
	</form:form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>입사일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="emp" items="${emplist}">
		<tr class="text-center">
			<td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.job}</td>
			<td>${emp.sal}</td>
			<td><fmt:formatDate value="${emp.hiredate}"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>    
</div>
</body>
</html>