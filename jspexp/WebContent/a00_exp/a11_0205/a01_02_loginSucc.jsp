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
	<h3>로그인 성공</h3>
	<%	Member2 m = (Member2)session.getAttribute("mem");
		boolean isLogin=false;
		if(m!=null) { 
			isLogin = true; // 정상 로그인		%>
			<%=m.getId()%>님 로그인 성공입니다.
			<input type="button" value="로그아웃" onclick="logout()"/>
	<%	}%>
	
	<script>
		// js 변수로 java 설정
		// 숫자형/boolean은 그대로 expression 할당
		// 문자열은 ''/"" 사이에 할당
		var isLogin = <%=isLogin%>;
		if(!isLogin){
			alert("로그인이 안되었습니다\n로그인 페이지 이동");
			location.href="a01_01_login.jsp";
		}
		function logout(){
			isLogout = confirm("로그아웃하시겠습니까?");
			if(isLogout) {
				location.href="a01_04_logout.jsp"; // 로그아웃페이지로 이동
			}
		}
	</script>
</body>
</html>