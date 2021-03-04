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
	var proc="${param.proc}";
	if(proc=="ins"){
		if(confirm("등록되었습니다.\n조회화면으로 이동하시겠습니까?")){
			location.href="${path}/prod.do";
		}
	}
	if(proc=="upt"){
		if(confirm("수정되었습니다.\n조회화면으로 이동하시겠습니까?")){
			location.href="${path}/prod.do";
		}
	}
	if(proc=="del"){
		if(confirm("삭제되었습니다.\n조회화면으로 이동합니다.")){
			location.href="${path}/prod.do";
		}
	}
	$(document).ready(function(){
		$("#insBtn").on("click",function(){
			if(confirm("등록하시겠습니까?")){
				$("[name=proc]").val("ins");
				$("form").submit();
			}
		});
		$("#uptBtn").on("click",function(){
			if(confirm("수정하시겠습니까?")){
				$("[name=proc]").val("upt");
				$("form").submit();
			}
		});
		$("#delBtn").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				$("[name=proc]").val("del");
				$("form").submit();
			}
		});
		$("#mainBtn").on("click",function(){
			location.href="${path}/prod.do";
		});
	});
</script>
</head>
<body>
	<h3>
	<c:choose>
		<c:when test="${param.proc=='insFrm'}">
			물품등록화면(MVC)
		</c:when>
		<c:otherwise>
			물품상세화면(MVC)(${param.pno})
		</c:otherwise>
	</c:choose>
	</h3>
	<form method="post">
		<input type="hidden" name="proc" value=""/>
	<table>
		<col width="50%">
			<c:if test="${param.proc!='insFrm'}">
			<tr><th>물건번호</th><td><input type="text" name="pno" value="${prod.pno}"/></td></tr>
			</c:if>
			<tr><th>물건명</th><td><input type="text" name="name" value="${prod.name}"/></td></tr>
			<tr><th>단가</th><td><input type="text" name="price" value="${prod.price}"/></td></tr>
			<tr><th>재고량</th><td><input type="text" name="cnt" value="${prod.cnt}"/></td></tr>
			<c:if test="${param.proc!='insFrm'}">
			<tr><th>등록일</th><td><input type="text" name="credte" value="<fmt:formatDate type='date' pattern='yyyy-MM-dd' value='${prod.credte}'/>" placeholder="yyyy-MM-dd"></td></tr>
			</c:if>
			<tr><th>생산지(회사)</th><td><input type="text" name="company" value="${prod.company}"/></td></tr>
			<c:if test="${param.proc!='insFrm'}">
			<tr><th>최근입고일</th><td><input type="text" name="incomedte" value="<fmt:formatDate type='date' pattern='yyyy-MM-dd' value='${prod.incomedte}'/>" placeholder="yyyy-MM-dd"></td></tr>
			</c:if>
			<tr><th>입고담당자</th><td><input type="text" name="inmanager" value="${prod.inmanager}"/></td></tr>
		<tr><td colspan="2">
			<c:choose>
				<c:when test="${param.proc=='insFrm'}">
					<input type="button" value="등록" id="insBtn"/>
				</c:when>
				<c:otherwise>
					<input type="button" value="수정" id="uptBtn"/>
					<input type="button" value="삭제" id="delBtn"/>
				</c:otherwise>
			</c:choose>			
			<input type="button" value="메인페이지이동" id="mainBtn"/>
		</td></tr>
	</table>
	</form>
</body>
</html>