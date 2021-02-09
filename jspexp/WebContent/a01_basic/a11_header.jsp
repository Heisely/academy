<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
# 파라미터 값의 인코딩/디코딩
1. request 객체를 통해 전달된 요청값은 한글의 경우 2byte여서 서버로 전송할 때 1byte로 encoding 해야 한다.
2. 서버에 전송되어 온 한글의 경우 다시 decoding해서 한글로 변경해 데이터로 활용한다.
3. 인코딩 처리를 위한 jsp코드
	인코딩 후, (주로 post 방식일 때)
	> request.setCharaterEncoding("utf-8/euc-kr");
	요청 객체값 처리
	> String name = request.getParameter("name");

# request 요청 헤더 정보 읽기
1. 클라이언트에서 온 데이터는 요청값 뿐만 아니라 여러 가지 헤어 정보값을 가지고 온다.
2. 메서드와 기능
	getHeader(String name): 지정한 이름의 헤더값
	getHeaders(String name): 지정한 이름의 헤더 목록
	getHeaderName(): 모든 헤더의 이름을 가져온다
	getIntHeader(String name): 지정한 헤더의 값을 정수로 가져온다
	getDateHeader(String name): 지정한 헤더의 값을 시간으로 읽어온다.
--%>
<%--
ex1) 위 정보를 아래의 테이블에 th, td로 넣어주세요.
ex2) cookie, accept-language, accept의 key에 해당하는 값을 출력처리하세요.
--%>
<body>
	<h3>request header 정보</h3>
	<table>
		<%
			// 헤더정보 출력처리
			Enumeration headerEnum = request.getHeaderNames();
			while(headerEnum.hasMoreElements()){
				String headerName = (String)headerEnum.nextElement();
				String headerValue = request.getHeader(headerName);
		%>
			<tr><th><%= headerName %></th><td><%= headerValue %></td></tr>
		<%
			}
		%>
	</table>
	<!-- cookie, accept-language, accept의 key에 해당하는 값을 출력처리하세요. -->
	<h3>key로 헤더정보 가져오기</h3>
	<h4>request.getHeader("cookie"): <%=request.getHeader("cookie")%></h4>
	<h4>request.getHeader("accept-language"): <%=request.getHeader("accept-language")%></h4>
	<h4>request.getHeaader("accept"): <%=request.getHeader("accept")%></h4>
	
</body>
</html>