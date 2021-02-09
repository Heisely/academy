<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
[JSP]
[하] 1. 쿠키값의 life cycle과 필요한 메서드를 기술하세요.
		1) 쿠키 생성(서버): Cookie c = new Cookie(이름, 값)
		2) 쿠키 생성 내용 전달(서버)
			response.addCookie(c);
		3) 쿠키 저장(브라우저)
			브라우저의 특정 위치에 저장됨
		4) 쿠키 저장 내용 전달(브라우저)
			request에 의해 전달, 페이지 호출
		5) 전달 되어온 쿠키 확인 처리(서버)
			Cookie[] c = request.getCookie();
--%>
<%-- 
[하] 2. 쿠키값을 요청값에 의해 삭제 처리되는 코드를 기술하세요
		1) 삭제할 쿠키값을 요청값으로 전달
			get방식 / post방식으로 전달
			ex) <input type="checkbox" name="dcks" value="<%=c.getName()%>
				String dck = request.getParameterValues("dcks");
		2) 삭제할 요청된 쿠키값과 저장된 쿠키값을 비교
			for(Cookie c: request.getCookies()){
				for(int idx=0; idx<dck.length; idx++){
					if(c.getName().equals(dck[idx])){
		3) 쿠키 사용 기간값을 0으로 설정
			조건에 해당하는 쿠키의 기간
				c.setMaxAge(0)
		4) response 객체로 해당 쿠키를 전송
				response.addCookie(c);
--%>
<%--  
[js]
[하] 1. 배열의 forEach(), map(), filter()의 기본 형식을 기술하세요.
		1) 배열명.forEach(function(단위객체, index, Array){	});
			> 배열의 단위 객체의 데이터를 처리할 때 사용
		2) var 새로운 배열 = 배열명.map(function(단위객체){ return 단위객체변경데이터; });
		3) 배열명.filter(function(단위객체, index명, 전체배열){ return 조건; });
			> 배열의 데이터 중 조건에 맞는 데이터만 추출해 새로운 배열 생성
--%>
<%--
[하] 2. 1000단위 물건가격 5개를 임의로 만들어, 5000이상 고가 그외 저가 구분하여 표기하세요
--%>
	<script type="text/javascript">
	var array = [];
	for(var idx=0; idx<5; idx++){
		var price = Math.floor(Math.random()*9+1);
		price *= 1000;
		array.push(price);
	}
	console.log(array);
	var Narray = array.map(function(pr,index,array){
		return "array["+(idx+1)+"] 물건가격: "+pr+"원 "+(pr>=5000? "고가":"저가");
	});
	console.log(Narray);
	</script>
<%-- 
[하] 3. json객체의 문자열 변환 및 객체 변환 메서드를 기본예제를 통해 기술하세요.
--%>
	<script>
		var book={
			title: "jsp중급",
			price: 32000,
			publisher: "IT서적"
		}
		// 문자열 변환 처리
		var bookStr = JSON.stringify(book);
		console.log(bookStr);
		// 다시 객체로 변환 처리
		var book2 = JSON.parse(bookStr);
		console.log(book2);
		}
	</script>
</body>
</html>