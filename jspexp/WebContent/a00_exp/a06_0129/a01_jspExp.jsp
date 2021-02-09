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
[jsp]
[하] 1. 파일관리하는 서버 정보를 fileServer/124.243.3.5 로,
		특정 이미지의 경로 정보를 설정하여, 화면에 출력하게 하세요.
[하] 2. 서버 안에 log에 대한 여러가지 출력 형식을 기술하세요.
		out.println();
		System.out.println();
		log();
[중] 3. jsp:include 액션 태그를 이용해서 상단/하단이 나뉘어지고,
		상단에 메뉴 하단에 페이지가 만들어 지면,
		상단의 로그인/상품/관리자 메뉴에 클릭에 따라 하단의 페이지가 변경되게 처리하세요.
		> [a01_top.jsp]
			<body>
				<h4 align="center">메뉴</h4>
				<a href="login.jsp" target="main">로그인</a>&nbsp;&nbsp;&nbsp;
				<a href="product.jsp" target="main">상품</a>&nbsp;&nbsp;&nbsp;
				<a href="admin.jsp" target="main">관리자</a>&nbsp;&nbsp;&nbsp;
			</body>
		
			> [login.jsp]
				<body>
					<h3>로그인화면</h3>
					<form action="after.jsp">
					<table>
						<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
						<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
						<tr><td colspan="2"><input type="submit" value="로그인"></td></tr>
					</table>
					</form>
				</body>
				
				> [after.jsp]
					<body>
						<a target="main"><h3>로그인 되었습니다</h3></a>
					</body>
					
			> [product.jsp]
				<body>
					<h3 align="center">그릇part</h3>
					<form align="center">
						<img src="img/sample.PNG" >
						<table align="center">
							<tr><th>물건명</th><td>국그릇</td></tr>
							<tr><th>가격</th><td>34,000원</td></tr>
						</table>
					</form>
				</body>
			
			> [admin.jsp]
				<body>
					<h3>관리자페이지입니다.</h3>
				</body>
				
		> [a01_bottom.jsp]
			<body>
				<form>
					<iframe width="100%" height="1000px" name="main"></iframe>
				</form>
			</body>
--%>
<body>
	<h3>fileServer: <%=application.getInitParameter("fileServer") %></h3>
	<hr>
	<h3>JSP ex3.</h3>
	<hr>
	<jsp:include page="a01_top.jsp"></jsp:include>
	<jsp:include page="a01_bottom.jsp"></jsp:include>
	<hr>
	<h2 id="jsex1"></h2>
</body>
</html>