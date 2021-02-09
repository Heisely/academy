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
	<h3>제목</h3>
	<%
	int cnt=0;
	String[] ans = request.getParameterValues("answer2");
	if(ans==null) ans = new String[]{};
	String[] correct = request.getParameterValues("cor");
	if(correct==null) correct = new String[]{};
	%>
	<table>
		<tr><th>문제번호</th><th>입력한값</th><th>정답</th><th>정답여부</th></tr>
		<%for(int idx=0; idx<ans.length; idx++){
			String ox = "";
			if(ans[idx].equals(correct[idx])){
				ox="O";
				cnt++;
			} else {
				ox="X";
			}
		%>
		<tr><th><%=idx+1 %></th>	
			<td><%=ans[idx]%></td>
			<td><%=correct[idx]%></td>
			<td><%=ox%></td></tr><%}%>
	</table>
	<h4>맞은 개수: <%=cnt %>/10</h4>
	<h4>점수: <%=cnt*10 %>/100 점</h4>
</body>
</html>