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
	<!-- top.jsp에 로그인한 아이디를 넘겨줌 -->
	<jsp:include page="a03_top.jsp">
		<jsp:param value="홍길동" name="id"/>
	</jsp:include>
	<hr>
	<table>
		<col width="20%"><col width="80%">
		<tr>
			<%-- 왼쪽 메뉴에 선택한 index 값을 넘겨줌 --%>
			<td><jsp:include page="a03_left.jsp"></jsp:include></td>
			<%-- 받은 text를 출력 처리 --%>
			<td><h3 align="center">메인!</h3></td>
		</tr>
	</table>
</body>
</html>