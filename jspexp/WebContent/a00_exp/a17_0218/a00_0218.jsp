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
		$("h3").text("회원 id 확인");
	});
</script>
</head>
<body>
<%--
1. 화면 구현
2. bean객체 선언
3. bean객체에 의한 요청값 확인
4. 사용하게 될 sql 확인
5. DAO 처리 기능 메서드 선언
6. DAO 기능 메서드 호출
7. 결과에 따른 JS 처리
--%>
	<h3></h3>
	<form method="post">
	<table>
		<tr><th>회원 id</th><td><input type="text" name="id"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록여부확인"/></td></tr>
	</table>
	</form>
	<jsp:useBean id="mem" class="jspexp.z01_vo.Member"/>
	<jsp:setProperty property="id" name="mem"/>
	<%
		boolean isInit = true;
		boolean hasMember = false;
		if(mem.getId()!=null){
			isInit = false;
			log("## 입력한 id: "+mem.getId());			
			A04_MemberDao dao = new A04_MemberDao();
			hasMember = dao.hasMember(mem.getId());
		}
	%>
	<script type="text/javascript">
		var isInit = <%=isInit%>;
		if(!isInit){ // 요청값이 있을 때(초기화면이 아닐 때, id를 확인했을 때)
			var hasMember = <%=hasMember%>;
			if(hasMember){
				alert("해당 id는 이미 등록된 id입니다. 다른 id를 입력해주세요.");
				$("[name=id]").focus();
			} else {
				alert("해당 id는 등록이 가능합니다.");
				$("[name=id]").val("<%=mem.getId()%>");
			}
		}
	</script>
</body>
</html>