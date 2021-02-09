<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String greet(String msg){
		return msg;
	}
%>
<%
	String result = greet("안녕");
%>
	<h3><%=result %></h3>
</body>
</html>