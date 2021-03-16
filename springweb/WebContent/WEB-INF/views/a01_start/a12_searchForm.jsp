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
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>검색화면</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
<%--
# form:form
1. commandName을 ModelAttribute로 선언한 이름으로 설정하면, 하위에 있는 요소 객체들은 모델객체(SearchVo)로 mapping이 된다.
	4.0			=>  5.0
	commandName		modelAttribute
2. 여러 요소 객체의 변화
	<input type="text" id="query" name="query" value="${search.query}"/>
	==> <form:input path="query"/>
	
	<select name="type">
		<option>
	==> <form:select path="type">
		<form:options items="{VO}" itemLabel="" itemValue=""/>
--%>
	<form:form modelAttribute="search" class="form-inline" method="post">
		<form:select path="type" class="form-control mr-sm-2">
			<form:options items="${searchTypeList}" itemLabel="text" itemValue="code"/>
		</form:select>
		<form:input path="query" class="form-control mr-sm-2" placeholder="검색내용"/>
		<button class="btn btn-success" type="submit">Search</button>
	</form:form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>검색 타입</th><th>검색어</th>
		</tr>
	</thead>
	<tbody>
		<tr class="text-center">
			<td>${search.type}</td><td>${search.query}</td>
		</tr>
	</tbody>
</table>    
</div>
</body>
</html>