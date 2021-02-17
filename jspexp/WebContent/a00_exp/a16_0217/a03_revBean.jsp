<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- path기준으로 모든 자원(css,img,js)에 접근하여 사용할 수 있다 --%>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<%--

--%>
<jsp:useBean id="m01" class="jspexp.z01_vo.Member" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="m01"/>
<body>
	<h3>저장된 Member</h3>
	<table>
		<tr><th>아이디</th><td><%=m01.getId() %></td></tr>
		<tr><th>패스워드</th><td><%=m01.getPass() %></td></tr>
		<tr><th>이름</th><td><%=m01.getName() %></td></tr>
		<tr><th>포인트</th><td><%=m01.getPoint() %></td></tr>
		<tr><th>권한</th><td><%=m01.getAuth() %></td></tr>
	</table>
</body>
</html>