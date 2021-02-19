<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
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
/* 

*/
//
	$(document).ready(function(){
		$("h3").text("시작");
	});
</script>
</head>
<body>
<jsp:useBean id="bk" class="jspexp.z01_vo.Book" scope="session"/>
<jsp:setProperty property="*" name="bk"/>
<h2>도서 입력</h2>
<form method="post">
	도서명: <input name="name"/><br>
	저자: <input name="writer"/><br>
	출판사: <input name="publisher"/><br>
	<input type="submit" value="등록"/><br> 
</form>

<h2>등록 내용</h2>
<%-- bean으로 선언된 내용도 바로 사용할 수 있다. --%>
<h4>${bk.name}</h4>
<h4>${bk.writer}</h4>
<h4>${bk.publisher}</h4>
<a href="a05_show.jsp">다음 페이지</a>

<%--
ex) login화면 구현 id,pass himan/7777일 때, 로그인 성공 / 그 외 로그인 실패
	bean을 이용해서 처리
--%>
<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
<jsp:setProperty property="*" name="m"/>
<h2>로그인</h2>
<form method="post">
	ID: <input name="id"/><br>
	PW: <input name="pass"/><br>
	<input type="submit" value="로그인"/><br>
</form>
<h4 align="center">
	<%-- 
	${empty 변수}: null 이거나 공백("")일 때 true
	삼항연산(기본): 조건 ? true일 때 : false일 때
	false일 때 또 조건문을 걸 수 있음
		> 조건1 ? 조건1이 true일 때 : 조건 2 ? 조건2가 true일 때 : 그 외  
	--%>
	
	${(empty m.id)?"":(m.id=='himan' and m.pass=='7777')? "로그인 성공":"로그인 실패"}</h4>
</body>
</html>