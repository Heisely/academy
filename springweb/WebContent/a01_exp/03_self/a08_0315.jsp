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
		1) mybatis.Spring.xml에 VO 및 XXXMapper.xml 등록
		2) interface Dao파일에 메서드 선언
		3) Mapper에서 사용할 SQL 정의
		4) Service단에서 메서드 정의
		5) view단 작성(jsp파일)
		6) 컨트롤러에서 DAO를 호출하고 view단 호출
		 
[하] 2. 관리자 정보(관리자번호,관리자명)를 가져오는 dao 하위 메서드를 정의하고, EmpMapper.xml를 추가하고,
        현재 모델 데이터를 dao에서 service로 가져온 것을 처리해보세요.
        [DAO]
        public ArrayList<Emp> mgrSearch(Emp sch);
        
        [EmpMapper.xml] - 
		<select id="mgrSearch" resultMap="empResult" parameterType="emp">
			SELECT DISTINCT e.empno, e.ename
			FROM emp01 e, emp01 m
			WHERE e.empno = m.mgr
			ORDER BY empno DESC
		</select>       
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