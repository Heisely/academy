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
# <jsp:forward> 액션 태그
1. 하나의 JSP페이지에서 다른 JSP 페이지로 요청 처리를 전달할 때 사용
2. request, response를 포함시켜 전송
--%>
<body>
	<h2>권한에 따른 페이지 전환</h2>
	<form method="post">
		권한: <select name="auth">
				<option>관리자</option>
				<option>일반사용자</option>
				<option>방문자</option>
			 </select><br>
		아이디: <input type="text" name="id"/><br>
		<input type="submit" value="로그인"/>
	</form>
<%
	String auth = request.getParameter("auth");
	if(auth!=null){
		String page1="";
		if(auth.equals("관리자"))	page1="a06_admin.jsp";
		if(auth.equals("일반사용자"))	page1="a06_normal.jsp";
		if(auth.equals("방문자"))	page1="a06_guest.jsp";
%>
		<%-- 요청값으로 입력한 데이터도 request에 의해서 함께 전달할 수 있다. --%>
		<jsp:forward page="<%=page1 %>"/>
		<%--
		RequestDispatcher rd = request.getRequestDispatcher("페이지");
		rd.forward(request, response);를 포함한 것과 동일하게 처리
		--%>
<%
	}
%>
</body>
</html>