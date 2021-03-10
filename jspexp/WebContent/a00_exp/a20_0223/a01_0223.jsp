<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">

<%--  
[js]
[하] 1. ajax 기본 호출형식과 open()의 속성값과 비동기와 동기의 차이를 기술하세요
		> 기본적으로 비동기 호출
		> open("get/post","서버에 있는 파일", 비동기여부); false: 동기
		> 비동기: 해당 이벤트를 처리하고 이후 답변이 오기 전에 다른 요소객체 변경이 가능
		> 동기: 화면 refresh가 없음
[하] 2. [이쪽으로 와보세요] ==> 해당위치로 커서를 옮겼을 때, z01_data.txt에 있는 I love you! 를 비동기적으로
    로딩해서 호출하여 추가적으로 출력하세요..
--%>
//
	$(document).ready(function(){
		$("h2").text("ajax 과제2");
		$("[name=data01]").mouseover(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("get","z01_data.txt",true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4 && xhr.status==200){
					$("div").text($("div").text()+xhr.responseText);
				}
			};
			xhr.send();
		});
	});
</script>
</head>
<body>
	<h2></h2>
	<input name="data01" placeholder="[]이쪽으로 와보세요]"/>
	<div></div>
	<br><br>
<%--        
[JSP]
[하] 1. jstl의 forEach varStatus의 상태 속성에 대하여 기술하세요.
		${sts}
		${sts.index} : 0부터 시작해서 증가하는 index번호 출력
		${sts.count} : 1부터 시작해서 증가하는 count번호 출력
		${sts.first} : 해당 반복의 첫 번째인지 여부 boolean			
		${sts.last} : 해당 반복의 마지막인지 여부 boolean
--%>
<%-- 
[하] 2. 배열로 물건명과 가격을 3개씩을 선언한 후, 테이블(1X3)에서
        물건명(가격)  형식으로 한 셀에 표기하세요.
--%>
<%
pageContext.setAttribute("prod", new String[]{"사과","바나나","딸기"});
	pageContext.setAttribute("price", new String[]{"2000","5000","7500"});
%>
	<table>
		<tr>
		<c:forEach var="pname" items="${prod}" varStatus="sts">
			<td>${pname}(${price[sts.index]})</td>
		</c:forEach>
		</tr>
	</table>
<%--
[하] 3. dao의 수업 중 진행하지 않은 검색데이터 기능메서드를 찾아서 검색 처리화면을 구현하세요.
--%>
	<h3>상품검색</h3>
	<form method="post">
	<table>
		<tr><th>상품명</th><td><input type="text" name="name" value="${param.name}"/></td></tr>
		<%-- <tr><th>가격</th>
			<td><input name="fr_price" value="${param.fr_price}"/>
				<input name="to_price" value="${param.to_price}"/></td></tr> --%>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<jsp:useBean id="dao" class="jspexp.a03_database.A03_ShopDao"/>
	<c:set var="prodlist" value="${dao.shopList(param.name)}"/>
	<table>
		<tr><th>상품번호</th><th>상품명</th><th>가격</th>
			<th>개수</th><th>등록일</th><th>판매회사</th>
			<th>최근입고일</th><th>관리자</th></tr>
		<c:forEach var="prod" items="${prodlist}">
		<tr><td>${prod.pno}</td><td>${prod.name}</td><td>${prod.price}</td>
			<td>${prod.cnt}</td><td>${prod.credte}</td><td>${prod.company}</td>
			<td>${prod.incomedte}</td><td>${prod.inmanager}</td></tr>
		</c:forEach>
	</table>
</body>
</html>