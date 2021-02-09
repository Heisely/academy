<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
# 기본 내장 객체 실습
	- request: 요청정보를 구할 때 사용
	- response: 응답과 관련된 설정 시 사용
	- out: 직접 응답을 출력할 때 사용
	- session: 세션 관리에 사용
1. request 객체: 클라이언트에 전달할 요청값을 받아서 사용할 때 쓰임
	페이지?요청키1=요청값&요청키2=요청값
http://localhost:7080/jspexp/a01_basic/a02_innerObj.jsp?name=홍길동
ex) id=himan&pass=7777을 요청값으로 전달할 때, jsp코드로 이를 받아 처리하세요.
	id: @@@
	pw: @@@
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// servlet의 매개변수, 매개변수의 객체의 메서드를 통해서 이미 만들어진 객체의 참조변수를 사용할 수 있다.
request.getParameter("");
response.getWriter().print("출력");
out.print("출력");
session.setAttribute("", "");
%>
<body>
	<h2>페이지 호출</h2>
	<h3>요청값: <%=request.getParameter("name") %></h3>
	<h3>id: <%=request.getParameter("id") %></h3>
	<h3>pw: <%=request.getParameter("pw") %></h3>
	
</body>
</html>