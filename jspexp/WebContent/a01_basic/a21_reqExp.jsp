<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
<body>
	<h3>받는 정보</h3>
	<table>
		<tr><th>이름</th><td><%=request.getParameter("name") %></td></tr>
		<tr><th>나이</th><td><%=request.getParameter("age") %></td></tr>
		<tr><th>위치</th><td><%=request.getParameter("loc") %></td></tr>
	</table>
</body>
</html>