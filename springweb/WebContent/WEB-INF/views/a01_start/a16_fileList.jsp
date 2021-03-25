<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>       
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--

--%>
//
	$(document).ready(function(){
		$(".data").click(function(){
			var fname = $(this).attr("id");
			if(confirm(fname+" 다운로드 하시겠습니까?")){
				location.href = "${path}/fileDown.do?fname="+fname;
			}
		});
	});
</script>
</head>
<div class="jumbotron text-center">
	<h2>파일 리스트</h2>
</div>
<div class="container">
	<table class="table table-hover table-striped">
		<thead>
			<tr class="table-success text-center">
				<th>내용</th><th>파일명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="fo" items="${fileList}">
			<tr class="text-center data" id="${fo.fname}">
				<td>${fo.content}</td><td>${fo.fname}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>