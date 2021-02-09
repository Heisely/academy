<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="text" name="hello">
		<input type="text" name="nice">
		<input type="submit" value="제출">
	</form>
	<%
	String msg1 = request.getParameter("hello");
	String msg2 = request.getParameter("nice");
	String hello = msg1;
	int nice=1;
	if(msg2!=null) nice=Integer.parseInt(msg2);%>
	<% for(int i=1; i<=nice; i++){%>
		<h3><%=msg1 %>!</h3>
	<%} %>
</body>
</html>