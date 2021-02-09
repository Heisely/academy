<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"%>
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

	};
</script>
</head>
<%--
# JSP의 시작 끝
0. 서버와 클라이언트 개념에 의한 클라이언트단 프로그램과 구분
	클라이언트(브라우저) ---(페이지와 request)---> 서버(WAS)
					<------(response)------
1. 기초
	1) java 프로그래밍
		- 변수
		- 조건/반복
		- 객체
		- 상속
		- 예외
	2) JSP의 페이지 구성
		- 상단 directive 선언
		- script(declare, scriptlet, expression)
2. JSP에서 사용되는 객체
	1) 요청값 처리하는 형식
		- URL 형식
		- form 형식: input(text,checkbox, radio...), select, textarea 
		- 단일/다중 데이터 처리와 form하위 요소객체들과 연관관계
	2) request, response, out, session
3. JSP 객체별 범위
	1) pageContext
	2) request
	3) session
	4) application
4. 모듈 분리 처리
	1) include 액션 태그, directive include
	2) forward 태그
5. 예외 처리
6. 기타 java stream 처리
7. 서버와 클라이언트 데이터 처리
	1) cookie
	2) session
8. JSP에서 사용되는 순수 JSP 언어 - tag(JSP에서 사용되는 태그)
	1) 사용자 정의 태그
	2) <jsp:useBean>
	3) JSTL(JSP Standard Tag Language)
	4) EL(Expression Language)
9. database 연동
	1) 연동 모듈 만들기(DAO - Database Access Object)
	2) VO(Value Object), DTO(Data Transfer Object)
	3) DAO와 VO, DTO를 통해서 처리된 내용
	4) EL/JSTL을 통해 화면에 출력
10. MVC(Model View Controller) - model2
	1) servlet(Controller)
	2) 데이터액세스 및 핵심 데이터 처리(model)
	3) 화면단 출력 (view - JSP화면)
==============================================================================
11. Spring framework 활용
--%>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>