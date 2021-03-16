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
[하] 1. 데이터 처리가된 리스트 화면 개발 처리 순서를 간단하게 기술하세요
	   1) 조건과 출력 내용에 맞는 sql 작성
	      select *  ==> resultType, resultMap
	      from 테이블
	      where 조건문 ==> parameterType, parameterMap(권장하지 않음)
	   2)   출력 결과를 위치하는 VO, 입력 처리를 위한 VO/DTO
	   3)   DAO 메서드 선언 : public ArrayList<VO> 메서드명(매개 객체);
	   4)   공통 vo선언, alias, XXXMapper.xml 선언
	   5)   Service단 dao 호출
	   6)   Controller 선언
	      service단 호출 model 데이터 매핑
	   7)   View 호출(jsp)
	      모델 데이터 mapping


[하] 2. 관리자 정보(관리자번호,관리자명)를 가져오는 dao 하위 메서드를 정의하고, EmpMapper.xml를 추가하고,
        현재 모델 데이터를 dao에서 service로 가져온 것을 처리해보세요. 
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