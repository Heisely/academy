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
	<h3>부서별 최근입사일/평균연봉</h3>
	<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="dlist" value="${dao.deptAvgSal()}"/>
	<table>
		<tr><th>부서번호</th><th>가장최근입사일</th><th>평균연봉</th></tr>
		<c:forEach var="emp" items="${dlist}">
		<tr><td>${emp.deptno}</td>
			<td><fmt:formatDate value="${emp.hiredate}" pattern="yyyy/MM/dd"/></td>
			<td><fmt:formatNumber value="${emp.sal}" pattern="0,000.00"/></td></tr>
		</c:forEach>
	</table>
</body>
</html>