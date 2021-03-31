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
# dialogue를 통한 팝업과 데이터 전송 처리
1. dialogue를 처리할 div를 만든다.
	- form객체에 입력할 데이터 설정. name=""
	- 사용할 div의 id 설정.
2. js
	1) 해당 div의 id로 dialogue(기본 옵션) 형식으로 화면에 있는 div의 기본 옵션을 선언
		ex) $("선택자").dialog({속성:속성값, ...});
	2) 특정 이벤트에 의해서 해당 dialogue를 시작
		ex) $("선택자").dialog("open");
	3) 위의 특정 이벤트가 등록/상세/수정/삭제에 따라서 button이나 속성이 변경될 때에는 
		option속성을 초기에는 공통으로 하고, 해당 기능 이벤트마다 option을 json형식으로 변경하여 처리
	4) 각 버튼에 따라, ajax처리하는 것을 함수에서 처리할 수 있도록 한다.
--%>
//
	$(document).ready(function(){
		// 다이얼로그 초기 옵션
		var opts={
			autoOpen:false, // 초기에 나타나지 않음
			width:"350px",
			modal:true
		}
		$("#dialog01").dialog(opts);
		// 이벤트에 의해 기능 버튼 option 변경
		$("#regBtn").click(function(){
			$("[name=id]").val("초기등록아이디");
			$("[name=name]").val("초기등록이름");
			opts.buttons={
				"등록":function(){
					alert("등록합니다.");
					console.log("# ajax 처리 #");
					console.log($("form").serialize());
				}
			}
			$("#dialog01").dialog(opts); // 등록 버튼 추가
			$("#dialog01").dialog("open"); // 기본 창 로드
		});
		$("#detBtn").click(function(){
			opts.buttons={
				"수정":function(){
					alert("수정합니다.");
				},
				"삭제":function(){
					alert("삭제합니다.");
				}
			}
			opts.width="500px";
			$("#dialog01").dialog(opts); // 수정/삭제 버튼 추가
			$("#dialog01").dialog("open"); // 기본 창 로드
		});
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>다이얼 로그 연습</h2>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<form class="form-inline" method="post" >
			<button id="regBtn" class="btn btn-success" type="button">등록</button>&nbsp;
			<button id="detBtn" class="btn btn-success" type="button">상세화면</button>
		</form>
	</nav>
	<div id="dialog01" title="회원">
		<form>
			<table class="table table-hover table-striped">
				<tbody>
					<tr class="text-center">
						<th>아이디</th><td><input type="text" name="id" class="form-control"/></td>
					</tr>
					<tr class="text-center">
						<th>이름</th><td><input type="text" name="name" class="form-control"/></td>
					</tr>
				</tbody>
			</table> 
		</form>   
	</div>
</div>
</body>
</html>