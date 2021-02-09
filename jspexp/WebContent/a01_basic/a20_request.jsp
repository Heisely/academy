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
<%--
jsp ==> servlet.java (html+java)
	==> servlet.class
	==> was(Tomcat) 메모리 로딩 실행처리(out.println(html코드)) 전송
	==> 클라이언트의 html을 받아서 브라우저에 랜더링해서 화면 출력
	
1. 요청값
	1) client단에서 페이지와 함께 호출
		페이지명?name=홍길동
	2) server단에서 해당 페이지 호출
		request.getParameter("name")
	3) 두 개값 이상으로 요청처리할 때
		페이지명?name=홍길동&age=25
ex1) loc=서울강남역&num01=25&num02=30 데이터를 받아서 화면에 출력
--%>
<body>
	<h3>요청값 처리</h3>
	<table>
		<tr><th>요청값1</th><td><%=request.getParameter("name") %></td></tr>
		<tr><th>요청값2</th><td><%=request.getParameter("age") %></td></tr>
		<tr><th>location</th><td><%=request.getParameter("loc") %></td></tr>
		<tr><th>num01</th><td><%=request.getParameter("num01") %></td></tr>
		<tr><th>num02</th><td><%=request.getParameter("num02") %></td></tr>
	</table>
</body>
</html>