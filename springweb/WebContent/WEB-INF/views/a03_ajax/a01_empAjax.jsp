<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	
<%--
 
--%>
	//
	$(document).ready(function() {
		$("[name=ename],[name=job]").keyup(function(e) {
			if (e.keyCode == 13) {
				//alert($("form").serialize());
				$.ajax({
					type : "post",
					url : "${path}/jsonEmp.do",
					data : $("form").serialize(),
					dataType : "json",
					success : function(data) {
						console.log("데이터크기: " + data.emp.length);
						console.log(data);
						var elist = data.emp;
						var show = "";
						$.each(elist, function(idx, emp){
							show += "<tr class='text-center'>";
							show += "<td>" + emp.empno + "</td>";
							show += "<td class='text-left'>" + emp.ename + "</td>";
							show += "<td class='text-left'>" + emp.job + "</td>";
							show += "<td>" + emp.mgr + "</td>";
							// 1970.1.1.GMT 1/1000씩 카운트된 데이터를 날짜객체에 담아서
							var dt = new Date(emp.hiredate);
							// toLocaleDateString(): 현재 우리나라 날짜 출력형식으로 변환
							show += "<td>" + dt.toLocaleDateString() + "</td>";
							show += "<td class='text-right'>" + comma(emp.sal) + "</td>";
							show += "<td class='text-right'>" + comma(emp.comm) + "</td>";
							show += "<td>" + emp.deptno + "</td></tr>";							
						});
						$("#list").html(show);
					},
					error:function(err){
						alert("에러발생");
						console.log(err);
					}
				});
			}
		});
	});
	function comma(str){ // 정규식 표현에 의해서 숫자를 천단위 콤마(,) 처리
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
	}
</script>
</head>
<body>
<div class="jumbotron text-center">
	<h2>Emp list(Ajax)</h2>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="text" name="ename" placeholder="사원명">
			<input class="form-control mr-sm-2"	type="text" name="job" placeholder="직책명">
		</form>
	</nav>
	<table class="table table-hover">
		<thead>
			<tr class="table-success text-center">
				<th>사원번호</th>
				<th>사원명</th>
				<th>직책</th>
				<th>관리자번호</th>
				<th>입사일</th>
				<th>급여</th>
				<th>보너스</th>
				<th>부서번호</th>
			</tr>
		</thead>
		<tbody id="list">
			
		</tbody>
	</table>
</div>
</body>
</html>