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
	function buy(){
		// js로 페이지 이동
		location.href="a02_shop2.jsp";
	}
</script>
</head>
<body>
	<h3 onclick="buy()">물건 구매</h3>
	<%
	// 저장된 session값을 가져와서
	Product prod = (Product)session.getAttribute("prod");
	// 속성값을 변경하고
	prod.setCnt(prod.getCnt()+1);
	// 다시 session에 저장
	session.setAttribute("prid", prod);
	%>
	<table>
		<tr><th>물건명</th><td><%=prod.getName()%></td></tr>
		<tr><th>가격</th><td><%=prod.getPrice()%></td></tr>
		<tr><th>개수</th><td><%=prod.getCnt()%></td></tr>
	</table>
</body>
</html>