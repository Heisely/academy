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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
2. forEach를 통한 처리
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>사원검색</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th>
			<td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><th>직책</th>
			<td><input type="text" name="job" value="${param.job}"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table><br>
	</form>
	<%--
	?ename=@@&job=@@
	${param.ename}, ${param.job}으로 값을 받아줌
	
	useBean을 통해서 DAO 객체 생성
	<c:set var="empList" value="${dao.empList2(param.name, param.job)}"/>
	
	새로운 변수 empList에 요청값과 DAO의 검색메서드를 통해서 결과 ArrayList<emp>를 할당 처리
	--%>
	<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="empList" value="${dao.empList2(param.name, param.job)}"/>
	<table>
		<caption style="text-align:left">총 건수: ${empList.size()}</caption>
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>관리자번호</th>
			<th>입사일</th><th>연봉</th><th>보너스</th><th>부서번호</th></tr>
		<c:forEach var="emp" items="${empList}">
		<tr><td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td><td>${emp.mgr}</td>
			<td>${emp.hiredate}</td><td>${emp.sal}</td><td>${emp.comm}</td><td>${emp.deptno}</td></tr>
		</c:forEach>
	</table><br>
	<%-- ex) 회원리스트 검색처리(dao.memberList참고) --%>
	<h3>회원검색</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th>
			<td><input type="text" name="id" value="${param.id}"/></td></tr>
		<tr><th>이름</th>
			<td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>			
	</table>
	</form>
	
	<jsp:useBean id="dao2" class="jspexp.a03_database.A04_MemberDao"/>
	<c:set var="memList" value="${dao2.memberList(param.id, param.name)}"/>
	<table>
		<!-- id, pass, name, point, address, regdte, auth -->
		<caption style="text-align:left">총 건수: ${memList.size()}</caption>
		<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>포인트</th>
			<th>주소</th><th>등록일</th><th>권한</th></tr>
		<c:forEach var="mem" items="${memList}">
		<tr><td>${mem.id}</td><td>${mem.pass}</td><td>${mem.name}</td><td>${mem.point}</td>
			<td>${mem.address}</td><td>${mem.regdte}</td><td>${mem.auth}</td></tr>
		</c:forEach>
	</table>
</body>
</html>












