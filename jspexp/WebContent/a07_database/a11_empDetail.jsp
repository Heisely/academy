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
<%
String empno = request.getParameter("empno");
A01_Dao dao = new A01_Dao();
// 1개의 단위 객체
Emp emp = dao.getEmp(new Integer(empno));
%>
<body>
	<h3>사원상세정보[<%=empno%>]</h3>
	<form method="post">
	<table>
		<tr><th>사원번호</th><td><input type="text" name="empno" value="<%=emp.getEmpno()%>"></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%=emp.getEname()%>"></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value="<%=emp.getJob()%>"></td></tr>
		<tr><th>관리자번호</th><td><input type="text" name="mgr" value="<%=emp.getMgr()%>"></td></tr>
		<tr><th>입사일</th><td><input type="text" name="hiredate_s" value="<%=emp.getHiredate()%>"></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal" value="<%=emp.getSal()%>"></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm" value="<%=emp.getComm()%>"></td></tr>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%=emp.getDeptno()%>"></td></tr>
		<tr><td colspan="2">
			<input type="button" value="수정"/>
			<input type="button" value="삭제"/>
			<input type="button" value="메인페이지이동" onclick="location.href='a03_searchEmpList.jsp'"/>
		</td></tr>
	</table>
	</form>
</body>
</html>