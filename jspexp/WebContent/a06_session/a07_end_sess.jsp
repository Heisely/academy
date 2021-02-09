<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();%>
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
<%
/* session 종료 페이지(a07_end_sess.jsp)
	invalidate() 호출
	다시 로그인
	session 확인 페이지
 */
	session.invalidate();
%>
	<h3>로그아웃</h3>
	<table>
		<tr><th onclick="location.href='a05_login.jsp'">로그인페이지 이동</th></tr>
		<tr><th onclick="location.href='a06_mem_sess.jsp'">세션페이지 확인</th></tr>		
	</table>
</body>
</html>