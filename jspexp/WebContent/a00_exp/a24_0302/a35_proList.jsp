<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
/* 
 
 
*/
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>물건 조회</h3>
	<%--
	action의 default(설정되지 않았을 때)는 현재 화면을 호출한 jsp, controller를 처리해준다.
	ex) /prod.do로 된 controller가 현재 jsp(view)를 호출했으면
		submit할 때에도 다시 action="/prod.do"로 호출하여 해당 controller에 요청값을 전송한다.
	--%>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><th>가격</th>
			<td><input type="text" name="fr_price" value="${param.fr_price}"/>~
				<input type="text" name="to_price" value="${param.to_price}"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="조회"/></td></tr>
	</table>
	</form>
	
	<table>
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>개수</th>
			<th>등록일</th><th>생산지(회사)</th><th>최근입고일</th><th>입고담당자</th>
		<c:forEach var="prod" items="${plist}">
		<tr>
			<td>${prod.pno}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td><fmt:formatDate value="${prod.credte}"/></td>
			<td>${prod.company}</td>
			<td><fmt:formatDate value="${prod.incomedte}"/></td>
			<td>${prod.inmanager}</td>
		</tr>
		</c:forEach>
	</table>
	<%-- MVC패턴은 JSP에서 시작X, Controller를 호출하면 JSP가 호출된다. --%>
</body>
</html>