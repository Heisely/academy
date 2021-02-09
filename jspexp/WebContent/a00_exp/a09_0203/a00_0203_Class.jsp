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
		> 컬럼에 데이터는 단일 데이터를 입력해야 한다. 이중 데이터X
	# 완전 함수 종속
		> 테이블의 컬럼 간 데이터가 하나의 해당 키를 기준으로 종속적으로 식별할 수 있게 저장돼야한다.
	# 이행적 함수 종속
		> 릴레이션을 구성하는 3개의 속성 집합 X, Y, Z에 대해
		  함수 종속 관계 X → Y 와 Y → Z가 존재하면 논리적으로 X → Z가 성립되는데,
		  이 때 Z가 X에 이행적으로 함수 종속되었다고 함
--%>
<%--
[JSP]
[하] 1. 쿠키의 생성과 확인을 request와 response를 기준으로 메서드를 활용하여 기술하세요.
		1) 생성(서버)
			Cookie c = new Cookie(키, 값);
		2) 전달과 저장(서버 ---> 클라이언트)
			response.addCookie(c);
		3) 다시 서버로 전송(클라이언트 ---> 서버)
			Cookie[] cookies = request.getCookies();
--%>

<%--
[하] 2. 좋아하는 음식 [     ][주문] ==> 주문 클릭시, 쿠키값을 저장하고, 다음페이지에 쿠키값 내용을 확인하여
            @@@ 주문되었습니다로 출력하세요
		1) 화면 출력
			초기 요청페이지에서
			좋아하는 음식: <input type="text" name="food"/>
			[주문] ==> submit으로 서버에 요청key=요청값 형식으로 전달
		2) 서버에서 전달받는 내용
			String food = request.getParameter("food");
		3) client로 전달받은 내용 전송/쿠키저장
			if(food!=null){
				// 쿠키 생성
				Cookie c = new Cookie("food",food);
				// client 전송
				response.addCookie(c);
			}
		4) 페이지 이동
			response.sendRedirect("특정페이지");
		5) 쿠키값 확인
			Cookie[] cks = request.getCookies();
			for(Cookie c : cks){
				c.getName(), c.getValue()
			}
--%>
<h2>JSP Ex2</h2>
<form method="post">
	<table>
		<tr><th>좋아하는 음식</th>
			<td><input type="text" name="food"></td></tr>
		<tr><td colspan="2"><input type="submit" value="주문"/></td></tr>
	</table>
</form>
<%
	String food = request.getParameter("food");
	if(food!=null){
		Cookie c = new Cookie("food",URLEncoder.encode(food,"utf-8"));
		response.addCookie(c);
		// 페이지 이동(쿠키값 확인)
		response.sendRedirect("a00_0203_Show.jsp");
	}
%>
<%--
[중] 3. 물건명:[   ] 가격:[  ] 갯수:[    ][장바구니담기] 클릭을 통해 요청값을 전달하고, 쿠키를 만들고,
     생성된 쿠키값을 다음 페이지에서 확인해보자. 확인후 삭제 버튼 클릭시, 쿠키값을 삭제해보자.
--%>
<h2>JSP Ex3</h2>
<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"></td></tr>
		<tr><th>개수</th><td><input type="text" name="cnt"></td></tr>
		<tr><td colspan="2"><input type="submit" value="장바구니담기"/></td></tr>
	</table>
</form>
<%
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	String cnt = request.getParameter("cnt");
	if(pname!=null){
		Cookie c1 = new Cookie("pname",URLEncoder.encode(pname,"utf-8"));
		Cookie c2 = new Cookie("price",price); // 숫자라서 encode 불필요
		Cookie c3 = new Cookie("cnt",cnt);
		response.addCookie(c1);
		response.addCookie(c2);
		response.addCookie(c3);
		response.sendRedirect("a00_0203_Show2.jsp");
	}
%>
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
		3) 지원메서드
			getXXX(): 호출
			setXXX(저장데이터): setDay는 없음
			> XXX: FullYear, Month, Date, Day,
				   Hours, Minutes, Seconds, Milliseconds, Time(1970/1/1)
		4) 출력 형식
			toOOOString()
			> OOO: Date, GMT, ISO, JSON, LocaleDate, Locale, LocaleTime, Time
--%>

<%--
[JS]
[하] 2. 입사일 날짜를 (yyyy/mm/dd)형식으로 입력하고, 해당 날짜별 인턴기간(3개월)으로 계산하여 출력하세요.
--%>
	<h2>JS Ex2</h2>
	<h3>인턴기간 종료일 구하기</h3>
	입사일: <input type="text" placeholder="yyyy/mm/dd" name="regdate" size="3"/>
	<input type="button" value="인턴기간만료일" onclick="calInter()"/><br>
	<h2 id="show"></h2>
	<script type="text/javascript">
		function calInter(){
			var regdate = document.querySelector("[name=regdate]").value;
			var regdateArr = regdate.split("/");
			var yy = regdateArr[0];
			var mm = regdateArr[1];
			var dd = regdateArr[2];
			var hiredate = new Date(yy, mm-1, dd); // 입사일
			hiredate.setMonth(hiredate.getMonth()+3); // 인턴기간 종료일
			
			var showObj = document.querySelector("#show");
			showObj.innerHTML = hiredate.toLocaleDateString();
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
	<tr><td><input type="text" name="date1" placeholder="yyyy/mm/dd" size="3"/></td>
		<td><input type="text" name="date2" placeholder="yyyy/mm/dd" size="3"/></td>
		<td><input type="button" value="기간구하기" onclick="interval()"/></td>
	</tr>
	<tr><td colspan="2">두 날짜의 차이</td><td id="interval"></td></tr>
</table>
<script type="text/javascript">
	function interval(){
		var date01 = document.querySelector("[name=date1]").value;
		var dateArr1 = date01.split("/");
		var date1 = new Date(dateArr1[0], dateArr1[1]-1, dateArr1[2]);
		
		var date02 = document.querySelector("[name=date2]").value;
		var dateArr2 = date02.split("/");
		var date2 = new Date(dateArr2[0], dateArr2[1]-1, dateArr2[2]);
		
		// 시작과 마지막 날짜의 1/1000초 시간을 추출
		var interval = date1.getTime() - date2.getTime();
		var dateResult = Math.floor(interval/(1000*60*60*24));
		
		document.querySelector("#interval").innerHTML = dateResult;
	}
</script>
</body>
</html>