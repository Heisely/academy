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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style type="text/css">
	.input-group-text{
		width:100%;
		background-color:linen;
		color:black;
		font-weight:bolder;}
	.input-group-prepend{width:20%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--
 
--%>
//
	$(document).ready(function(){
		$("[name=fnames]").click(function(){
			var fname = $(this).val();
			if(confirm(fname+" 파일을 다운로드 하시겠습니까?")){
				location.href = "${path}/board.do?method=download&fname=" + fname;
			}
		});
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h1>게시판 상세화면[${param.no}]</h1>
</div>
<div class="container">
	<form method="post" enctype="multipart/form-data">
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">글번호</span>
		</div>
		<input name="no" class="form-control" value="${board.no}"/>
		<div class="input-group-prepend">
			<span class="input-group-text">상위글번호</span>
		</div>
		<input name="refno" class="form-control" value="${board.refno}"/>
	</div>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">작성자</span>
		</div>
		<input name="writer" class="form-control" value="${board.writer}" placeholder="작성자를 입력하세요"/>
		<div class="input-group-prepend">
			<span class="input-group-text">조회수</span>
		</div>
		<input class="form-control" value="${board.readcnt}"/>
	</div>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">제 목</span>
		</div>
		<input name="subject" class="form-control" value="${board.subject}" placeholder="제목을 입력하세요"/>
	</div>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">등록일</span>
		</div>
		<input class="form-control" value="<fmt:formatDate type='both' value='${board.regdte}'/>"/>
		<div class="input-group-prepend">
			<span class="input-group-text">수정일</span>
		</div>
		<input class="form-control" value="<fmt:formatDate type='both' value='${board.uptdte}'/>"/>
	</div>
		<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">내 용</span>
		</div>
		<textarea name="content" rows="10" class="form-control" placeholder="내용을 입력하세요">${board.content}</textarea>
	</div>
	<c:set var="fcnt" value="${board.fileInfo.size()}"/>
	<c:forEach var="finf" items="${board.fileInfo}" varStatus="sts">
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">첨부 파일(${sts.count}/${fcnt})</span>
		</div>
		<!-- 다운로드할 파일 정보 -->
		<input class="form-control fileInfo" name="fnames" value="${finf.fname}"/>
		<div class="custom-file">
			<%-- 변경할 파일 정보 (report ==> VO의 property) --%>
			<input type="file" name="report" class="custom-file-input" id="file01"/>
			<label class="custom-file-label" for="file01">변경하려면 파일을 선택하세요</label>
		</div>
	</div>
	</c:forEach>
	<div style="text-align:right;">
		<input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
		<input type="button" class="btn btn-info" value="삭제" id="delBtn"/>
		<input type="button" class="btn btn-info" value="답글" id="reBtn"/>
		<input type="button" class="btn btn-info" value="조회화면" id="goMain"/>
	</div>
	</form>
</div>
</body>
</html>