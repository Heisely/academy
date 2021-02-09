<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%--
[jsp]
[하] 1. request, response 참조변수의 원래 객체의 명은 무엇인가?(servlet클래스 참조)
[하] 2. jsp에서 객체선언없이 사용하는 내장된 참조객체를 기술하세요.
[하] 3. request객체의 메서드의 각자 특징과 내용을 기술하세요.
[하] 4. request객체의 메서드 가운데 요청값을 처리하는 메서드의 특징을 기술하세요.
[중] 5. 구매할물건과 갯수를 queryString으로 페이지와 함께 만들고, 해당 페이지에서 
        데이터를 처리하세요 page.jsp?name=사과&cnt=2&price=3000&name=바나나&cnt=5&price=4000&pay=신용카드&pay=현금&pay=포인트
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
	String[] names = request.getParameterValues("name");
	if(names==null) names = new String[]{}; // NullPointerException 방지
	String[] cnts = request.getParameterValues("cnt");
	if(cnts==null) cnts = new String[]{};
	String[] prices = request.getParameterValues("price");
	if(prices==null) prices = new String[]{};
	String[] pay = request.getParameterValues("pay");
	if(pay==null) pay = new String[]{};
	
	// 전체 총계
	int sum = 0;
%>
</head>
<body>
	<h3>구매물건</h3>
	<table>
		<tr><th>no</th><th>물건명</th><th>가격</th><th>개수</th><th>계</th></tr>
		<%for(int idx=0; idx<names.length; idx++){
			int tot = Integer.parseInt(prices[idx]) * Integer.parseInt(cnts[idx]); // 단위당 총계
			sum += tot;
		%>
		<tr><th><%=idx+1%></th>
			<td><%=names[idx] %></td>
			<td><%=prices[idx] %></td>
			<td><%=cnts[idx] %></td>
			<td><%=tot%></td>
		</tr>
		<%}%>
		<tr><th colspan="2">총계</th>
			<td colspan="3" style="text-align:right;">
				<%=sum%>
			</td>
		</tr>
		<tr><th colspan="2">구매방법</th>
			<td colspan="3">
				<%for(String str:pay){%>
					<%=str%>&nbsp;&nbsp;
				<%}%>
			</td></tr>
	</table>
</body>
</html>