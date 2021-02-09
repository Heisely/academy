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
<body>
<%--        
[JSP]
[하] 1. session의 life cycle을 메서드와 함께 기술하세요.
		1) 쿠키 생성(서버): Cookie c = new Cookie(이름, 값)
		2) 쿠키 생성 내용 전달(서버)
			response.addCookie(c);
		3) 쿠키 저장(브라우저)
			브라우저의 특정 위치에 저장됨
		4) 쿠키 저장 내용 전달(브라우저)
			request에 의해 전달, 페이지 호출
		5) 전달 되어온 쿠키 확인 처리(서버)
			Cookie[] c = request.getCookie();
--%>
<%--
[중] 2. 로그인 id : [    ] pass:[   ]로그인
        요청값 himan/7777일 session 값 처리를 설정하고, 그외에는 다시 로그인
        로그인 성공 후에는 session 값으로id 확인 @@@님 로그인중, 
        로그아웃 클릭시, session값을 없애고 다시 로그인 페이지 이동 처리하는
        기능을 구현하세요.
--%>

<%--
[DB]
[하] 1. DB서버를 접속하기 위한 환경과 필요한 핵심 api의 기능을 서술하세요
	1) java: 환경 구성
		- DB 서버 구축, 계정 생성, 사용할 DB테이블 생성 및 데이터 입력, SQL 확인을 통해 데이터 정상 확인
		- JDBC 드라이버 설정: WebContent\WEB-INF\lib\ojdbc6.jar\oracle\driver\OracleDriver.class
			> SQL전송 이외에 모든 기능을 구현.
			> 개발자가 최소한의 코드로 DB서버에 접속해서 사용할 수 있도록 만들어 놓음.
		- DB 접속 정보 확인: IP, port, SID, 계정명, 비밀번호
	2) java 내 Database 처리 API
		- Connection: 접속을 해주는 객체
		- Statement/PreparedStatement: SQL을 이용해서 Server에 명령어를 전송
		- ResultSet: 데이터를 받아 처리해주는 객체(2차원테이블 구조와 동일)
			> select(필요), insert, update, delete(필요X) - commit(), rollback()
		- 접속해제메서드: .close()
		- 예외처리(SQLException)을 반드시 해야 함.
--%>

<%--  
[js]
[하] 1. document.getElementXXXX() 메서드와 document.querySelectorXXX() 메서드를 
    선택자별로 비교하여 기술하세요.
    > 구체적인 element를 선택하고 싶으면 querySelecorXXX()
    > 더 빠르고 지원이 잘 되는 것을 필요로 하면 getElementXXXX()
--%>

<%--
[하] 2. DOM객체의 속성 설정 및 호출 2가지, 출력 처리 메서드를 2가지를 예제와 함께 기술하세요.
	
--%>

<%--
[중] 3. DOM 요소객체 생성 코드(createElement)와 속성값 접근을 활용하여, 2X2테이블을
        만들고 화면에 출력하세요.(특정한 cell 배경색상 노랑색 설정)
--%>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>