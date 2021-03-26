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
		$("#regBtn").click(function(){
			location.href = "${path}/board.do?method=insForm";
		});
		$(".data").dblclick(function(){
			var no = $(this).attr("id");
			location.href = "${path}/board.do?method=detail&no="+no;
		});
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val(1);
			$("form").submit();
		});
	});
	function goPage(page){
		$("[name=curPage]").val(page);
		$("form").submit();
	}
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>게시판 초기 화면</h2>
</div>
<div class="container">
<form:form modelAttribute="sch" method="post">
	<%-- 현재 클릭한 페이지 번호 --%>
	<form:hidden path="curPage"/>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<input class="form-control mr-sm-2" type="text" name="subject" value="" placeholder="제목">
		<input class="form-control mr-sm-2" type="text" name="writer" value="" placeholder="작성자">
		<button class="btn btn-info" id="regBtn" type="button">등록</button>&nbsp;
		<button class="btn btn-success" type="submit">Search</button>
	</nav><br>
	<%-- 총 건수와 페이지 크기 표현 --%>
	<div class="input-group lb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">총 ${sch.count}건</span>
		</div>
		<input class="form-control"/>
		<div class="input-group-append">
			<span class="input-group-text">페이지 크기: ${sch.count}건</span>
			<form:select path="pageSize" class="form-control">
				<form:option value="3">3</form:option>
				<form:option value="5">5</form:option>
				<form:option value="10">10</form:option>
				<form:option value="20">20</form:option>
				<form:option value="30">30</form:option>
			</form:select>
		</div>
	</div>
</form:form>
<table class="table table-hover table-striped">
	<col width="10%">
	<col width="50%">
	<col width="15%">
	<col width="15%">
	<col width="10%">
	<thead>
		<tr class="table-success text-center">
			<th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<jsp:useBean id="today" class="java.util.Date"/>
	<%-- 현재 날짜의 고유값 가져오기: 1970.1.1. --%>
	<fmt:parseNumber value="${today.time/(1000*60*60*24)}" var="toFmt" integerOnly="true"/>
	
		<c:forEach var="bd" items="${boardList}">
		<%-- 등록일에 대한 고유 값 --%>
		<fmt:parseNumber value="${bd.regdte.time/(1000*60*60*24)}" var="crFmt" integerOnly="true"/>
		<tr class="text-center data" id="${bd.no}">
			<td>${bd.no}</td>
			<td class="text-left">
				<%-- 답글의 level만큼 공백을 넣고, 마지막에 답글표기 --%>
				<c:forEach varStatus="sts" begin="1" end="${bd.level}">
					<c:if test="${bd.level>1}">&nbsp;&nbsp;</c:if>
					<c:if test="${bd.level>1 and sts.last}">
						☞&nbsp;<img src="${path}/a01_img/reply.gif" width="30" height="20"/>
					</c:if>
				</c:forEach>
				${bd.subject}
				<c:if test="${toFmt==crFmt}">
					<span class="badge badge-info">New</span>
				</c:if>	
			</td>
			<td>${bd.writer}</td>
			<td><fmt:formatDate value="${bd.regdte}"/></td>
			<td>${bd.readcnt}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>    
<ul class="pagination justify-content-center" style="margin:20px 0;">
	<li class="page-item"><a class="page-link" href="#">Previous</a>
	<c:forEach var="cnt" begin="1" end="${sch.pageCount}">
		<li class="page-item ${sch.curPage==cnt?'active':''}">
			<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
		</li>
	</c:forEach>
	<li class="page-item"><a class="page-link" href="#">Next</a>
</ul>
</div>
</body>
</html>