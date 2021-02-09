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
<%
	String id = request.getParameter("id");
%>
<script>
	window.onload=function(){
		// java, js의 연동
		if(confirm("<%=id%>님 로그인실패\n로그인 화면으로 이동하시겠습니까?")){
			// js로 페이지 이동 처리
			location.href = "a14_login.jsp"; // 확인 누르면 이동, 취소 누르면 화면 머물기
		}
	};
</script>
</head>
<body>
	<h3>로그인 실패</h3>
</body>
</html>