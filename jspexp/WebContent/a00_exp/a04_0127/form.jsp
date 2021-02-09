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
	<h3>JSP ex3</h3>
	<h4>1. 요청값 1개</h4>
	<form action="a01_jspExp.jsp" method="post">
		<table>
		<tr><th>가장좋아하는 가수/그룹</th><td><input type="text" name="singer"></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록1"></td></tr>
	</table>
	</form>
	<h4>2. 숫자형데이터처리</h4>
	<form action="a01_jspExp.jsp" method="post">
		<table>
		<tr><th>나이</th><td><input type="text" name="num"></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록2"></td></tr>
	</table>
	</form>
	<h4>3. 다중데이터처리</h4>
	<form action="a01_jspExp.jsp" method="post">
		<table>
		<tr><th>좋아하는음식1</th><td><input type="text" name="food"></td></tr>
		<tr><th>좋아하는음식2</th><td><input type="text" name="food"></td></tr>
		<tr><th>좋아하는음식3</th><td><input type="text" name="food"></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록3"></td></tr>
	</table>
	</form>
</body>
</html>