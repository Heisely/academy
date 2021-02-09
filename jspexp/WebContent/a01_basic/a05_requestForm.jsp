<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- path기준으로 모든 자원(css,img,js)에 접근해 사용할 수 있다. --%>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<body>
	<h3>요청값 처리</h3>
	<form action="a06_requestRev.jsp" method="post">
		이름: <input type="text" name="name" size="10"><br>
		주소: <input type="text" name="address" size="30"><br>
		좋아하는 동물:
			<input type="checkbox" name="pet" value="dog">강아지
			<input type="checkbox" name="pet" value="cat">고양이
			<input type="checkbox" name="pet" value="pig">돼지
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>