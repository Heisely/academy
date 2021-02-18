<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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

--%>
<body>
	<h3>회원정보 입력</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pass"/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point"/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>


<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="m"/>
<jsp:useBean id="list" class="java.util.ArrayList" scope="session"></jsp:useBean>
<% if(m.getId()!=null){
		list.add(m);
   }%>
	<h3>저장된 Member(<%=list.size() %>)</h3>
	<table>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th><th>포인트</th><th>권한</th></tr>
		<%for(int idx=0; idx<list.size(); idx++){
			Member mem = (Member)list.get(idx);%>
		<tr><td><%=mem.getId() %></td><td><%=mem.getPass() %></td>
			<td><%=mem.getName() %></td><td><%=mem.getPoint() %></td>
			<td><%=mem.getAuth() %></td></tr>
		<%} %>
	</table>
</body>
</html>