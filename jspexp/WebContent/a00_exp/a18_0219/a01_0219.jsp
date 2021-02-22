<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	img{
		width: 70px;
		height: 70px;
	}
</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		function animateIt(){
			$("#img").slideToggle("slow", animateIt);
		}
		animateIt();
	});
</script>
</head>
<body>
<%--        
[JSP]
[하] 1. el태그를 이용한 4가지 범위의 데이터를 저장하고 객체로 저장하고, 4칙연산자에의 출력 처리하세요.
--%>
<%
// 객체
request.setAttribute("prod01", new Product("사과",2000,3));
request.setAttribute("prod02", new Product("바나나",4000,2));
%>
<h2>JSP Ex1</h2>
<ul>사과와 바나나구매
	<li> 개당 가격: ${prod01.price + prod02.price}원
	<li> 총 구매 개수: ${prod01.cnt + prod02.cnt}개
	<li> 총 가격: ${prod01.price * prod01.cnt + prod02.price * prod02.cnt}원
	<li> 개당 평균 가격: ${(prod01.price * prod01.cnt + prod02.price * prod02.cnt)/(prod01.cnt + prod02.cnt)}원
</ul>

<%--
[하] 2. el에서 사용되는 조건논리연산자를 활용하여, 임의의 값에 정답을 입력한 후, 정답 여부를 true/false로 출력하세요.
        [ @@] * [ @@  ] = [ 정답입력  ] [정답확인]
            정답여부 @@@
    >> 조건문에서 해결이 안 됩니다ㅠ
--%>
<%
	request.setAttribute("num1", (int)(Math.random()*10+1));
	request.setAttribute("num2", (int)(Math.random()*10+1));
%>
<form method="post">
${num1} * ${num2} = <input name="answer" placeholder="정답입력"/>
<input type="submit" value="정답확인"/>
</form>
<%
String answerS = request.getParameter("answer");
if(answerS==null) answerS="0";
int answer = Integer.parseInt(answerS);
%>
<h4>${(empty answer)? "" : (answer==(num1 * num2)? "정답":"오답")}</h4>

<%--            
[하] 3. useBean과 el을 이용하여 회원가입 정보입력과 가입된 정보를 출력 처리하세요.~
--%>
<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
<jsp:setProperty property="*" name="m"/>
<h2>로그인</h2>
<form method="post">
	ID: <input name="id"/><br>
	PW: <input type="password" name="pass"/><br>
	이름: <input name="name"/><br>
	<input type="submit" value="회원가입"/><br>
</form>
<h4>가입 정보</h4>
ID: ${m.id}<br>
PW: ${m.pass}<br>
이름: ${m.name}
<%--  
[하] 1. 재귀적 함수 호출 개념과 toggleClass에 대하여 간단하게 기술하세요.
	> 재귀적 함수 호출: 함수가 시행될 때 해당 함수를 다시 호출하는 것
	> toggleClass: 클릭 시 반복해서 클래스를 적용했다가 적용하지 않았다를 반복 처리
[하] 2. 재귀적 함수와 slideToggle를 이용하여 특정한 이미지가 보였다가 사라졌다가를 처리해보세요.
	<script type="text/javascript">
		$(document).ready(function(){
			function animateIt(){
				$("#img").slideToggle("slow", animateIt);
			}
			animateIt();
		});
	</script>
--%>
	<h3>slideToggle Ex</h3>
	<img id="img" src="spongebob.png" alt="이미지"/><br>
	<button id="btn">버튼</button>
</body>
</html>