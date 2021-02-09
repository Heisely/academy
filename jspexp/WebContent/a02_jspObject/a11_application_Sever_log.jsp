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
	<h3>서버 정보</h3>
	서버정보: <%=application.getServerInfo()%><br>
	서블릿 규약 메이저 버전: <%=application.getMajorVersion()%><br>
	서블릿 규약 마이너 버전: <%=application.getMinorVersion()%>
	<h3>로그 처리</h3>
	<%
	// log("jsp에서 server의 DEMON console로 출력되는 내용")
	log("로그 메시지 기록2");
	int num03 = 25;
	int num04 = 30;
	int sum = num03+num04;
	%><%-- 콘솔창에서 확인(1) --%>
	로그 메시지를 기록합니다.<br>
	<% application.log("로그 메시지 기록");%><%-- 콘솔창에서 확인(3) --%>
	로그 메시지를 기록합니다.<br>
	<%
	log(num03+"+"+num04+"="+sum);
	System.out.println("로그 출력"); %><%-- 콘솔창에서 확인(2) --%>

<%-- ex) 이름 나이 사는곳 숫자1 숫자2 변수를 출력과 함께 log에도 나타나게 처리 --%>
	<h3>예제</h3>
	<% 
	String name = "홍길동";
	int age = 25;
	String loc = "서울 방배동";
	int num1 = 12;
	int num2 = 15;
	out.println("out.println");
	out.println("<h3>이름: "+name+"</h3>");
	out.println("<h3>나이: "+age+"</h3>");
	out.println("<h3>사는곳: "+loc+"</h3>");
	out.println("<h3>"+num1+" + "+num2+" = "+(num1+num2)+"</h3>");
	
	System.out.println("System.out.println");
	System.out.println("<h3>이름: "+name+"</h3>");
	System.out.println("<h3>나이: "+age+"</h3>");
	System.out.println("<h3>사는곳: "+loc+"</h3>");
	System.out.println("<h3>"+num1+" + "+num2+" = "+(num1+num2)+"</h3>");
	
	log("log");
	log("<h3>이름: "+name+"</h3>");
	log("<h3>나이: "+age+"</h3>");
	log("<h3>사는곳: "+loc+"</h3>");
	log("<h3>"+num1+" + "+num2+" = "+(num1+num2)+"</h3>");
	
	application.log("application.log");
	application.log("<h3>이름: "+name+"</h3>");
	application.log("<h3>나이: "+age+"</h3>");
	application.log("<h3>사는곳: "+loc+"</h3>");
	application.log("<h3>"+num1+" + "+num2+" = "+(num1+num2)+"</h3>");	
	%>
</body>
</html>