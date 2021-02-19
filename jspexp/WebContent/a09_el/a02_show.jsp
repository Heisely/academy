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
		$("h3").text("el 세션 설정값 확인");
	});
</script>
</head>
<body>
	<h3></h3>
	<h4>ID: ${mem.id}</h4>
	<h4>Pass: ${mem.pass}</h4>
	<h4>Name: ${mem.name}</h4>
	<h4>Auth: ${mem.auth}</h4>
</body>
</html>