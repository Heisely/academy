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
	<h3>초기화 파라미터 목록(web.xml)</h3>
<ul>
<% // # application 초기 파라미터 관련 메서드
   // getInitParameterNames: web.xml의 초기 매개변수 이름 목록을 가져온다.
   // getInitParameter(name): 이름에 해당하는 데이터를 가져온다.
   
   // web.xml에 있는 context-param 하위의 param-name이라는 key값응ㄹ 가져올 수 있다.
   // param-value로 할당되어 있는 value값을 호출해서 가져올 수 있다.
	Enumeration<String> initParamEnum = application.getInitParameterNames();
   // .hasMoreElements(): 다음 요소가 있는지를 boolean 값으로 호출 및 다음 요소로 이동
	while(initParamEnum.hasMoreElements()){
		// 1. param-name의 값을 가져오고
		String initParamName = initParamEnum.nextElement();
		// 2. application.getInitParameter("키"): param-value를 가져오는 메서드
%>
	<li><%=initParamName%>=<%=application.getInitParameter(initParamName) %></li>
<%
	}
%>
</ul>
<%--
ex) web.xml에
		DBServer: 192.212.42.54로 매개변수 이름과 값을 설정하고
		account: himan
		pass: 7777
	로 설정하여 현재화면에서 값을 출력해보세요			 
--%>
	<h3>DBServer: <%=application.getInitParameter("DBServer")%></h3>
	<h3>account: <%=application.getInitParameter("account")%></h3>
	<h3>pass: <%=application.getInitParameter("pass")%></h3>
</body>
</html>