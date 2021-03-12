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
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<!-- 	<h3>2021년 03월 04일 Spring 과제 3번입니다.</h3> -->
	<h3>스프링 컨트롤러 선언</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>
			<select> <!-- fruits -->
				<option value="0">물건선택</option>
				<c:forEach var="fruit" items="${fruits}">
					<option value="${fruit.price}">${fruit.name}(${fruit.price})</option>
				</c:forEach>
			</select>		
		</td></tr>
	</table>
</body>
</html>