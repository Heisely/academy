<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<% String path = request.getContextPath();%>
<%@ page import="jspexp.z01_vo.Member" %>
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
	<h3>request</h3>
	<a href="a07_sessionScope.jsp">session 범위 이동</a>
	<table>
		<tr><th>page</th><td><%=pageContext.getAttribute("show")%></td></tr>
		<tr><th>request</th><td><%=request.getAttribute("prodName")%></td></tr>
      	<tr><th>session</th><td>
      	<%
      	/*
      	1. setAttribute를 설정할 때, 객체인 경우
			session.setAttribute("key",Object);
      		1) String인 경우에는 하위에 있는 메서드를 호출하지 않는 한
				null로 표기되어 에러가 발생하지 않는다.
			2) 일반 객체의 경우에는 메서드를 호출하여 NullPointerException이 발생하므로
				반드시 사전에 if(조건문)으로 예외 처리를 해야 한다.
				stack	heap
				참조변수	실제객체
				
				※주의※
				참조변수.메서드() 호출 - heap 객체가 없는 상황에서는 NullPointerException과 함께 프로그램이 중단된다.			
      	*/
	      if(session.getAttribute("m01")!=null){
	         Member m01 = (Member)session.getAttribute("m01");
	         m01.setPoint(m01.getPoint()+1);
	         session.setAttribute("m01",m01);
		%>
	    <%=m01.getId()%>:<%=m01.getPoint()%>
	    <%   }%>
	    </td></tr>
		<tr><th>application</th><td><%=application.getAttribute("DBServer")%></td></tr>
	</table>
</body>
</html>