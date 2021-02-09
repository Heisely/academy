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
<body>
	<h4 align="center">메뉴</h4>
	<a href="login.jsp" target="main">로그인</a>&nbsp;&nbsp;&nbsp;
	<a href="product.jsp" target="main">상품</a>&nbsp;&nbsp;&nbsp;
	<a href="admin.jsp" target="main">관리자</a>&nbsp;&nbsp;&nbsp;
</body>
</html>