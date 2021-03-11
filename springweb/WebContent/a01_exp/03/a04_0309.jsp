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
 
--%>
//
	$(document).ready(function(){
		$("td").eq(4).css("background-color","yellow");
		// 현재 화면을 기준으로 이벤트 처리
		// 1. 특정한 key를 눌렀을 때
		$(this).keydown(function(){
			//alert(event.keyCode);
			// 1. 초기화한 후
			$("td").css("background-color","");
			// 2. 화살표 코드값에 따른 처리 37(왼), 38(위), 39(오), 40(아)
			if(event.keyCode==37) $("td").eq(3).css("background-color","yellow");
			if(event.keyCode==38) $("td").eq(1).css("background-color","yellow");
			if(event.keyCode==39) $("td").eq(5).css("background-color","yellow");
			if(event.keyCode==40) $("td").eq(7).css("background-color","yellow");
		});
		$(this).keyup(function(){
			$("td").css("background-color","");
			$("td").eq(4).css("background-color","yellow");
		});
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>key이벤트 연습</h2>
</div>
<div class="container">
<table class="table table-hover" height="300pt">
	<tbody>
		<tr class="text-center"><td>1</td><td>2</td><td>3</td></tr>
		<tr class="text-center"><td>4</td><td>5</td><td>6</td></tr>
		<tr class="text-center"><td>7</td><td>8</td><td>9</td></tr>
	</tbody>
</table>    
</div>
</body>
</html>