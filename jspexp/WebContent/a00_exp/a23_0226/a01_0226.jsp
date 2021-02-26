<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<fmt:requestEncoding value="UTF-8"/>    
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
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<%--
[JSP]
[하] 1. fmt의 날짜 형식에 있어서 각 속성값을 기술하세요
		기본 출력: ${now}
			==> Fri Feb 26 17:05:45 KST 2021 
		날짜 기본형식: <fmt:formatDate type="date" value="${now}"/>
			==> Feb 26, 2021
		날짜 full 형식: <fmt:formatDate type="date" dateStyle="full" value="${now}"/>
			==> Friday, February 26, 2021
		날짜 short 형식: <fmt:formatDate type="date" dateStyle="short" value="${now}"/>
			==> 2/26/21
			
[하] 2. fmt의 숫자 형식에 있어서 각 속성값을 기술하세요
		기본형식: ${num01}
			==> 99999.75
		숫자 기본형식: <fmt:formatNumber value="${num01}" var="numFmt01"/>
			==> 지정된 num01이 없어서 출력되지 않음
		변수로 지정: ${numFmt01}
			==> 99,999.75
		숫자 통화형식: <fmt:formatNumber value="${num01}" type="currency"/>
			==> $99,999.75
		숫자 통화형식: <fmt:formatNumber value="${num01}" type="currency" currencySymbol="만원"/>
			==> 만원99,999.75
		숫자 퍼센트형식1: <fmt:formatNumber value="${num01}" type="percent"/>
			==> 9,999,975%
		숫자 퍼센트형식2: <fmt:formatNumber value="${0.25}" type="percent"/>
			==> 25%
		숫자 패턴형식: <fmt:formatNumber value="${num01}" pattern="0,000,000.000"/>
			==> 0,099,999.750
			
[중] 3. 사원테이블의 부서별 최근입사일과 평균 연봉을 화면에 출력하되
        - 입사일은 yyyy/MM/dd 형식, 연봉은 소숫점 2자리까지 표현하세요.
--%>
<%-- 	<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="elist" value="${dao.elist()}"/>
	<h3>부서별 평균 연봉</h3>
	<table>
		<tr><th>부서번호</th><th>최근입사일</th><th>평균 연봉</th></tr>
		<c:forEach var="e" items="${elist}">
		<tr>
			<td>${e.deptno}</td>
			<td><fmt:formatDate pattern="yyyy/MM/dd" value="${e.hiredate}"/></td>
			<td><fmt:formatNumber value="${e.sal}" pattern="0,000.00"/></td>
		</tr>
		</c:forEach>
	</table>
	--%>
<%--
[하] 4. mvc 패턴이란 무엇인가?
		> 웹 개발을 Model과 View와 Controller로 역할을 분담하여 처리하는 commander 패턴 개발 방식
		
[하] 5. 기본 예제를 기준으로 mvc패턴을 실제 코드를 설명하세요.
		> servlet
		// 1. 요청값 처리 및 받기
		String name = request.getParameter("name");
		String korS = request.getParameter("kor");
		String engS = request.getParameter("eng");
		String mathS = request.getParameter("math");
		
		// 2. Model 데이터 만들기(다른 클래스로 분리해서 처리하는 경우가 많음)
		int kor = 0; if(korS!=null) kor = Integer.parseInt(korS);
		int eng = 0; if(engS!=null) eng = Integer.parseInt(engS);
		int math = 0; if(mathS!=null) math = Integer.parseInt(mathS);
		// Student 테이블생성 (String name, int kor, int eng, int math) - 생성자, getter,setter
		// 메서드로 getTot(), getAvg() 추가
		//	1) 모델데이터 설정: view에서 사용할 수 있게 처리
		request.setAttribute("stud", new Student(name,kor,eng,math));
		
		// 3. View단 호출(a11_mvc\a01_start.jsp)
		String page="a11_mvc\\a01_start.jsp"; // a01_start.jsp에서 만든 폼과 요청값을 불러옴
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);

[하] 6. mvc.do?id=himan&pass=7777로 controller단에 요청값을 넘기고
        himan/7777일 때는 view단(jsp)에 @@님 환영합니다. 그외에는 @@@님은 인증된 계정이 아닙니다.
        출력하세요.
 		> servlet
 		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idS = request.getParameter("id");
		String passS = request.getParameter("pass");
		
		String id = null; if(idS!=null) id = idS;
		String pass = null; if(passS!=null) pass = passS;		
		request.setAttribute("mem", new Member(id,pass));		
		
		String page = "a00_exp\\a23_0226\\a01_0226.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);	
		rd.forward(request, response);
	}
--%>
	<c:choose>
		<c:when test="${mem.id==null || mem.pass==null}"></c:when>
		<c:when test="${mem.id == 'himan' && mem.pass=='7777'}">${mem.id}님 환영합니다.</c:when>
		<c:otherwise>${mem.id}님은 인증된 계정이 아닙니다.</c:otherwise>
	</c:choose>
</body>
</html>