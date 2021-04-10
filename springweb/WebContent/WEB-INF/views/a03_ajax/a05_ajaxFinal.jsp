<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		$("#btn01").click(function(){
			$.ajax({
				type:"post",
				url:"${path}/jsonExp01.do",
//				data:$("form").serialize(), // 요청값이 있을 때
				dataType:"json",
				success:function(data){
					// alert(data.dept.length);
					alert(data.num01);
				},
				error:function(err){
					alert("에러발생");
					console.log(err);
				}
			});
		});
		$("#btn02").click(function(){
			$.ajax({
				type:"post",
				url:"${path}/jsonExp02.do",
//				data:$("form").serialize(), // 요청값이 있을 때
				dataType:"json",
				success:function(data){
					// alert(data.dept.length);
					alert(data.name);
				},
				error:function(err){
					alert("에러발생");
					console.log(err);
				}
			});
		});
		$("#btn03").click(function(){
			$.ajax({
				type:"post",
				url:"${path}/jsonExp03.do",
//				data:$("form").serialize(), // 요청값이 있을 때
				dataType:"json",
				success:function(data){
					// alert(data.dept.length);
					console.log(data.p01);
					var p01 = data.p01;
					$("[name=name]").val(p01.name);
					$("[name=age]").val(p01.age);
					$("[name=loc]").val(p01.loc);
					alert(data.p01.name);
				},
				error:function(err){
					alert("에러발생");
					console.log(err);
				}
			});
		});
		$("#btn04").click(function(){
			$.ajax({
				type:"post",
				url:"${path}/jsonExp04.do",
//				data:$("form").serialize(), // 요청값이 있을 때
				dataType:"json",
				success:function(data){
					// alert(data.dept.length);
					console.log(data.list);
					var list = data.list
					alert("첫 번째 이름: "+data.list[0].name);
					var show = "";
					$.each(list,function(idx, p, arry){
						show += "<tr class='text-center'><td>"+p.name+"</td><td>"+p.age+"</td><td>"+p.loc+"</td></tr>";
					});
					$("#show").html(show);
				},
				error:function(err){
					alert("에러발생");
					console.log(err);
				}
			});
		});
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>부트스트랩 form</h2>
</div>
<div class="container">
	<button id="btn01" class="btn btn-success" type="button">ajax(단일값-숫자)</button>
	<button id="btn02" class="btn btn-success" type="button">ajax(단일값-문자)</button>
	<button id="btn03" class="btn btn-success" type="button">ajax(단일객체)</button>
	<button id="btn04" class="btn btn-success" type="button">ajax(객체형배열)</button>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post">
		<input class="form-control mr-sm-2" type="text" name="name" value="" placeholder="이름">
		<input class="form-control mr-sm-2" type="text" name="age" value="" placeholder="나이">
		<input class="form-control mr-sm-2" type="text" name="loc" value="" placeholder="사는곳">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>이름</th><th>나이</th><th>사는곳</th>
		</tr>
	</thead>
	<tbody id="show">
	</tbody>
</table>    
</div>
</body>
</html>