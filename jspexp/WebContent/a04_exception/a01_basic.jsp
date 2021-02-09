<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="z01_error.jsp"%>
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
<%--
# 생각해봅시다
1. 웹프로그램에서는 어떤 상황에서 에러가 발생할까?
2. 안정적인 프로그램 실행과 신뢰성 있는 웹프로그램은 어떤 처리를 해야 할까?
3. 자바에서 배운 에러에 대한 예외처리는 어떤 것이 있었는지?

# 학습목표
1. 웹프로그램에서 예외란 어떤 개념인지 안다.
2. 웹프로그램에서 주로 처리되는 예외 처리 기본코드를 알고 실게 프로그램에서 처리할 수 있다.
3. 웹프로그램에서 필요로 하는 예외 사항을 파악하고 그 상황에 맞게 처리할 수 있다.
4. 페이지별로 처리하는 예외와 서버단위로 처리할 수 있는 예외를 구분하여 처리할 수 있다.

# JSP에서 에러 처리
1. JSP는 servlet 클래스로 컴파일되기 때문에 자바관련 여러 에러가 페이지에서 발생한다.
	이 때문에 페이지 단위로 에러에 대한 처리가 필요하고,
	일반적으로 에러페이지(에러가 발생시 대처페이지)를 화면으로 보이게 해 해당사이트에 대한 신뢰성을 높이기도 한다.
2. 에러페이지 지정처리
	1) 에러페이지를 만들고
		<%@ page isErrorPage="true"%>
		현재 페이지가 에러 처리를 위한 페이지임을 나타낸다.
		이 디렉티브선언에 의해 Exception 객체를 사용할 수 있게 처리
		예외의 기본 객체인 exception을 참조값으로 가지고 있다.
		Exception의 참조값은 exception을 활용할 수 있게 된다.
		ex) exception.getMessage(), exception.printStackTrace()를 활용
		주의) IE(인터넷익스플로러)에서는 예외가 올바르게 보이기 위해서
			에러페이지가 출력한 응답 데이터의 크기가 513바이트보다 커야 한다.
	2) 페이지 작성 시 상단에 에러가 발생했을 때 대체할 에러페이지를 지정
		에러의 가망성이 있는 페이지에서 사전에 선언한 에러페이지를 지정
		<%@ page errorPage="error.jsp"%>
3. 서버단위(web.xml)에서
	1) 응답 상태 코드별 에러 페이지 지정
		<error-page>
			<error-code>에러코드</error-code>
			<location>에러페이지 URI</location>
		error-code 404: 해당 페이지가 없을 때 나타나는 에러
			> http 반응코드값 500: 내부서버에러(예외처리)
			> 403: forbiden
		location: WebContext 하위 폴더 기준으로 에러를 처리할 페이지 지정
		ex)	<error-code>404</error-code>
			<location>/a04_exception/z01_error.jsp</location>
	2) 예외 타입 별 에러 페이지 지정
		<error-page>
			<error-code>에러 클래스 지정</error-code>
			<location>에러페이지 URI</location>
		ex)
		<error-page>
			<error-code>java.lang.NullPointerException</error-code>
			<location>/a04_exception/z05_null_exception.jsp</location>
4. 에러 페이지 우선 순위 및 에러 페이지 지정 형태
	1) 각 페이지에 지정된 에러
	2) web.xml에서 공통지정한 페이지 에러
5. 버퍼와 에러 페이지 처리
	에러페이지는 버퍼가 플러시 되기 전에 처리돼야 한다.
	
# 페이지당 에러 처리
1. error페이지 구현
	1) directive: isErrorPage="true"
	2) 화면단 처리
		필요한 정보 표기(에러발생 시 - 담당자 전화번호, 에러에 대한 내용 등)
		에러메시지: exception.getMessage()
		에러타입: exception.getClass().getName()
2. 에러 가능성이 있는 페이지 구현
	1) directive: errorPage="선언한 에러페이지"

# 서버당 에러 처리
1. 응답코드와 해당 클래스 확인
2. web.xml에 error-page 태그로 지정할 에러페이지 지정
3. error-page 선언
--%>
<%
	String s=null;
	s.toString(); // java.lang.NullPointerException: Cannot invoke "String.toString()" because "s" is null
%>
<%--
ex) a02_exp.jsp: 에러가능성 있는 페이지
		Integer.parseInt("");
	z02_error.jsp: 에러처리할 페이지
--%>
	<h3>예외처리</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>





















