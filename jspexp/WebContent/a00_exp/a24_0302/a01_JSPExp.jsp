<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<fmt:requestEncoding value="UTF-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--

--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>물품리스트(MVC)</h3>
	<form method="post">
	<table>
		<tr><th>상품명</th><td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	
	<table>
		<tr><th>상품번호</th><th>물건명</th><th>가격</th><th>개수</th>
			<th>등록일</th><th>제조사</th><th>최근등록일</th><th>관리자</th></tr>
		<c:forEach var="prod" items="${plist}">
		<tr>
			<td>${prod.pno}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td>${prod.credte}</td>
			<td>${prod.company}</td>
			<td>${prod.incomedte}</td>
			<td>${prod.inmanager}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>