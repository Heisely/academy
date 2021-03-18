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
		// form이 가지고 있는 submit 방지
		$("form").submit(function(e){
			e.preventDefault();
		});
		$("#id").keyup(function(e){
			if(e.keyCode==13){
				ckId();				
			}
		});
		$("#ckIdBtn").click(function(){
			ckId();
		});
	});
	function ckId(){
		//alert($("form").serialize());
		$.ajax({
			type:"post",
			url:"${path}/hasMember.do",
			data:$("form").serialize(),
			dataType:"json",
			success:function(data){
				//alert(data.mCnt);
				if(data.mCnt==1){
					alert("등록된 아이디가 있습니다.");
					$("#id").val("").focus();
				} else {
					alert("등록 가능합니다.")
				}
			},
			error:function(err){
				console.log(err);
			}
		});
	}
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>회원 등록</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline">
		<input class="form-control mr-sm-2" type="text" name="id" id="id" placeholder="등록할id입력">
		<button class="btn btn-success" id="ckIdBtn" type="button">등록여부확인</button>
	</form>
</nav>
</div>
</body>
</html>