<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspexp.z01_vo.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Book b = new Book("자바의정석",30000,"남궁성");
%>
<body>
	<h3>도서명: <%=b.getName() %></h3>
	<h3>가격: <%=b.getPrice() %>원</h3>
	<h3>저자: <%=b.getWriter() %></h3>
</body>
</html>