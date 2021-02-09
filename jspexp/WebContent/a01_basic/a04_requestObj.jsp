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
<%--
# request 기본 객체
1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
2. 주요 기능
	1) 클라이언트(브라우저)와 관련된 정보 읽기
	2) 서버와 관련된 정보 읽기 기능
	3) 클라이언트에 전송한 요청 파라미터 읽기 기능
		request.getParameter("")
	4) 클라이언트가 전송한 요청 헤더 읽기 기능
	5) 클라이언트가 전송한 쿠키 읽기 기능
	6) 속성 처리 기능
3. 주요 메서드
	http://243.211.18.42:7080/context명/폴더/파일.jsp?key=value& key=value
	1) request.getParameter("key")
		- client가 주소창이나 form 객체를 통해서 전송하는 매개값을 처리하는 객체
		- 페이지명?key=value&key=value (GET)
		  form method="post"
		  	name="key"	value="value" (POST)
	2) request.getRemoteAddr(): 웹서버에 연결된 클라이언트의 ip주소를 구한다.
		>> ex) 웹서버에 접속된 여러 클라이언트 정보를 저장할 때 사용
	3) request.getMethod(): 요청값을 전달할 때 전송하는 방식을 가져온다.(get/post)
	4) request.getContextPath():
		위 주소에 해당하는 context명을 말한다. 웹서버에 등록하여 할당하는 프로젝트명이기도 하다.
		WebContent
	5) request.getRequestURI():	웹 브라우저가 요청한 url경로: 위 주소에서 context명/폴드/파일.jsp에 해당
	6) request.getServerPort():	위 주소 기준 7080에 해당
	7) request.getServerName(): 연결할 때 사용한 서버 이름
 --%>
</head>
<body>
	클라이언트IP = <%= request.getRemoteAddr() %><br>
	요청정보길이 = <%= request.getContentLength() %><br>
	요청정보 인코딩 = <%= request.getCharacterEncoding() %><br>
	요청정보 컨텐츠타입 = <%= request.getContentType() %><br>
	요청정보 프로토콜 = <%= request.getProtocol() %><br>
	요청정보 전송방식 = <%= request.getMethod() %><br>
	요청 URI = <%= request.getRequestURI() %><br>
	컨텍스트 경로 = <%= request.getContextPath() %><br>
	서버이름 = <%= request.getServerName() %><br>
	서버포트 = <%= request.getServerPort() %>
</body>
</html>