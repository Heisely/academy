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
	<h3>application</h3>
	<table>
		<tr><th>page</th><td><%=pageContext.getAttribute("show")%></td></tr>
		<tr><th>request</th><td><%=request.getAttribute("prodName")%></td></tr>
      <tr><th>session</th><td>
      <%
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