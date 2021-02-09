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
# <jsp:include>액션 태그와 include 디렉티브 비교
				<jsp:include>			include 디렉티브<%@ include file=""%>
----------------------------------------------------------------------------
1. 처리시간		요청시간에 처리				jsp파일을 자바소스로 변환

2. 기능단위		각각의 jsp로 따로 사용		포함된 파일을 함께 컴파일
				servlet수는 포함			servlet은 하나의 파일
				파일은 따로

3. 데이터전달		<jsp:param>을 이용		같은 파일이므로 하나의 변수로 사용 가능
				request.getParameter

4. 용도			화면의 레이아웃의 일부분을	다수의 jsp페이지에서
				모듈화할 때				공통의 사용변수를 지정하는 코드나
										저작권과 같은 문장을 포함할 때
--%>
<body>
	<h2>메인 화면</h2>
	<hr>
	<% String name="홍길동"; %>
	<%@ include file="a04_sub.jsp" %>
	<h3>나이는 <%=age %></h3>
	<hr>
	<h3>하단화면</h3>
</body>
</html>