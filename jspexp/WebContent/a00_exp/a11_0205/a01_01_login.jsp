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
<%--
[중] 2. 로그인 id : [    ] pass:[   ]로그인
        요청값 himan/7777일 session 값 처리를 설정하고, 그외에는 다시 로그인
        로그인 성공 후에는 session 값으로id 확인 @@@님 로그인중, 
        로그아웃 클릭시, session값을 없애고 다시 로그인 페이지 이동 처리하는
        기능을 구현하세요.
        
# 처리 순서
1. 화면 구현

2. submit 후 요청값에 대한 처리
	String id = request.getParameter("id");
3. 요청값에 따른 분기 처리
	if(id.equals("himan")&&pass.equals("7777")){
		// 선택1
		session.setAttribute("id",id);
		session.setAttribute("pass",pass);
		// 선택2
		session.setAttribute("mem",new Member(id,pass));
		
		response.sendRedirect("a01_02_loginSucc.jsp");
	} else {
		response.sendRedirect("a01_03_loginFail.jsp");
	}
4. 로그인 실패 페이지
	화면 내용
	<JS>
	alert('로그인실패\n로그인 페이지 이동');
	location.href="a01_01_login.jsp"; // 로그인페이지로 이동
5. 로그인 성공 페이지
	Member m = (Member)session.getAttribute("mem");
	if(m!=null){
		<%=m.getId()%>님 로그인 성공입니다.
		<input type="button" value="로그아웃" onclick="logout()"/>
	}
	<script>
		function logout(){
			if(confirm("로그아웃하시겠습니까?")) {
				location.href="a01_04_logout.jsp"; // 로그아웃페이지로 이동
			}
		}
	</script>
6. 로그아웃 페이지
	<% session.invalidate();%>
	<script>
		alert("로그아웃 되었습니다");
		location.href="a01_01_login.jsp"; // 로그인페이지로 이동
	</script>
--%>
	<h3>로그인</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="로그인"/></td></tr>
	</table>
	</form>
</body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	log("id: "+id);
	log("pass: "+pass);
	// 모든 웹페이지는 처음 화면과 데이터를 입력해서 다시 호출되는 화면과 구분해야 함
	// 구분자는 요청값에 대한 null로 구분할 수 있다.
	// 요청값이 null일 때 메서드를 사용하면 NullPointerException이 발생
	// 결론: id/pass가 null이 아닐 때로 구분해 처리
	//		null: 요청값이 없는 초기 페이지
	//		Not null: 요청값이 있는 페이지
	if(id!=null && pass!=null){
		log("# 요청값이 있는 경우 #");
		
		if(id.equals("himan") && pass.equals("7777")){
			log("# id/pass가 himan/7777 일 때 #");
			session.setAttribute("mem",new Member2(id,pass));
			response.sendRedirect("a01_02_loginSucc.jsp");
		} else {
			log("# id/pass가 himan/7777이 아닐 때 #");
			response.sendRedirect("a01_03_loginFail.jsp");
		}
	}
%>
</html>

















