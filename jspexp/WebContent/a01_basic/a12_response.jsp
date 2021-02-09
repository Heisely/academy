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
# response 객체
1. 서버에서 클라이언트로 전송되는 정보를 처리하는 객체
2. 웹 프로그래밍에서는 java+html의 최종 결과값을 PrintWriter라는 객체를 통해 stream 방식으로 클라이언트 브라우저에 전송
3. 기타 쿠키값을 새로 만들어 전송하거나, 서버에서 만든 파일을 클라이언트에게 전달(파일다운로드) 등 여러 가지 기능을 처리
4. 서버단에서 페이지 호출 처리 메서드
	1) sendRedirect("이동할 페이지");
		cf) 페이지 이동 처리
			<a href="이동할 페이지">이동</a>
			location.href="이동할 페이지"; js로 동적인 이동 처리
		cf) 이동할 때, 요청값을 가지고 이동할 수 있다.
		sendRedirect("이동할 페이지?요청key=요청값&요청key=요청값");
		location.href="이동할 페이지?요청key=요청값&요청key=요청값";
		<a href="이동할 페이지?요청key=요청값&요청key=요청값">이동</a>
--%>
<body>
   <%
   //1.서버단에서 페이지 이동.(호출되자 마자 해당 페이지 이동)
   response.sendRedirect("a13_res2.jsp");
   %>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>