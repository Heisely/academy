<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
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
	alert("등록된 회원입니다.\n회원정보를 불러옵니다.");
	$(document).ready(function(){
		$("h3").text("회원정보");
	});
	function goMain(){
		location.href="a02_0218_success.jsp?goMain=y";
	}
</script>
</head>
<body>
<%
	String goMain = request.getParameter("goMain");
	if(goMain!=null&&goMain.equals("y")){
		session.setAttribute("m", null);
		response.sendRedirect("a01_0218.jsp");
	}
%>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
	<input type="button" value="돌아가기" onclick="goMain()"/>
	<h3></h3>
	<table>
		<tr><th>아이디</th><td><%=m.getId()%></td></tr>
		<tr><th>이름</th><td><%=m.getName() %></td></tr>
		<tr><th>권한</th><td><%=m.getAuth() %></td></tr>
		<tr><th>포인트</th><td><%=m.getPoint() %></td></tr>
	</table>
</body>
</html>