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
<%--
[데이터베이스]
[하] 1. 정규화의 개념과 원자값, 완전함수종속성, 이행적 함수종속성에 관련하여 기술하세요.
	# 정규화
		> 이상 현상이 발생하지 않도록 릴레이션을 관련있는 속성들로만 구성하기 위해
		  릴레이션을 분해(decomposition)하는 과정
		> 함수적 종속성을 판단하여 정규화를 수행함
	# 원자값
		> 테이블의 컬럼에 데이터는 1개의 데이터가 들어가야한다.
	# 완전 함수 종속
		> 릴레이션에서 속성 집합 Y가 속성 집합 X에 함수적으로 종속되어 있지만,
		  속성 집합 X의 전체가 아닌 일부분에는 종속되지 않음을 의미
		  일반적으로 함수 종속은 완전 함수 종속을 의미함
	# 이행적 함수 종속
		> 릴레이션을 구성하는 3개의 속성 집합 X, Y, Z에 대해
		  함수 종속 관계 X → Y 와 Y → Z가 존재하면 논리적으로 X → Z가 성립되는데,
		  이 때 Z가 X에 이행적으로 함수 종속되었다고 함
--%>
<%--
[JSP]
[하] 1. 쿠키의 생성과 확인을 request와 response를 기준으로 메서드를 활용하여 기술하세요.
		> 쿠키는 웹 브라우저가 보관하고 있는 데이터로서 웹 서버에 요청을 보낼 때 함께 전송한다.
			1) 쿠키의 생성은 웹서버에서 시작 되고 response 객체에 생성한 쿠키를 탑재해 클라이언트에 보낸다.
			2) 클라이언트는 사용하는 브라우저를 통해 쿠키값을 받아 특정한 쿠키저장소에 저장한다.
			3) 다시 웹서버에 접속해서 클라이언트가 가지고 있는 쿠키를 request객체를 이용해서 전달하고,
			   웹 서버 프로그램은 이것을 전달받아 클라이언트를 식별하고 데이터를 받을 수 있다.
--%>

<%--
[하] 2. 좋아하는 음식 [     ][주문] ==> 주문 클릭시, 쿠키값을 저장하고, 다음페이지에 쿠키값 내용을 확인하여
            @@@ 주문되었습니다로 출력하세요
--%>
<%

	String food = request.getParameter("food");
	if(food!=null){
		Cookie ck01 = new Cookie("favorite",food);
		response.addCookie(ck01);
	}
%>
<h2>JSP Ex2</h2>
<form action="a03_printCookies.jsp" method="post">
<table>
	<tr><th>좋아하는 음식</th>
		<td><input type="text" name="food">
		<input type="submit" value="주문"></td></tr>
</table>
</form>

<%--
[중] 3. 물건명:[   ] 가격:[  ] 갯수:[    ][장바구니담기] 클릭을 통해 요청값을 전달하고, 쿠키를 만들고,
     생성된 쿠키값을 다음 페이지에서 확인해보자. 확인후 삭제 버튼 클릭시, 쿠키값을 삭제해보자.
--%>

<%--
[js]
[하] 1. 날짜설정의 기본형식을 기술하세요.
		1) 현재일자
			var 변수명 = new Date()
		2) 특정일자
			Date("영문월 날짜")
			Date("영문월 날짜, 년도")
			Date("영문월 날짜, 년도 시:분:초")
			Date("년도, 월index, 날짜")
			Date("년도, 월index, 날짜, 시, 분, 초")
			Date("년도, 월index, 날짜, 시, 분, 초, 1/1000초")
--%>

<%--
[JS]
[하] 2. 입사일 날짜를 (yyyy/mm/dd)형식으로 입력하고, 해당 날짜별 인턴기간(3개월)으로 계산하여 출력하세요.
--%>
<h2>JS Ex2</h2>
<h3>인턴기간 종료일 구하기</h3>
<input type="text" name="yy" size="3"/>년
<input type="text" name="mm" size="3"/>월
<input type="text" name="dd" size="3"/>일
<input type="button" value="계산" onclick="endDate()"/>
<h4 id="show"></h4>
<script type="text/javascript">
	function endDate(){
		var yy = Number(document.querySelector("[name=yy]").value);
		var mm = Number(document.querySelector("[name=mm]").value);
		var dd = Number(document.querySelector("[name=dd]").value);
		var calDate = new Date(yy, mm-1, dd);
		calDate.setDate(calDate.getDate()+62);
		document.querySelector("#show").innerHTML = calDate.toLocaleDateString();
	}
</script>
<%--
[하] 3. 아래와 같은 형식으로 입력하여, 두 날짜 사이의 차이를 구하세요
        [@@@@/@@/@@] ~[@@@@/@@/@@] [기간구하기]
        @@ 일
--%>
<h2>JS Ex3</h2>
<h3>두 날짜 사이의 차이 구하기</h3>
<table>
	<tr><td><input type="text" name="date1" size="3"/></td>
		<td><input type="text" name="date2" size="3"/></td>
		<td><input type="button" value="기간구하기" onclick="interval()"/></td>
	</tr>
	<tr><td colspan="2">두 날짜의 차이</td><td id="interval"></td></tr>
</table>
<script type="text/javascript">
	function interval(){
		var date01 = document.querySelector("[name=date1]").value;
		var dateArr1 = date01.split("/");
		var yy = dateArr1[0];
		var mm = dateArr1[1];
		var dd = dateArr1[2];
		var date1 = new Date(yy, mm-1, dd);
		
		var date02 = document.querySelector("[name=date2]").value;
		var dateArr2 = date02.split("/");
		var yy = dateArr2[0];
		var mm = dateArr2[1];
		var dd = dateArr2[2];
		var date2 = new Date(yy, mm-1, dd);
		
		var interval = date1.getTime() - date2.getTime();
		interval = Math.floor(interval/(1000*60*60*24));
		
		document.querySelector("#interval").innerHTML = interval;
	}
</script>
</body>
</html>




















