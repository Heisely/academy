<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspexp.z01_vo.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1. 자바로 Book 객체를 만들고 어쩌고</h2>
<%
	Book b1 = new Book("자바시작",28000,"자바맨");
%>
<h3>도서명: <%=b1.getName() %></h3>
<h3>가격: <%=b1.getPrice() %></h3>
<h3>저자: <%=b1.getWriter() %></h3>

<%--
2. 브라우저 어쩌고
	>> [브라우저페이지 호출]
		http://ip주소:포트/자원폴드/@@@.jsp
	>> [서버] 
		@@@.jsp --> @@servlet.java --> @@@.class --> 최종결과 html페이지만들어서 전달
		String 요청1값할당변수 = request.getParameter("요청1") (jsp)
	>> [브라우저페이지 호출(클라이언트)]
		최종 html코드 받아서 랜더링으로 출력
 --%>

<%-- 
3. jsp화면의 구성요소 3가지를 기술하고, 변수 문자열 greet에 "안녕"을 할당하고 출력되는 것을 위 3가지 내용을 처리하는 코드를 처리 
 --%>
<%
	// # jsp script의 3가지 요소
	// 1. declearation(선언)
	String greet; 
%>
<%
	// 2. scriptlet
	greet="안녕";
%>
<!-- 3. expresstion(표현) -->
	<h2>인사말: <%=greet %></h2>
	
<%--
4. input과 request를 이용해서 어쩌고
 --%>
	<form>
	<!-- action="요청을 전달한 페이지(jsp)": 선언하지 않으면 현재페이지를 다시 호출 
		 method="get/post"
			 get방식: default, 요청값이 화면 url에 나타남
			 post방식: 선언 시 요청값이 http의 body에 나타나므로 url에는 나타나지 않는다. -->
		하고 싶은 말: <input type="text" name="msg"/><br>
		반복 횟수:<input type="text" name="cnt"/><br>
		<input type="submit" value="전송"/>
	</form>
	<%-- 논리적으로 받는 페이지 처리 --%>
	<%	// 모든 한글에 대한 요청값은 encoding처리가 필요
		// get방식은 서버에서 encoding 지원
		// post방식을 코드로 지정
	//	request.setCharacterEncoding("utf-8"); %>
	<% 
	// 모든 요청값은 일단 문자열로 받는다
	String msg=request.getParameter("msg");
	String cntS = request.getParameter("cnt");
	
	
	if(msg!=null){
		int cnt=0;
		if(cntS!=null) cnt = Integer.parseInt(cntS); // 형변환 처리
		for(int no=1; no<=cnt; no++){
	%>
		<h3><%=no%>)<%=msg %></h3>
	<%	}
	}
	%>
</body>
</html>