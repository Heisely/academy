<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
# 요청값 테이블 자동 생성
 --%>
<body>
	<form>
		행의 개수: <input type="text" name="row"/><br>
		열의 개수: <input type="text" name="col"/><br>
		<input type="submit" value="테이블 생성"/>
	</form>
	<%
	String colS= request.getParameter("col"); // name값으로 받아줌
	String rowS= request.getParameter("row");
	int col=1, row=1; // default값으로 1행1열을 만들어줌
	if(colS!=null) col=Integer.parseInt(colS);
	if(rowS!=null) row=Integer.parseInt(rowS);
	int cnt=1;
	%>
	<table width="400" height="400" border>
		<%for(int rCnt=1; rCnt<=row; rCnt++){%>
			<tr>
				<%for(int cCnt=1; cCnt<=col; cCnt++){%>
					<td><%=cnt++%></td>
				<%}%>
			</tr>
		<%}%>
	</table>
</body>
</html>