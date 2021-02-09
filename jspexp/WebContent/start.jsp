<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspexp.z01_vo.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Product p1 = new Product("사과",3000,3);
%>
<body>
<!-- 
브라우저에서 주소로 특정한 jsp를 호출 [브라우저]
jsp ==> servletXX.java ==> @@@.class ==> 결과 html을 만들어 요청한 클라이언트 전달 [서버]
==> client html을 받아서 rendering(html)을 화면에 보여준다 [브라우저]

JSP: CSS, JAVASCRIPT(JQUERY, AJAX)
	JAVA ==> CSS, JAVASCRIPT 연동처리를 포함하여 최종 화면결과를 전달하는 프로그램
 -->
	<h3>물건명: <%=p1.getName() %></h3>
	<h3>가격: <%=p1.getPrice() %></h3>
	<h3>개수: <%=p1.getCnt() %></h3>
</body>
</html>