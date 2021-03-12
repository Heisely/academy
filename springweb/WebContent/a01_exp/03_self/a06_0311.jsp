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
[스프링]
[하] 1. controller와 view를 만들고, controller에 공통 model데이터 ArrayList형태로
        사과 2000
        바나나 3000
        딸기  12000 으로 설정한 뒷, 화면에 select로 출력하게 하세요.
[하] 2. 스프링 데이터베이스 연결을 위한 환경 설정 작업을 컨테이너 기술하세요.
[하] 3. dao인터페이스와 XXXmapper.xml과 구성요소가 연동관계에 대하여 기술하세요
[하] 4. 오늘 마지막 모델 데이터 emplist 화면 출력.
[중] 5. springweb2 프로젝트에 mybatis가 설정되어 emp list를 출력하게 하세요.(캡쳐)
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>0311 Spring 과제1번</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post" action="${path}/">
		<input class="form-control mr-sm-2" type="text" name="ename" value="" placeholder="사원명">
		<input class="form-control mr-sm-2" type="text" name="job" value="" placeholder="직책명">
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