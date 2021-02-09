<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
[jsp]
[하] 1. 요청의 header에 들어가는 key와 value를 나열해보세요.
	getHeader(String name): 지정한 이름의 헤더값
	getHeaders(String name): 지정한 이름의 헤더 목록
	getHeaderName(): 모든 헤더의 이름을 가져온다
	getIntHeader(String name): 지정한 헤더의 값을 정수로 가져온다
	getDateHeader(String name): 지정한 헤더의 값을 시간으로 읽어온다.

[하] 2. jsp에서 result.jsp로 요청값 name=himan을 전송하는 경우와
		js에서 동일한 내용을 처리하는 코드를 기술하세요.
		>> form으로 전송
			<form action="result.jsp">
				<input name="name" value="himan"/>
		>> url로 전송
			response.sendRedirect("result.jsp?name=himan");
		>> js에서 전송
			location.href="result.jsp?name=himan;

[하] 3. jsp에서 요청값 한개 부터 시작해서, 숫자형 데이터 처리, 다중의 데이터 처리까지
		form페이지와 함께 처리한 코드를 기술하세요. (수업예제 제외)
		
[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.

[중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 총 10문제가 임의로 나오게 처리하세요.
        확인 클릭시, 결과 100점 만점에 맞춘만큼 점수도 표기
        
[js]
[하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고,
		point는 숫자값이 되게 js로 처리한 후,
       	result.jsp에서 해당 값을 출력하세요.
--%>

	<h3>JSP ex2-(1)</h3>
	<form action="result.jsp" method="post">
	<table>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
	</table>
	</form>
	
	<h3>JSP ex2-(2)</h3>
	<form action="result.jsp" id="ex2" method="post">
	<table>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><td colspan="2"><input type="button" value="등록" onclick="valid()"></td></tr>
	</table>
	</form>

	<h3>JSP ex3</h3>
	<h4>1. 요청값 1개</h4>
	<%
		String singer = request.getParameter("singer");
		if(singer==null) singer = "";
	%>
	<table>
		<tr><th>좋아하는 가수</th><td><%=singer%></td></tr>
	</table>
	<h4>2. 숫자형데이터처리</h4>
	<%
		String numS = request.getParameter("num");
		if(numS==null) numS = "0";
		int num = Integer.parseInt(numS);
	%>
	<table>
		<tr><th>나이</th><td><%=num%></td></tr>
	</table>
	<h4>3. 다중데이터 처리</h4>
	<%
		String[] foods = request.getParameterValues("food");
		if(foods==null) foods = new String[]{};
	%>
	<table>
		<%for(int idx=0; idx<foods.length; idx++){%>
		<tr><th><%=idx+1 %></th><td><%=foods[idx]%></td></tr>
		<%}%>
	</table>
	
	<h3>JSP ex4</h3>
	<%
		int num01 = (int)(Math.random()*100+1); // 1~100
		int num02 = (int)(Math.random()*100+1);
		int minusNum = num01-num02;
		String answerS = request.getParameter("answer");
		String minusNumS = request.getParameter("minusNum");
		if(answerS!=null){
			int ans = Integer.parseInt(answerS);
			int minus = Integer.parseInt(minusNumS);
			if(minus==ans){
				response.sendRedirect("success.jsp?answer="+ans);
			} else {
				response.sendRedirect("fail.jsp?answer="+ans+"&minus="+minus);
			}
		}
	%>
	<form method="post">
		<table>
			<tr><th>문제</th><td><%=num01%> - <%=num02%> = ?</td></tr>
			<tr><th>정답입력</th><td><input type="text" name="answer">
								   <input type="hidden" name="minusNum" value="<%=minusNum%>"></td></tr>
			<tr><td colspan="2"><input type="submit" value="정답확인"></td></tr>
		</table>
	</form>
	
	<h3>JSP ex5</h3>
	<%
			String[] arr = {"+","-","*","/"};
			String answerS2 = request.getParameter("answer2");
			String ox = "";
	%>
	<form action="score.jsp" method="post">
		<table>
			<tr><th>no</th><th>문제</th><th>정답입력</th></tr>
			<%
			for(int idx=1; idx<=10; idx++){
				int ran = (int)(Math.random()*4);
				int num1 = (int)(Math.random()*10+1);
				int num2 = (int)(Math.random()*10+1);
				int cor=0;
				switch(ran){
					case 0:	cor=num1+num2;	break;
					case 1:	cor=num1-num2;	break;
					case 2:	cor=num1*num2;	break;
					case 3:	cor=num1/num2;	break;
				}			
			%>
				<tr><th><%=idx%></th><td><%=num1%> <%=arr[ran]%> <%=num2%> = ?</td>
					<td><input type="text" name="answer2">
						<input type="hidden" name="cor" value="<%=cor%>"></td>	
					</tr>			
			<%
			if(answerS2!=null) {
				int answer2 = Integer.parseInt(answerS2);
				response.sendRedirect("score.jsp?answer="+answer2+"&cor"+cor);
			}}	%>
			<tr><td colspan="3"><input type="submit" value="정답확인"></td></tr>
		</table>		
	</form>
	
	<h3>JS ex1</h3>
	<form action="result.jsp" id="jsEx1" method="post">
		<table>
			<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
			<tr><th>포인트</th><td><input type="text" name="point"/></td></tr>
			<tr><td colspan="2"><input type="button" value="등록" onclick="valid2()"></td></tr>
		</table>
	</form>
</body>
<script type="text/javascript"> 	
	function valid(){
		var nameObj = document.querySelector("#ex2 [name=name]");
		if(nameObj.value==""){ 
			alert("데이터를 입력하세요.");
			nameObj.focus();
		} else {
			document.querySelector("#ex2").submit();
		}
	}	
	
 	function valid2(){
		var idObj = document.querySelector("#jsEx1 [name=id]");
		var ptObj = document.querySelector("#jsEx1 [name=point]");
		if(idObj.value==""){
			alert("아이디를 입력하세요.");
			idObj.focus();
		} else if(ptObj.value==""){
			alert("포인트를 입력하세요.");
			ptObj.focus();
		} else {
			if(isNaN(ptObj.value)){
				alert("숫자만 입력하세요.");
				ptObj.value = "";
				ptObj.focus();
			} else {
				document.querySelector("#jsEx1").submit();
			}
		}
	}
</script>
</html>