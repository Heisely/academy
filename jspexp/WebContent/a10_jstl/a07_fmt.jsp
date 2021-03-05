<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
# fmt: 유형 JSTL 태그
1. 데이터유형을 변경하거나 원하는 데이터를 처리할 때 주로 사용
2. 공통 설정 변경
	String path = request.getContextPath();
		> <c:set var="path" value="${pageContext.request.contextPath}"/>
	request.setCharacterEncoding("utf-8")
		> <fmt:requestEncoding value="utf-8"/>
3. 날짜
	1) 날짜 + 시간
	2) data type은 java.util.Date를 사용
	3) 기본 형식
		<fmt:formatDate type="date|time|both"
			 dateStyle="full|short"
			 pattern="yyyy/MM/dd kk:mm:ss.S"
			 value="선언된 데이터"/>
4. 숫자
	1) 통화나 소숫점 이하 등 지정된 형식으로 처리
	2) type의 속성
		currency: 통화 단위
		percent: %
	3) pattern: 00,000,000.000 등과 같이 특정한 출력 형식을 처리할 수 있다.
--%>
	$(document).ready(function(){
		
	});
</script>
<%
pageContext.setAttribute("now", new Date()); // 현재 날짜: java.util.Date 객체
pageContext.setAttribute("num01", 99999.75); // 숫자데이터
%>
</head>
<body>
	<h2>날짜 처리</h2>
	<h4>기본 출력: ${now}</h4>
	
	<h4>날짜 기본형식: <fmt:formatDate type="date" value="${now}"/></h4>
	<h4>날짜 full 형식: <fmt:formatDate type="date" dateStyle="full" value="${now}"/></h4>
	<h4>날짜 short 형식: <fmt:formatDate type="date" dateStyle="short" value="${now}"/></h4>
	
	<h4>시간 기본형식: <fmt:formatDate type="time" value="${now}"/></h4>
	<h4>시간 full 형식: <fmt:formatDate type="time" timeStyle="full" value="${now}"/></h4>
	<h4>시간 short 형식: <fmt:formatDate type="time" timeStyle="short" value="${now}"/></h4>
	
	<h4>날짜/시간 기본형식: <fmt:formatDate type="both" value="${now}"/></h4>
	<h4>날짜/시간 full 형식: <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}"/></h4>
	<h4>패턴 형식: <fmt:formatDate pattern="yyyy/MM/dd kk:mm:ss.S" value="${now}"/></h4>
<%--<table>
		<tr><th colspan="2">기본출력</th><td>${now}</td></tr>
		<tr><th rowspan="3">날짜</th><th>기본형식</th><td><fmt:formatDate type="date" value="${now}"/></td></tr>
		<tr><th>full형식</th><td><fmt:formatDate type="date" dateStyle="full" value="${now}"/></td></tr>
		<tr><th>short형식</th><td><fmt:formatDate type="date" dateStyle="short" value="${now}"/></td></tr>
		<tr><th rowspan="3">시간</th><th>기본형식</th><td><fmt:formatDate type="time" value="${now}"/></td></tr>
		<tr><th>full형식</th><td><fmt:formatDate type="time" timeStyle="full" value="${now}"/></td></tr>
		<tr><th>short형식</th><td><fmt:formatDate type="time" timeStyle="short" value="${now}"/></td></tr>
		<tr><th rowspan="3">날짜/시간</th><th>기본형식</th><td><fmt:formatDate type="both" value="${now}"/></td></tr>
		<tr><th>full형식</th><td><fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}"/></td></tr>
		<tr><th>패턴형식</th><td><fmt:formatDate pattern="yyyy/MM/dd kk:mm:ss.S" value="${now}"/></td></tr>
	</table> --%>
	
	<h2>기본형식: ${num01}</h2>
	<h4>숫자 기본형식: <fmt:formatNumber value="${num01}" var="numFmt01"/></h4>
	<h4>숫자 통화형식: <fmt:formatNumber value="${num01}" type="currency"/></h4>
	<h4>숫자 통화형식: <fmt:formatNumber value="${num01}" type="currency" currencySymbol="만원"/></h4>
	
	<h4>숫자 퍼센트형식1: <fmt:formatNumber value="${num01}" type="percent"/></h4>
	<h4>숫자 퍼센트형식2: <fmt:formatNumber value="${0.25}" type="percent"/></h4>
	<h4>숫자 패턴형식: <fmt:formatNumber value="${num01}" pattern="0,000,000.000"/></h4>
	
	<h4>변수로 지정: ${numFmt01}</h4>
	
	<%-- dao를 이용해서 emplist를 가져와서 forEach 구문으로 아래 내용을 출력하되
		hiredate를 both full 형식으로, sal을 천단위 원으로 표기, comm/sal 로 보너스 %를 표기
		사원명 입사일 급여 보너스(%) --%>
	<jsp:useBean id="dao" class="springweb.a03_database.A01_Dao"/>
	<c:set var="emplist" value="${dao.empList()}"/>
	<table>
		<tr><th>사원명</th><th>입사일</th><th>급여</th><th>보너스</th><th>보너스(%)</th></tr>
		<c:forEach var="e" items="${emplist}">
		<tr>
			<td>${e.empno}</td>
			<td><fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${e.hiredate}"/></td>
			<td><fmt:formatNumber value="${e.sal}" type="currency" currencySymbol="만원"/></td>
			<td><fmt:formatNumber value="${e.comm}" type="currency" currencySymbol="만원"/></td>
			<td><fmt:formatNumber value="${e.comm/e.sal}" type="percent"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>