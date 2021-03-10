<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<jsp:useBean id="dao" class="jspexp.a03_database.A04_MemberDao"/>
<c:set var="memList" value="${dao.memberList(param.id, param.name)}"/>
<body>
	<h3>회원 정보</h3>
	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>Name</th>
			<th>Point</th>
			<th>Address</th>
			<th>Regdte</th>
			<th>Auth</th>
		</tr>
		<c:forEach var="mem" items="${memList}">
		<tr>
			<td>${mem.id}</td>
			<td>${mem.pass}</td>
			<td>${mem.name}</td>
			<td>${mem.point}</td>
			<td>${mem.address}</td>
			<td>${mem.regdte}</td>
			<td>${mem.auth}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>