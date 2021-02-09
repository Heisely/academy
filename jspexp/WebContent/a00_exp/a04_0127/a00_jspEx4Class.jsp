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
<%-- [중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 총 10문제가 임의로 나오게 처리하세요.
			확인 클릭시, 결과 100점 만점에 맞춘만큼 점수도 표기

# 처리 순서
1. 임의의 두 개의 숫자
2. 연산자 4개 중에 하나 > 배열이용 {"+","-","*","/"}
3. 연산 정답값 > 조건문/배열에 정답 설정 {num01+num02, num01-num02, num01*num02, num01/num02}
4. 임의의 연산자와 정답값 설정 ranIdx(0~3)
5. 화면의 출력 내용 구성
	> <form action="전송할페이지">
	> num01 연산자 num02 = [	] (hidden 정답맵핑)
	> [확인]
	> </form>
6. 전송 받아서 처리할 페이지
	1) 입력된 값
		String innum = request.getParameter("innum");
	2) 정답값
		String cornum = request.getParameter("cornum");
	3) 숫자로 변환
		맞을 때 점수 처리 > int tot=0; tot+=10;
	4) 총 점수 화면 출력
7. 위 내용을 10개 문제로 처리할 때 해야할 부분
	1) 초기페이지
		> 화면 출력 내용 구성(5) for(1~10)
			num01 연산자 num02 = [	] (hidden 정답맵핑)
	2) 전송 받은 페이지
		> String[] innum = request.getParameterValues("innum");
		> String cornum = request.getParameterValues("cornum");
		> for(배열 단위 데이터)
			각 데이터 숫자형 변환
			비교 tot += 10
		  총점수 출력
		  
# 핵심키워드
> (int)(Math.random()*경우의수+시작수): 임의의 숫자
> String calArr[] = {" + "," - "," * "," / "};
> int corArr[] = {num01+num02, num01-num02, num01*num02, num01/num02};
> int rIdx = (int)(Math.random()*4): 배열의 임의의 index 선택 if(조건문)대용 처리
> calArr[rIdx]: 임의의 연산식 선택, corArr[rIdx]: 임의의 연산 결과
> String[] inArry = request.getParameterValues("innum");
> int totPoint=0; : for안에서 누적해서 데이터 처리할 때, for 밖에서 전역변수로 선언
> for(int idx=0; idx<inArry.length; idx++){
	  Integer.parseInt(inArry[idx])
> <form action="a00_result.jsp" method="post">
> <input type="hidden" name="cornum" value="<%=cor%>"/>: 전송은 해야하지만 현재화면에서 보이면 안 되는 데이터 처리
--%>
<%
	//연산자 임의 처리를 위한 배열 선언
	String calArr[] = {" + "," - "," * "," / "};	
%>
	<h3>JSP ex5</h3>
	<form action="a00_result.jsp" method="post">
	<table>
		<tr><th>번호</th><th>문제</th><th>정답입력</th></tr>
		<%for(int cnt=1; cnt<=10; cnt++){
			// 임의의 두 개의 수
			int num01 = (int)(Math.random()*9+1);
			int num02 = (int)(Math.random()*9+1);
			// 정답을 위한 배열 선언
			int corArr[] = {num01+num02, num01-num02, num01*num02, num01/num02};
			// 임의의 연산식 index 설정
			int rIdx = (int)(Math.random()*4); // 0~3
			// 선택된 내용 연산식과 정답값
			String cal = calArr[rIdx];
			int cor = corArr[rIdx];%>
		<tr><td><%=cnt %></td>
			<td><%=num01%> <%=cal%> <%=num02%></td>
			<td><input type="text" name="innum" size="3"/>
				<input type="hidden" name="cornum" value="<%=cor%>"/></td>
		</tr>
		<%} %>
		<tr><td colspan="3"><input type="submit"/></td></tr>
	</table>
	</form>
</body>
</html>