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
<jsp:useBean id="dao" class="jspexp.a03_database.A03_ShopDao"/>
<c:set var="prodList" value="${dao.pList(param.pno)}"/>
<body>
	<h3>물건 정보</h3>
	<h4>${prodList.size()}건</h4>
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>개수</th>
			<th>등록일</th>
			<th>제조사</th>
			<th>최근입고일</th>
			<th>관리자</th>
		</tr>
		<c:forEach var="prod" items="${prodList}">
		<tr>			
			<td>${prod.pno}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td>${prod.credte}</td>
			<td>${prod.company}</td>
			<td>${prod.incomedte}</td>
			<td>${prod.inmanager}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>