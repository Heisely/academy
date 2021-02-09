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
<%
	String name = request.getParameter("name");
	if(name==null) name = "";
	
	String id = request.getParameter("id");
	if(id==null) id = "";
	String ptS = request.getParameter("point");
	int pt = 0;
	if(ptS!=null) pt = Integer.parseInt(ptS);
%>
<body>
	<h3>JSP ex2-(1)</h3>
	<table>
		<tr><th>이름</th><td><%=name %></td></tr>
	</table>
	
	<h3>JS ex1</h3>
	<table>
		<tr><th>아이디</th><td><%=id%></td></tr>
		<tr><th>포인트</th><td><%=pt%></td></tr>
	</table>
</body>
</html>