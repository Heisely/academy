<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*" 
    import="jspexp.a00_exp.A01_0209_Dao"
    import="jspexp.a00_exp.*"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();%>    
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
<body>
<%--
[하] 1. 특정 요청사항에 따른 웹화면 구성 순서별로 선언하세요.
		1) 화면 구성
		2) SQL 작성 및 조회
		3) VO 생성
			- 생성자, 메서드(getter, setter) 생성
		4) Dao단 기능 메서드 선언
			- public ArrayList<VO> list(매개변수){
					1. 연결 (try-catch문으로 setCon();)
					2. 대화 (sql문 선언, Statement, result)
					3. 결과 (while(rs.next()) 사용)
					4. 자원해제 (역순으로, rs.close() >>> con.close())
					5. 예외처리 (SQLException, Exception)
			  }
		5) 요청값과 DAO 기능 메서드 매개변수 데이터 처리
			A01_Dao dao = new A01_Dao();
			ArrayList<VO명> list명 = dao.메서드(매개변수);
		6) 화면 출력
			원하는 폼으로 출력
[중] 2. 회원아이다, 회원패스워드, 이름, 포인트, 주소, 등록일, 권한이 있고, 
        회원아이디와 이름으로 검색하는 웹화면을 구성할려고 한다.
        위 내용을 새로운 테이블을 만들고 처리해보세요.
--%>
<%
String id = request.getParameter("id");
if(id==null) id="";
String name = request.getParameter("name");
if(name==null) name="";
log("# 검색 내용 #");
log("아이디: "+id);
log("이름: "+name);
							
%>
<%
A01_0209_Dao dao = new A01_0209_Dao();
ArrayList<Members> mlist = dao.mlist(id,name);
%>
	<h3>검색</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" value="<%=id%>"></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value="<%=name%>"></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"></td></tr>
	</table>
	</form>
	<table>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th><th>포인트</th><th>주소</th><th>등록일</th><th>권한</th></tr>
		<% for(Members m:mlist) {%>	
			<tr><td><%=m.getId()%></td>
				<td><%=m.getPw()%></td>
				<td><%=m.getName()%></td>
				<td><%=m.getPoint()%></td>
				<td><%=m.getAddress()%></td>
				<td><%=m.getRegdte()%></td>
				<td><%=m.isAble() %></td>
			</tr>
		<%}%>
	</table>
</body>
</html>