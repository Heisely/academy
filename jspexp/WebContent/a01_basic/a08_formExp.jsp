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
	<h3>ex3</h3>
	<form action="a07_requestExp.jsp" method="post">
	<table>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>나이</th><td><input type="text" name="age"></td></tr>
		<tr><th>취미생활</th>
			<td>
				<label><input type="checkbox" name="hobby" value="음악감상">음악감상</label>
				<label><input type="checkbox" name="hobby" value="독서">독서</label>
				<label><input type="checkbox" name="hobby" value="pc게임">pc게임</label>
				<label><input type="checkbox" name="hobby" value="여행">여행</label>
			</td>
		</tr>
		<tr><td colspan="2" style="text-align:center;"><input type="submit" value="등록"></td></tr>
	</table>
<!--	이름: <input type="text" name="name" size="10"><br>
		나이: <input type="text" name="age" size="10" value="0"><br>
		취미:
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="pc게임">pc게임
			<input type="checkbox" name="hobby" value="여행">여행
		<br>
		<input type="submit" value="전송"> -->
	</form>
</body>
</html>