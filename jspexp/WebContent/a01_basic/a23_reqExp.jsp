<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
<%
	String[] pnames = request.getParameterValues("pname");
	// pnames = {"사과","바나나","딸기"};
	// null에 대한 에러 방지 처리
	if(pnames==null) pnames = new String[]{};
%>
<%
	String[] priceS = request.getParameterValues("price");
	if(priceS==null) priceS = new String[]{};
	String[] cntS = request.getParameterValues("cnt");
	if(cntS==null) cntS = new String[]{};

%>
<body>
	<h3>물건명</h3>
	<table>
		<%for(int idx=0; idx<pnames.length; idx++){%>
		<tr><th><%=idx+1%></th><td><%=pnames[idx] %></td></tr>
		<%}%>
	</table>
	
	<h3>가격</h3>
	<table>
		<%for(int idx=0; idx<priceS.length; idx++){%>
		<tr><th><%=idx+1%></th><td><%=priceS[idx] %></td></tr>
		<%}%>
	</table>
	
	<h3>개수</h3>
	<table>
		<%for(int idx=0; idx<priceS.length; idx++){%>
		<tr><th><%=idx+1%></th><td><%=cntS[idx] %></td></tr>
		<%}%>
	</table>
</body>
</html>