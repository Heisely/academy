<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
D:\박동생\apache-tomcat-9.0.41\lib
에 있는 jsp-api.jar , servlet-api.jar 를 복사해서
javaexp\WebContent\WEB-INF\lib 폴드에 위치시키기
 -->
	<%
		String name = "홍길동";
	%>
	<h2>안녕하세요.! 웹프로그래밍 시작입니다!(박혜선)</h2>
<%
	String name1 = "홍길동";
	int age = 25;
	String prod="사과"; // DB에서 가져온 내용을 java로만 초기할당할 수 있다.
//  /index.jsp ==> indexServlet.jaba(jaba+html) ==> html로 최종 만들어서 client wjsekf
%>
	<h2>이름:<%=name1%></h2>
	<h3>html 코드도 개발하고..</h3>
	<h4>나이:<%=age%></h4>
	<h3>물건:<%=prod%></h3>

</body>
</html>