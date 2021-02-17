<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	tr:hover{background-color:yellow;}
</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<%--
1. 화면구성
2. 요청값확인
3. SQL작성
	SELECT * FROM dept 
	WHERE dname LIKE '%'||'E'||'%'
	AND loc LIKE '%'||'A'||'%'
4. VO
5. Dao: 필드, 공통메서드, 기능메서드
6. 기능메서드 상세내용 처리, main()을 통해 확인
7. JSP화면
	1) import
	2) 객체생성
	3) 요청값 null에 대한 default설정 ""
	4) DB처리 메서드 호출
	5) for문을 통한 화면 처리
	
===================================
# 등록
1. 리스트
	등록 버튼으로 등록화면 이동
2. 등록화면
	등록내용 form, 데이터
	요청값 받기
	VO 객체로 할당
3. A02_DeptDao.java
	0) SQL, VO
	1) 공통
	2) 기능메서드 public void insertDept(Dept ins){}
		- 연결
		- autoCommit(false)
		- 대화
		- commit
		- 자원해제
		- exception
4. 등록화면 DAO 호출
	1) 요청값에 의해 할당된 VO, DAO 기능 메서드에 매개값으로 할당
	2) script로 "등록완료, 조회페이지 이동" 처리
--%>
<body>
<%
	String dname = request.getParameter("dname");	if(dname==null) dname="";
	String loc = request.getParameter("loc");	if(loc==null) loc="";
	log("#### dname: "+dname);
	log("#### loc: "+loc);

	A02_DeptDao dao = new A02_DeptDao();
	ArrayList<Dept> dlist = dao.deptList(new Dept());
%>
	<h3>부서정보검색</h3>
	<form method="post">
	<table>
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
		<tr><th>지역</th><td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" value="등록" onclick="location.href='a20_deptInsForm.jsp'"/>	
		</td></tr>
	</table>
	</form>
	
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept d: dlist){ %>
		<tr onclick="detail(<%=d.getDeptno()%>)"><td><%=d.getDeptno()%></td><td><%=d.getDname()%></td><td><%=d.getLoc()%></td></tr>
		<%} %>
	</table>
</body>
<script type="text/javascript">
	function detail(deptno){
		location.href="a21_deptnoDetail.jsp?deptno="+deptno;
	}
</script>
</html>