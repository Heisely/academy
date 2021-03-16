<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>회원등록 form(spring form 태그 사용)</h2>
</div>
<div class="container">
<form:form modelAttribute="memInfo" class="form-inline" method="post">
<table class="table table-hover">
	<col width="50%"><col width="50%">
	<tbody>
		<tr class="text-center">
			<th class="table-success">이메일 수신 여부</th>
			<td><form:checkbox path="allowNoti" label="이메일을 수신합니다." class="form-control mr-sm-2"/></td>
		</tr>
		<tr class="text-center">
			<th class="table-success">이메일 주소</th>
			<td><form:input path="email" class="form-control mr-sm-2"/></td>
		</tr>
		<tr class="text-center">
			<th class="table-success">생일</th>
			<td><form:input path="birthday" class="form-control mr-sm-2" placeholder="yyyy/MM/DD"/></td>
		</tr>		
		<tr class="text-center">
			<td><button class="btn btn-success" type="submit">등록</button></td>
		</tr>
	</tbody>
</table>   
</form:form> 
<table class="table table-hover">
	<col width="50%"><col width="50%">
	<tbody>
		<tr class="text-center">
			<th class="table-success">이메일 수신 여부</th>
			<td>${memInfo.allowNoti}</td>
		</tr>
		<tr class="text-center">
			<th class="table-success">이메일 주소</th>
			<td>${memInfo.email}</td>
		</tr>
		<tr class="text-center">
			<th class="table-success">생일</th>
			<td><fmt:formatDate value="${memInfo.birthday}" pattern="yyyy/MM/dd"/></td>
		</tr>		
	</tbody>
</table> 
</div>
</body>
</html>