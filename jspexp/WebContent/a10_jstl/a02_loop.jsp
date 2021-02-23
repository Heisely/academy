<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%--
# JSTL의 반복문 처리
1. 기본 형식
	<c:forEach var="cnt" begin="시작변수" end="마지막변수" step="증감단위">
		<h2>${cnt}</h2>
	</c:forEach>
	> for문과 비교
		<% for(int cnt=시작변수; cnt<=마지막변수; cnt++(증감단위)){ %>
			<h2><%=cnt%></h2>
		<% } %>
2. 기타 옵션
	1) varStatus = "sts"
		${sts.index}: 반복문 0부터 시작하는 index를 출력
		${sts.count}: 반복문 1부터 시작하는 count를 출력
		${sts.first}: boolean으로 첫 번째 값인지의 여부를 출력
		${sts.last}: boolean으로 마지막 값인지의 여부를 출력
--%>
//
	$(document).ready(function(){
		$("h3").text("반복문");
	});
</script>
</head>
<body>
	<h3>제목</h3>
	<h2>1~15까지 출력</h2>
	<c:forEach var="cnt" begin="1" end="15">
		<h4>${cnt}</h4>
	</c:forEach>
	<%-- ex1) 1~7까지 출력하면서 <h5>안녕하세요</h5> 표시 --%>
	<h2>ex1</h2>
	<c:forEach var="cnt" begin="1" end="7">
		<h5>${cnt} 안녕하세요</h5>
	</c:forEach>
	<%-- ex2) 테이블의 열을 1열~3열까지 표현하세요. --%>
	<h2>ex2</h2>
	<table>
		<tr><c:forEach var="cnt" begin="1" end="3">
			<td>${cnt}열</td>
		</c:forEach></tr>
	</table>
	<%-- ex3) 테이블의 열을 1행~3행까지 표현하세요. --%>
	<table>
		<c:forEach var="cnt" begin="1" end="3">
			<tr><td>${cnt}행</td></tr>
		</c:forEach>
	</table>
	<%-- ex4) 테이블의 행/열을 4X4로 출력하여 표시하세요. --%>
	<table>
		<c:forEach var="row" begin="1" end="4">
			<tr><c:forEach var="col" begin="1" end="4">
				<td>${row}행 ${col}열</td> 
			</c:forEach></tr>
		</c:forEach>
	</table>
	<table>
		<c:forEach var="cnt" begin="1" end="16">
			<c:if test="${cnt%4==1}">
				<tr>
			</c:if>
				<td>${cnt}</td>
			<c:if test="${cnt%4==0}">
				</tr>
			</c:if>			
		</c:forEach>
	</table>
</body>
</html>















