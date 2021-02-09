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
<%--
ex) 화면에 임의의 숫자
	@@ X @@ = ?
	정답 입력 [	]
		[확인]
	> 정답을 맞추면 a18_succ.jsp
	> 틀리면 a19_fail.jsp로 이동처리
--%>
<%
	int num01 = (int)(Math.random()*8+2);
	int num02 = (int)(Math.random()*9+1);
	int corNum = num01*num02;
	String answerS = request.getParameter("answer"); 
	String corNumS = request.getParameter("corNum");
	// 초기 문제 page와 정답확인 처리 후 페이지 구분
	if(answerS!=null){ // 데이터를 입력했을 때
		int answer = Integer.parseInt(answerS);
		int cor = Integer.parseInt(corNumS);
		if(cor==answer){
			response.sendRedirect("a18_succ.jsp?answer="+answer);
		} else {
			response.sendRedirect("a19_fail.jsp?answer="+answer+"&corNum="+cor);
		}
	}
%>
<body>
	<h3>Math Game</h3>
	<form method="post">
		<table>
			<col width="40%"><col width="60%">
			<tr><th>문제</th><td><%=num01%> X <%=num02%></td></tr>
			<tr><th>정답입력</th><td><input type="text" name="answer"/>
								   <input type="hidden" name="corNum" value="<%=corNum%>"/></td></tr>
			<tr><td colspan="2"><input type="button" onclick="valid()" value="정답확인"/></td></tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function valid(){
		var inNumObj = document.querySelector("input[name=answer]");
		if(inNumObj.value==""){
			alert("데이터를 입력하세요");
			inNumObj.focus();
		} else {
			if(isNaN(inNumObj.value)){
				alert("숫자를 입력하세요");
				inNumObj.value="";
				inNumObj.focus();
			} else {
				// 정상 데이터로 입력했을 때 전송처리
				document.querySelector("form").submit();
			}
		}
	}
</script>
</html>