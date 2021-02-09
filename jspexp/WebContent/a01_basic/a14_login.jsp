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
<!-- 
ex) 로그인
	id:[	]
	pw:[	]
	[로그인]
	> 로그인 클릭 시 요청값 기준으로 response.sendRedirect() 활용
	> id/pw(himan/7777)일 때, a15_success.jsp로 이동
		그렇지 못할 때는 a16_fail.jsp로 이동
-->
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	// 데이터 입력
	if(id!=null && pass!=null){	
		// 인증되는 조건이 있을 때
		// DB연동하는 순간 select * from member where id=? and pass=?
		if(id.equals("himan")&&pass.equals("7777")){ 
			// 서버단에서 받은 값에 따라 페이지 이동 처리
			// 해당 페이지에 입력된 id 전송
			response.sendRedirect("a15_success.jsp?id="+id);
		} else {
			response.sendRedirect("a16_fail.jsp?id="+id);
		}
	}
%>
	<h3>로그인</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="로그인"></td></tr>
	</table>
	</form>
</body>
</html>