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
<%--

--%>
<body>
	<h3>사원등록페이지</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename"/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job"/></td></tr>
		<tr><th>관리자</th><td><input type="text" name="mgr"/></td></tr>
		<tr><th>입사일</th><td><input type="text" name="hiredate_s"/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal"/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm"/></td></tr>
		<tr><th>부서번호</th><td><input type="text" name="deptno"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>
</body>
</html>