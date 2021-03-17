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
		var isInsert = "${param.ename}";
		if(isInsert!=""){
			if(confirm("등록완료\n조회화면으로 이동하시겠습니까?")){
				location.href="${path}/empList2.do";
			}
		}
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>사원 등록</h2>
</div>
<div class="container">
<form:form modelAttribute="emp" action="${path}/insertEmp.do" method="post">
	<table class="table table-hover">
		<tbody>
			<col width="50"><col width="50">
				<tr class="text-center">
					<th class="table-success">사원명</th> 
					<td><form:input path="ename" class="form-control"/></td>
				</tr>
				<tr class="text-center">
					<th class="table-success">직책</th> 
					<td>
					<%-- option에 대한 default 설명이나 항목이 없는 경우 --%>
						<form:select path="job" class="form-control mr-sm=2" items="${jobs}"/>
					</td>
				</tr>
				<tr class="text-center">
					<th class="table-success">관리자</th> 
					<td>
						<%-- option에 대한 default 설명이나 항목이 없는 경우 --%>
						<form:select path="mgr" class="form-control mr-sm=2" items="${mgrs}" itemLabel="ename" itemValue="mgr"/>
					</td>
				</tr>
			<tr class="text-center">
				<th class="table-success">급여</th>
				<td><input type="number" name="sal" class="form-control"/></td>
			</tr>
			<tr class="text-center">
				<th class="table-success">보너스</th>
				<td><input type="number" name="comm" class="form-control"/></td>
			</tr>
			<tr class="text-center">
				<th class="table-success">관리자</th>
				<td>
				<%-- option에 대한 default 설명이나 항목이 없는 경우 --%>
				<form:select path="deptno" class="form-control mr-sm=2" items="${depts}" itemLabel="dname" itemValue="deptno"/>
				</td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-info" type="submit" id="regBtn">등록</button></td>
			</tr>
		</tbody>
	</table>
</form:form> 
</div>
</body>
</html>