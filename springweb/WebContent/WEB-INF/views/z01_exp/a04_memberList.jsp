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
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
	<h2>회원 조회 화면</h2>
</div>
<div class="container">
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post">
		<input class="form-control mr-sm-2" type="text" name="id" value="${param.id}" placeholder="아이디">
		<input class="form-control mr-sm-2" type="text" name="name"  value="${param.name}" placeholder="이름">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
  </nav>
  <table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>아이디</th>
			<th>이름</th>
			<th>포인트</th>
			<th>주소</th>
			<th>등록일</th>
			<th>권한</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="m" items="${mlist}">
		<tr class="text-center">
			<td>${m.id}</td>
			<td>${m.name}</td>
			<td>${m.point}</td>
			<td>${m.address}</td>
			<td><fmt:formatDate value="${m.regdte}"/></td>
			<td>${m.auth}</td>
		</tr>
		</c:forEach>
	</tbody>
  </table>    
</div>
</body>
</html>