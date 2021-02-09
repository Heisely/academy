<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
		alert("입력한 답: <%=request.getParameter("answer")%>, 정답: <%=request.getParameter("minus")%>");
		if(confirm("틀렸습니다. 다시 도전하시겠습니까?")){
			location.href = "a01_jspExp.jsp";
		}
	};
</script>
</head>
<body>
	<h3>틀렸습니다.</h3>
	
</body>
</html>