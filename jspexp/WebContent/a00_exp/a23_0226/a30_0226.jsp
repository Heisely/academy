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
<%--
[JSP]
[하] 1. fmt의 날짜 형식에 있어서 각 속성값을 기술하세요
		<fmt:formatDate 
			type="date|time|both"
			dateStyle="full/short"
			pattern="yyyy/MM/dd kk:mm:ss:S"
			value="${날짜데이터}"/>
[하] 2. fmt의 숫자 형식에 있어서 각 속성값을 기술하세요
		<fmt:formatNumber
			type="currency|percent"
			pattern="99,999.99": 특정한 형식으로 숫자 출력 처리
			currencySymbol="단위처리"/>
[중] 3. 사원테이블의 부서별 최근입사일과 평균 연봉을 화면에 출력하되
        - 입사일은 yyyy/MM/dd 형식, 연봉은 소숫점 2자리까지 표현하세요.
        1) sql 작성
        2) dao 추가
        3) 화면 호출 처리
[하] 4. mvc 패턴이란 무엇인가?
		웹개발에서 Model, View, Controller라는 역할 분담을 소스별로 하여 효율적으로 개발하는 방식.
		패턴 자바에 commander패턴과 유사
		controller: 중재자 역할로 요청값을 처리하고,
					model 객체를 호출 및 선언하고, 
					view단(화면-jsp/html)을 호출하는 클래스/객체.
					- 주로 servlet으로 구성되어 있음
		model: 화면단에 구현될 핵심데이터를 조건이나 반복, dao를 통해 가져와서 key, value형식으로 저장되는 데이터
		view: 출력할 화면단을 말하며, 주로 jsp/html/다운로드할 파일/pdf등 여러 가지 형식으로 구성될 수 있음. 
			  controller에서 선언된 model데이터를 el/jstl로 출력.
		
[하] 5. 기본 예제를 기준으로 mvc패턴을 실제 코드를 설명하세요.
		A01_StartController.java: controller단
		request.setAttribute("stud", new Student(name,kor,eng,math));: model 객체 controller에서 선언
		a11_mvc\\a01_start.jsp: view 단
			${stud.name}: 모델 데이터의 속성값을 호출
			
		# controller의 주요 처리 내용
		// 1. 요청값 처리
		String name = request.getParameter("name");
		String korS = request.getParameter("kor");
		String engS = request.getParameter("eng");
		String mathS = request.getParameter("math");
		
		// 2. 모델데이터를 위해 가공 및 모델 데이터 선언
		if(name==null) name="";
		int kor=0; if(korS!==null) kor = Integer.parseInt(korS);
		int eng=0; if(engS!==null) eng = Integer.parseInt(engS);
		int math=0; if(mathS!==null) math = Integer.parseInt(mathS);
		request.setAttribute("stud", new Student(name,kor,eng,math));
		
		// 3. view단의 호출
		RequestDispatcher rd = request.getRequestDispatcher("호출할 jsp화면");
		rd.forward(request,response);
		
[하] 6. mvc4.do?id=himan&pass=7777로 controller단에 요청값을 넘기고
        himan/7777일 때는 view단(jsp)에 @@님 환영합니다. 그외에는 @@@님은 인증된 계정이 아닙니다.
        출력하세요.
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	
</body>
</html>