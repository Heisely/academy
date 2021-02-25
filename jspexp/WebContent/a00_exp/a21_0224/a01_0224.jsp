<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
</head>
<body>
<%--        
[JSP]
[하] 1. forTokens의 기본 속성값을 기술하세요.
		1) var: 구분자에 의해서 추출된 하나의 데이터
		2) items: 구분자가 있는 문자열
		3) delims: 구분자	
[하] 2. 좋아하는 스포츠 스타 9명을 #으로 리스트하여 forTokens를 이용해서 3X3 테이블에 출력하세요.
--%>
	<h2>JSP 과제2번 - 좋아하는 스포츠스타 9명</h2>
	<c:set var="cnt" value="1"/>
	<table>
		<c:forTokens var="star"	items="김연아# 김연경# 지소연# 마이클조던# 웨인# 손흥민# 박지성# 이동국# 안정환#" delims="#">
			<c:if test="${cnt%3==1}"><tr></c:if>
				<td>${star}</td>
			<c:if test="${cnt%3==0}"></tr></c:if>
			<c:set var="cnt" value="${cnt+1}"/>
		</c:forTokens>
	</table>

<%--  
[ajax]
[하] 1. ajax데이터의 속성과 속성값 처리 형식을 기술하세요.
		1) {속성:속성값}, [{속성:속성값,...}]
		2) 웹서비스상 json형식은 다음과 같은 형식을 준수해야 정상적으로 객체화 하여 사용할 수 있다.
		4) 형식
			{"속성":"문자열데이터","속성":숫자형/boolean형데이터}
			> 속성은 반드시 ""(쌍따옴표) 사이에 입력해야 한다.
			> 문자열 데이터 역시 "" 사이에 입력해야 한다.
				cf) ''사이에 입력하거나 없이 입력하면 정상처리가 되지 않는다.
			> 숫자형/boolean형 데이터는 반드시 ""/'' 없이 그대로 입력해야 한다.

[하] 2. 부서 정보를 ajax로 keyup을 통해서, 검색 출력하세요.
	[z01_deptList.jsp]
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<% request.setCharacterEncoding("UTF-8");
	   String path = request.getContextPath();
	%>    
	<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
	<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="deptList" value="${dao.deptList2(param.dname, param.loc)}"/>
	<body>
		<h3>부서정보</h3>
		<h4>${deptList.size()}건</h4>
		<table>
			<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
			<c:forEach var="dept" items="${deptList}">
			<tr><td>${dept.deptno}</td><td>${dept.dname}</td><td>${dept.loc}</td></tr>
			</c:forEach>
		</table>
	</body>
	</html>
--%>
<script type="text/javascript">
	var xhr = new XMLHttpRequest();
	$(document).ready(function(){		
		$("[name=dname],[name=loc]").keyup(function(){
			if(event.keyCode==13){
				ajaxFun();
			}
		});
	});
	function ajaxFun(){		
		var dnameV = $("[name=dname]").val();
		var locV = $("[name=loc]").val();
		var qstr = "dname="+dnameV+"&loc="+locV;		
		xhr.open("get","z01_deptList.jsp?"+qstr,true);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				$("div").html(xhr.responseText);
			}	
		};
		xhr.send();
	}
</script>
	<h2>AJAX 과제2번 - 부서정보 검색 출력</h2>
	<table>
		<tr><th>부서명</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>지역</th><td><input type="text" name="loc"/></td></tr>
	</table>
	<div></div>
<%--  
[중] 3. 오늘 ajax로 리스트 emp 데이터를 행단위로 클릭시 empno데이터를 요청값으로 넘겨주어
    list된 화면에 중앙 위치에 div 창이 show(), hide()를 통해서 상세내용을 ajax를 통해서
    출력하세요. dao의 Emp getEmp(int empno)메서드 활용
--%>
</body>
</html>