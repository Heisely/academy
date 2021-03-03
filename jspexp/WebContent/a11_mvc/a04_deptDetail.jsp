<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--

--%>
//
	var proc = "${param.proc}";
	if(proc=="upt"){
		if(confirm("수정되었습니다.\n조회화면으로 이동하시겠습니까?")){
			location.href='${path}/dept.do';
		}
	}
	if(proc=="del"){
		alert("삭제완료\n조회화면으로 이동합니다.");
		location.href='${path}/dept.do';
	}

	$(document).ready(function(){
		$("#uptBtn").on("click",function(){
			if(confirm("수정하시겠습니까?")){
				// 유효성 check();
				$("[name=proc]").val("upt");
				$("form").submit();				
			}
		});
		$("#delBtn").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				// 유효성 check();
				$("[name=proc]").val("del");
				$("form").submit();				
			}
		});
	});
</script>
</head>
<body>
	<h3>부서정보[${param.deptno}]</h3>
	<form method="post">
	<input type="hidden" name="proc" value=""/>
	<table>
		<%-- 모델명 dept == dept.dname의 dept와 동일해야 함 --%>
		<c:choose>
			<c:when test="${not empty dept.dname}">
				<tr><th>부서번호</th><td><input type="text" name="deptno" value="${dept.deptno}"/></td></tr>
				<tr><th>부서명</th><td><input type="text" name="dname" value="${dept.dname}"/></td></tr>
				<tr><th>부서위치</th><td><input type="text" name="loc" value="${dept.loc}"/></td></tr>
			</c:when>
		<c:otherwise>
			<tr><td colspan="2">해당 부서정보는 없습니다.</td></tr>
		</c:otherwise>
		</c:choose>
		<tr><td colspan="2">
			<input type="button" value="수정" id="uptBtn">
			<input type="button" value="삭제" id="delBtn">
			<input type="button" value="메인화면" onclick="location.href='${path}/dept.do'">
		</td></tr>
	</table>
	</form>
</body>
</html>