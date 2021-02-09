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
<%@ include file = "a07_siteCom.jsp" %>
<% int tot = 50000 - (int)(50000*dis); %>
	<h3>아쿠아리움에 오신 것을 환영합니다.</h3>
	<h4>정가: 40,000원</h4>
	<h4>나이: <%=age %></h4>
	<h4>할인율: <%=(int)dis*100 %>%</h4>
	<h4>입장료: <%=tot %>원</h4>
</body>
</html>