<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a00_exp.Product"%>
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
	<h3>JSP ex02</h3>
	<a href="a02.jsp">a02이동</a>
	<table>
		<tr><th>session</th>
			<td><%
          		if(session.getAttribute("p01")!=null){
             		Product p01 = (Product)session.getAttribute("p01");
             		p01.setCnt(p01.getCnt()+1);
             		session.setAttribute("p01",p01);
        		%>
        		<%=p01.getName()%>:<%=p01.getPrice()%>:<%=p01.getCnt()%>
        		<%   }%>
			</td>
		</tr>
		<tr><th>application</th><td><%=application.getAttribute("show") %></td></tr>		
	</table>
</body>
</html>