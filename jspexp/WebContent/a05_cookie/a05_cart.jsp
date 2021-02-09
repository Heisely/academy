<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import= "java.net.*"
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
ex)
물건 장바구니 담기
물건명 : [	]
개수 : [		]
 [장바구니담기]
==>
현재 장바구니 내역
[]	물건명	개수
[]	@@@		@@
[]	@@@		@@
[]	@@@		@@
 [장바구니삭제]
 
1. 초기 장바구니 화면 구현
	1) form 하위 name="pname", name="cnt" 장바구니담기 submit
	2) 받은 요청값 처리
		String name = request.getParameter("pname");
		String cnt = request.getParameter("cnt");
		if(name!=null): 초기화면과 구분해 처리
	3) Cookie에 할당 및 클라이언트에 전달
		Cookie c = new Cookie(name, cnt);
		response.addCookie(c);
	4) 쿠키값 확인페이지 JS로 처리
		onclick = "location.href = 'a05_cartList.jsp'"
2. 쿠키값 확인 페이지
	1) 현재 쿠키 리스트
		Cookie[] cks = request.getCookies();
		for(Cookie c : cks){
			c.getName()	c.getValue()
		}
	2) 쿠키 삭제처리
		<input type="checkbox" name="ck" value="<%=c.getName()%>"/>
		>> submit 클릭 시 check된 쿠키의 name값을 전달
		String cks = request.getParameterValues("cks");
		for(Cookie c : cks){
			for(String ck:cks){
				if(c.equals(ck)){
					c.setMaxAge(0)
					response.addCookie(c);
				}
			}
		}
3. 쿠키값의 특정
	1) key, value값은 문자열로 1byte만 저장이 된다. 제한된 데이터만 저장된다.
	2) 한글은 2byte문자열이므로 쿠키를 저장할 때, encoding하여 처리
--%>
<body>
	<h3>물건 장바구니 담기</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>개수</th><td><input type="text" name="cnt"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="장바구니 담기"/></td></tr>
	</table>
	</form>
	<h4 align="center" onclick="location.href='a05_cartList.jsp'">장바구니리스트보기</h4>
<%
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	String cnt = request.getParameter("cnt");
	if(pname!=null){
		Cookie c = new Cookie(URLEncoder.encode(pname,"utf-8"),(price+"^"+cnt));
		response.addCookie(c);
		response.sendRedirect("a05_cartList.jsp");
	}
%>
</body>
</html>