<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"%>
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
<%
// 세션 종료
	session.invalidate();
%>
<body>
	<h3>세션종료</h3>
	<table>
		<tr><th onclick="location.href='a03_session_info.jsp'">세션 정보 확인</th></tr>
		<tr><th onclick="location.href='a01_basic.jsp'">세션 만들기</th></tr>
	</table>
</body>
</html>