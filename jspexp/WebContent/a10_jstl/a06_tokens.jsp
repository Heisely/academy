<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
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

1. 구분자에 의해서 데이터를 처리하는 것을 말한다.
2. 기본형식
	<c:forTokens var="변수명" items="구분자포함데이터" delims="구분자">
		${변수명}: 단위데이터
3. 속성
	1) var: 구분자에 의해서 추출된 하나의 데이터
	2) items: 구분자가 있는 문자열
	3) delims: 구분자
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>구분자 처리</h3>
	<c:forTokens var="color" items="red, green, blue" delims=",">
		<h2>${color}</h2>
	</c:forTokens>
<%-- ex) 과일명 사과; 오렌지; 수박; 딸기; 를 구분자로 처리하여 2*2 테이블에 출력 --%>
	<h3>구분자처리 예제</h3>
	<c:set var="cnt" value="1"/>
	<table>
		<c:forTokens var="fruits" items="사과; 오렌지; 수박; 딸기" delims=";" varStatus="sts">
		<c:if test="${cnt%2==1}"><tr></c:if>
			<td>${fruits}[${sts.index}]</td>
		<c:if test="${cnt%2==0}"></tr></c:if>
		<c:set var="cnt" value="${cnt+1}"/>
		</c:forTokens>
	</table>
	
<%--
   <c:forTokens var="fruit" items="apple;orange;watermelon;strawberry" delims=";" varStatus="sts">
      <c:if test="${sts.index%2==0 }"><tr></c:if>
         <td>${fruit }[${sts.index }][${cnt }]</td>
      <c:if test="${sts.index%2==1 }"><tr></c:if>
      <c:set var="cnt" value="${cnt+1 }"/>      
   </c:forTokens>   
    --%>
   </table>
   <%--
   위 과일예제
   <table>
      <tr>
      <c:forEach var="fruit" items="apple;orange;watermelon;strawberry" delims=";" varStatus="sts">   
         <c:if test="sts.count%2==1"><tr></c:if>
         <td>${fruit}[${sts.count}]</td>
         <c:if test="sts.count%2==0"></tr></c:if>
      </c:forEach>
   
   <table>
      <tr><td>사과1</td><td>오렌지2</td></tr>
      <tr><td>수박3</td><td>딸기4</td></tr>
   </table>
   
   sts.count 기준으로 1, 3일 때 시작 <tr>을 추가
   sts.count 기준으로 2, 4에서 </tr>을 추가
   =======================================================================================
   <table>
      <tr><td>사과1</td><td>오렌지2</td><td>수박3</td><td>딸기4</td></tr>
   </table>
      
   <table>
      <tr>
      <c:forEach var="fruit" items="apple;orange;watermelon;strawberry" delims=";">   
         <td>${fruit}
   
    --%>

</body>
</html>