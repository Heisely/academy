<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
[spring]
[하] 1. 스프링 MVC로 회원 정보 리스트 출력하세요.
[하] 2. DI를 이용해서 Book의 생성자를 통해서 데이터를 할당하소 출력처리하세요.
[하] 3. DI를 이용해서 Computer객체에 부품(Cpu, Ram, Hdd 객체)를 할당하여 
        Computer의 showInfo()메서드를 통해서 출력 처리하세요.
        컴퓨터명 @@@에 포함된
        Cpu 이름은 @@, 사양은 @@@
        Ram는 이름은 @@, 사양은 @@@
        Hdd는 이름은 @@, 사양은 @@@
        입니다. 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
	<h2>부트스트랩 form</h2>
</div>
<div class="container">
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post" action="${path}/">
		<input class="form-control mr-sm-2" type="text" name="ename" value="" placeholder="사원명">
		<input class="form-control mr-sm-2" type="text" name="job"  value="" placeholder="직책명">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
  </nav>
  <table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>타이틀</th>
		</tr>
	</thead>
	<tbody>
		<tr class="text-center">
			<td>내용</td>
		</tr>
	</tbody>
  </table>    
</div>
</body>
</html>