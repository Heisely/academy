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
# out 기본 객체 주요 메서드
servlet 기준으로 "PrintWriter out = response.getPrintWriter();"
IO객체로 Server에서 client(브라우저)로 html태그 내용으로 stream에 의해서 만들어진 내장된 객체의 참조변수로, 주로 출력을 담당
1. 출력 메서드
	- print(): 데이터를 출력
	- println(): 데이터를 출력하고, \r\n(첫 번째 줄바꿈)을 포함한다.
	- newLine(): \r\n을 출력
2. 버퍼관련 메서드(buffer - 웹프로그램에서 임시 메모리를 통해 보다 효과적으로 화면처리를 해주는 기능)
	작은 메모리를 network를 통해 여러 개 넘기는 것보다 특정 임시메모리를 만들어 어느 정도 데이터가 담겼을 때,
	해당 메모리 크기로 전달하는게 더 효율적이라서 버퍼메모리를 활용한다.
	- int getBufferSize(): 버퍼의 크기를 구함
	- int getRemaining(): 현재 버퍼의 남은 크기를 구함
	- clear(): 버퍼의 내용을 비움. 만약 버퍼가 이미 플러시 되었다면 IOException을 발생시킴.
	- clearBuffer(): 버퍼의 내용을 비움
	- flush(): 버퍼를 플러시함
	- boolean isAutoFlush(): 버퍼가 다 찼을 때, 자동으로 플러시할 경우 true를 리턴.
--%>
<body>
	<h2>안녕하세요</h2> <%-- jsp ==> servlet 에서는 기본적으로 모든 태그가 out.println("jsp의 모든 태그")로 변환됨 --%>
	<h2>out 객체의 메서드 활용</h2>
	<%
	// out 객체를 통한 출력처리
	out.println("안녕하세요");
	%>
	<br>
	<h3>데이터 출력
	<%
	out.println("결과를 나타냅니다.");
	%>
	</h3>
	<h2>buffer 정보</h2>
	<%--
	# 버퍼 정보의 크기 설정
	1. page 지시자로 buffer="크기설정"
	2. autoFlush="true|false"
	
	# 버퍼 메모리 확인
	1. 버퍼의 크기: out.getBufferSize()
	2. 남은 크기: out.getRemaining()
	3. auto flush 여부: out.isAutoFlush()
	out.getBufferSize()
	out.isAutoFlush()
	--%>
	<h3>버퍼의 크기: <%=out.getBufferSize()%></h3>
	<h3>남은 버퍼의 크기: <%=out.getRemaining()%></h3>
	<h3>auto flush: <%=out.isAutoFlush()%></h3>
</body>
</html>