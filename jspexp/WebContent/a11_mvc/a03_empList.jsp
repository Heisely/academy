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
	<h3>사원 정보 조회(MVC)</h3>
		<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value="${param.ename}"/></td></tr>
		<%-- 데이터를 입력 후 요청한 다음, 다시 화면에서 확인하려면 value값을 mappling 시켜주는 것이 반드시 필요 --%>
		<tr><th>직책명</th><td><input type="text" name=job value="${param.job}"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" value="등록"/>
		</td></tr>
	</table>
	</form>
	
	<table>
		<tr><th>사원번호</th>
			<th>사원명</th>
			<th>직책명</th>
			<th>급여</th>
			<th>부서번호</th>
		</tr>
		<%--
		controller에서 넘겨온 model 데이터 empList
		request.setAttribute("empList", dao.empList2(...));
		--%>
		<c:forEach var="emp" items="${empList}">
		<tr><td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.job}</td>
			<td>${emp.sal}</td>
			<td>${emp.deptno}</td></tr>
		</c:forEach>
	</table>
</body>
</html>