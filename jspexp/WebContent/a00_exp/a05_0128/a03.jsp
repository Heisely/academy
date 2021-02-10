<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a00_exp.z01_vo.*"%>
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
<%--
[JSP]
[하] 1. session scope 4개의 범위를 기술하세요.(오늘 scope처리 master하지 못하신 분은 페이지 4개 만들어 다시 확인해보세요)
		> pageContext
			- 현재페이지에서마나 사용할 수 있는 범위로 객체 선언
		> request
			- 현재페이지 + forward, requestDispatcher를 통해 호출된 페이지 데이터
		> session
			- 현재/request페이지/a href, location, response.sendRedirect까지도 유지가 되는 범위 설정
		> application
			- 서버 단위로 데이터를 저장하고 활용할 수 있음

[중] 2. 장바구니(session범위)에 담은 Product객체가 a01_shop1.jsp(초기설정) 후,  a02_shop2.jsp를 호출할 때마다 구매갯수가 계속 1씩 증가하게 처리하세요.
         Product(물건명,가격,갯수)-a01_shop1.jsp에서 초기 설정

--%>
<%

	session.setAttribute("p01",new Product("사과",2000,1));
	application.setAttribute("show","저장");

%>
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