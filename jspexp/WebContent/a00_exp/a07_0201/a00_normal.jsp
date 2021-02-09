<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- path기준으로 모든 자원(css,img,js)에 접근해 사용할 수 있다. --%>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<body>
	<h3>일반고객페이지 입니다</h3>
	<table>
		<tr><td>구매자</td><td><%=request.getParameter("name") %></td></tr>
		<tr><td>물건명</td><td><%=request.getParameter("pname") %></td></tr>
		<tr><td>가격</td><td><%=request.getParameter("price") %></td></tr>
		<tr><td>개수</td><td><%=request.getParameter("cnt") %></td></tr>
		<tr><td>총계</td><td><%=request.getAttribute("tot") %></td></tr>
	</table>
</body>
</html>