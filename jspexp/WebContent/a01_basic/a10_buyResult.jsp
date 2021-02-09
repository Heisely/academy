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
	<h3>a09 요청값 처리</h3>
	<form action="a09_requestExp.jsp" method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"></td></tr>
		<tr><th>개수</th><td><input type="text" name="cnt" value="0"></td></tr>
		<tr><th>구매방법</th>
			<td>
				<select name="pay">
					<option>현금</option>
					<option>카드</option>
					<option>포인트</option>
				</select>
			</td>
		</tr>
		<tr><th>배송지</th>
			<td>
				<input type="radio" name="address" value="서울 방배동">서울 방배동
				<input type="radio" name="address" value="서울 신림동">서울 신림동
				<input type="radio" name="address" value="경기 수원시">경기 수원시			
			</td>
		</tr>
		<tr><th>관심물건</th>
			<td>
				<label><input type="checkbox" name="ps" value="바나나">바나나</label>
				<label><input type="checkbox" name="ps" value="딸기">딸기</label>
				<label><input type="checkbox" name="ps" value="수박">수박</label>
				<label><input type="checkbox" name="ps" value="오렌지">오렌지</label>
				<label><input type="checkbox" name="ps" value="키위">키위</label>
			</td>
		</tr>
		<tr><td colspan="2" style="text-align:center"><input type="submit" value="구매"></td>
	</table>
	</form>
</body>
</html>