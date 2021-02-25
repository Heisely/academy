<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
<c:set var="deptList" value="${dao.deptList2(param.dname, param.loc)}"/>
<body>
	<h3>부서정보</h3>
	<h4>${deptList.size()}건</h4>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
		<c:forEach var="dept" items="${deptList}">
		<tr><td>${dept.deptno}</td><td>${dept.dname}</td><td>${dept.loc}</td></tr>
		</c:forEach>
	</table>
</body>
</html>