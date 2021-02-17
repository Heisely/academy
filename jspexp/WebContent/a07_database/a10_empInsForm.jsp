<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a03_database.*"
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
<%--
# 등록 처리
1. 요청값 default값 설정, 모아서 VO객체로 생성
2. DAO 기능 메서드에서 VO로 전달
--%>
<body>
<%
	String ename = request.getParameter("ename");
	if(ename==null) ename="";
	log("#ename: "+ename);
	
	String job = request.getParameter("job"); 
	if(job==null) job="";
	log("#job: "+job);
	
	String mgr = request.getParameter("mgr"); 
	if(mgr==null||mgr.trim().equals("")) mgr="0";
	log("#mgr: "+mgr);	
	
	String hiredate_s = request.getParameter("hiredate_s"); 
	if(hiredate_s==null) hiredate_s="";
	log("#hiredate_s: "+hiredate_s);
	
	String sal = request.getParameter("sal"); 
	if(sal==null||sal.trim().equals("")) sal="0";
	log("#sal: "+sal);	
	
	String comm = request.getParameter("comm"); 
	if(comm==null||comm.trim().equals("")) comm="0";
	log("#comm: "+comm);	
	
	String deptno = request.getParameter("deptno"); 
	if(deptno==null||deptno.trim().equals("")) deptno="0";
	log("#deptno: "+deptno);
	
	// 입력할 객체 완성.
	if(!ename.equals("")){ // 초기 화면과 구분하기 위해서
		Emp ins = new Emp(0, ename, job, new Integer(mgr), hiredate_s, 
				new Double(sal), new Double(comm), new Integer(deptno));
		log("#입력 내용 확인: "+ins.getEname());
		A01_Dao dao = new A01_Dao();
		dao.insertEmp(ins);
	}
%>
	<script>
		var ename = "<%=ename%>";
		if(ename!=""){
			alert("등록 성공");
			if(confirm("등록 성공\n조회페이지로 이동하시겠습니까?")){
				location.href="a03_searchEmpList.jsp";
			}
		}
	</script>
	<h3>사원등록페이지</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename"/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job"/></td></tr>
		<tr><th>관리자</th><td><input type="text" name="mgr"/></td></tr>
		<tr><th>입사일</th><td><input type="text" name="hiredate_s" placeholder="YYYY/MM/DD"/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal"/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm"/></td></tr>
		<tr><th>부서번호</th><td><input type="text" name="deptno"/></td></tr>
		<tr><td colspan="2">
		<input type="button" value="수정"/>
		<input type="button" value="삭제"/>
		<input type="button" onclick="validCk()" value="등록"/>
		<input type="button" value="메인페이지이동" onclick="location.href='a03_searchEmpList.jsp'"/></td></tr>
	</table>
	</form>
	<script type="text/javascript">
		function validCk(){
			var ename = document.querySelector("[name=ename]").value;
			if(ename.trim==""){
				alert("사원명을 입력해주세요.");
				return;
			}
			
			// 유효성 check 후 최종적으로 전송
			document.querySelector("form").submit();
		}
	</script>
</body>
</html>