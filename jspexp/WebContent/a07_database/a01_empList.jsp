<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
   A01_Dao dao = new A01_Dao();
   ArrayList<Emp> elist = dao.empList();%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<%--
# DAO에서 온 데이터 화면에서 처리해서 출력하기
1. import
2. 객체생성
3. expression
--%>
<body>
	<h3>사원정보</h3>
	<table>
		<tr><th>사원번호</th><th>사원명</th><th>직책명</th><th>관리자번호</th><th>입사일</th><th>급여</th><th>보너스</th><th>부서번호</th></tr>
		<%for(Emp e:elist){ %>
		<tr><td><%=e.getEmpno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getJob() %></td>
			<td><%=e.getMgr() %></td>
			<td><%=e.getHiredate() %></td>
			<td><%=e.getSal() %></td>
			<td><%=e.getComm() %></td>
			<td><%=e.getDeptno() %></td></tr>
		<%} %>
	</table>
</body>
</html>