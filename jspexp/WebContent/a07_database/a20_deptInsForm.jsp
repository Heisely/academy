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
<%
	String deptno = request.getParameter("deptno");
	if(deptno==null||deptno.trim().equals("")) deptno="0";
	log("#deptno: "+deptno);
	
	String dname = request.getParameter("dname");
	if(dname==null) dname="";
	log("#dname: "+dname);
	
	String loc = request.getParameter("loc");
	if(loc==null) loc="";
	log("#loc: "+loc);
	
	if(!dname.equals("")){
		A02_DeptDao dao = new A02_DeptDao();
		dao.insertDept(new Dept(new Integer(deptno),dname, loc));
	}
%>
	<script>
		var dname = "<%=dname%>";
		if(dename!=""){
			if(confirm("부서등록 성공\n조회페이지로 이동하시겠습니까?")){
				location.href="a04_searchDeptList.jsp";
			}
		}
	</script>
	<h3>부서정보등록</h3>
	<form method="post">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno"/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>위치</th><td><input type="text" name="loc"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="부서정보등록"/></td></tr>
	</table>
	</form>
</body>
</html>