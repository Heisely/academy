<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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
	
</script>
</head>
<%--
[JSP]
[중] 1. 2/10 숙제의 상세화면에서 물건정보를 수정처리하세요
--%>
<%--
[JS]
[하] 1. 강제이벤트란 무엇인가? 개념을 설명하고, 기본예제로 기술하세요.
		이벤트가 발생하지 않더라도 코드 상 이벤트가 수행된 것과 동일한 효과를 처리하는 것.
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h2").innerHTML = "카운트 이벤트";
		// 문서 객체 가져오기
		var buttonA = document.getElementById('button-a');
		var buttonB = document.getElementById('button-b');
		buttonA.onclick = function(){
			counterA.innerHTML = Number(counterA.innerHTML) + 1;
		};
		buttonB.onclick = function(){
			counterB.innerHTML = Number(counterB.innerHTML) + 1;
			buttonA.onclick(); -- 강제이벤트
		};
	};
</script>
<body>
	<h2></h2>
	<button id="button-a">ButtonA</button>
	<button id="button-b">ButtonB</button>
	<h1>Button A - <span id="counter-a">0</span></h1>
	<h1>Button B - <span id="counter-b">0</span></h1>
</body>
--%>
<%--
[하] 2. 특정 페이지를 서버에 요청값으로 처리할 때, 유효성 처리 이벤트에 대해 기술하세요.
		1) 이벤트명: submit
		2) 유효성 처리 방법
			선택한 form객체.onsubmit = function(){
				요청값으로 form 객체 하위에 있는 요소객체에 대한 유효성 check
				해당 값이 유효성에 문제가 있을 때, return false를 처리하여 전송하지 못하게 방지
			}
--%>
<%--
[하] 3. 키이벤트를 이용하여 h3 7개를 아래(40) 위(38)로 키를 입력 시 이동되어 배경색상과 글자색상이 변경되게 하세요.
--%>
<body>
<script>
	window.onload=function(){
		var h3s = document.querySelectorAll("h3");
		var idx = -1;
		this.onkeyup = function(){
			for(var i=0; i<h3s.length; i++){
				h3s[i].style.backgroundColor="";
				h3s[i].style.color="";
			}
			if(event.keyCode==40){
				idx++;
				h3s[idx].style.backgroundColor="pink";
				h3s[idx].style.color="white";
			}
			if(event.keyCode==38){
				idx--;
				h3s[idx].style.backgroundColor="skyblue";
				h3s[idx].style.color="yellow";
			}
		}
	};
</script>
	<h3>안녕</h3>
	<h3>안녕</h3>
	<h3>안녕</h3>
	<h3>안녕</h3>
	<h3>안녕</h3>
	<h3>안녕</h3>
	<h3>안녕</h3>
</body>
</html>