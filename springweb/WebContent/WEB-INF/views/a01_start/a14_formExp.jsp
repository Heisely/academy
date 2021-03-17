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
<style type="text/css">
	select, input{width:30%;}
</style>
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
  <h2>물품 구매</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form:form modelAttribute="prod" class="form-inline" method="post">
		<form:select path="kind" class="form-control mr-sm-2">
			<form:option value="" label="물건종류선택"/>
			<form:options items="${buyList}"/>
		</form:select>
		<form:input path="name" class="form-control mr-sm-2" placeholder="물건명" style="width:20%"/>
		<form:select path="price" class="form-control mr-sm-2">
			<form:option value="0" label="가격선택"/>
			<c:forEach var="pc" begin="1000" end="10000" step="1000">
				<form:option value="${pc}"/>
			</c:forEach>
		</form:select>
		<form:select path="cnt" class="form-control mr-sm-2">
			<form:option value="0" label="개수선택"/>
			<c:forEach var="ct" begin="1" end="10">
				<form:option value="${ct}"/>
			</c:forEach>
		</form:select>
		<button class="btn btn-success" type="submit">Search</button>
	</form:form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>물건종류</th><th>물건명</th><th>가격</th><th>개수</th>
		</tr>
	</thead>
	<tbody>
		<tr class="text-center">
			<td>${prod.kind}</td><td>${prod.name}</td><td>${prod.price}</td><td>${prod.cnt}</td>
		</tr>
	</tbody>
</table>    
</div>
</body>
</html>