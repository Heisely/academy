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
<script>
	window.onload=function(){

	};
</script>
</head>
<body>
<%--
[jsp]
[하] 1. request, response 참조변수의 원래 객체의 명은 무엇인가?(servlet클래스 참조)
	>> request: HttpServletRequest
	>> response: HttpServletResponse

[하] 2. jsp에서 객체선언없이 사용하는 내장된 참조객체를 기술하세요.
	>> request, response, out, session...

[하] 3. request객체의 메서드의 각자 특징과 내용을 기술하세요.
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
	
[하] 4. request객체의 메서드 가운데 요청값을 처리하는 메서드의 특징을 기술하세요.
		>> request.getParameter("key")
		- client가 주소창이나 form 객체를 통해서 전송하는 매개값을 처리하는 객체
		- 페이지명?key=value&key=value (GET)
		  form method="post"
		  	name="key"	value="value" (POST)

[중] 5. 구매할물건과 갯수를 queryString으로 페이지와 함께 만들고, 해당 페이지에서 
        데이터를 처리하세요 page.jsp?name=사과&cnt=2&price=3000&name=바나나&cnt=5&prcie=4000&pay=신용카드&pay=현금&pay=포인트
        1) get방식으로 바로 출력
        2) form 처리 방식 입력 후, 출력.
            구매물건
            물건명   갯수
            [   ]  [  ]
            [   ]  [  ]
            [   ]  [  ]
            구매방법 []신용카드[]현금[]포인트
--%>
	<%
	String[] name = request.getParameterValues("name"); if(name==null) name= new String[]{};
	String[] cnt = request.getParameterValues("cnt"); if(cnt==null) cnt=new String[]{};;
	String[] price = request.getParameterValues("price"); if(price==null) price=new String[]{};;
	String[] pay = request.getParameterValues("pay"); if(pay==null) pay=new String[]{};
	%>
	<h3>JSP과제5번 - get방식으로 바로 출력</h3>
	<table>
		<tr><th>물건명</th><th>개수</th><th>가격</th></tr>
		<tr>
			<% if(name!=null){
				for(int idx=0; idx<name.length; idx++){%>
				<td><%=name[idx] %></td>
			<%	}
			} %>
			<% if(cnt!=null){
				for(int idx=0; idx<cnt.length; idx++){%>
				<td><%=cnt[idx] %></td>
			<%	}
			} %>
			<% if(price!=null){
				for(int idx=0; idx<price.length; idx++){%>
				<td><%=price[idx] %></td>
			<%	}
			} %>
		</tr>
		<tr><td>구매방법</td>
			<td><% if(pay!=null){
				for(int idx=0; idx<pay.length; idx++){%>
					<%=pay[idx]%>				
				<%	}
				} %></td></tr>
	</table>
</body>
</html>