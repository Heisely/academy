<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.net.*"
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
<%
// client에서 저장된 쿠키를 서버에서 로딩해서 출력하여 웹 화면으로 보여주기 위해
// request로 다시 서버에 전송해서 getCookies()라는 이름으로 호출해 사용
Cookie[] cookies = request.getCookies();
%>
	<h3>쿠키값 가져오기</h3>
<%
for(Cookie ck : cookies){
%>
	<h4><%=ck.getDomain()%> -
		<%=URLDecoder.decode(ck.getName(),"utf-8")%> -
		<%=URLDecoder.decode(ck.getValue(),"utf-8")%></h4>
<%-- 출력한 뒤 쿠키 값의 삭제 setMaxAge(0): 쿠키의 생존기간을 0으로 지정하면 바로 삭제 처리 --%>
<%
	ck.setMaxAge(0);
	response.addCookie(ck); // 클라이언트에 전달
}
%>
</body>
</html>