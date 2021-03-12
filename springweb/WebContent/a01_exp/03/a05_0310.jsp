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
[하] 1. 소스에 @Autowired 설정처리시, 사용되는 객체와 객체간의 연계부분을 기술하세요.
		1) 컨테이너 부분 설정(dispatcher-servlet.xml)
			<context:annotation-config/>
			<bean class="패키지.클래스명"/>
			-----------------------------
			<context:component-scan base-package="패키지명">
				<context:include-filter type="annotation/regex/assignable/aojp">
		2) 클래스 선언
			@Autowired(required=false): 해당 객체가 메모리에 없더라도 에러(NullPointerException)발생 방지
			private 클래스명 참조변수;

[하] 2. 특정패키지에 Emp(이름), Manager(이름), Ceo(이름) 클래스를 Company클래스(회사명,Emp, Manager, Ceo)로
        설정하여, 소스상 Autowired로 설정하여 호출처리하게 하세요.	
        > springdi.a00_exp.z02_vo	

[하] 3. ModelAttribute란 무엇인가? 개념을 기술하고, 기본 예제를 만들어 보세요. 

--%>
<%--  
[jquery]
[하] 1. filter기능 메서드를 이용해서, 5X5테이블에서 각 td의 3개단위로 배경색상이 다르게 출력, tr의 짝홀번째 글자가 다르게
    출력처리하세요. end()메서드 활용.
--%>
//
	$(document).ready(function(){
		$("td").each(function(idx, ele){
			$(this).text(idx+1).css("font-size","20pt");
		});
		$("td").filter(function(idx,ele){
			return idx%3==0;
		}).css("background-color","red").end()
		.filter(function(idx,ele){
			return idx%3==1;
		}).css("background-color","orange").end()
		.filter(function(idx,ele){
			return idx%3==2;
		}).css("background-color","yellow");
		$("tr").filter(":even").css("color","green").end()
		.filter(":odd").css("color","white");
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>filter 연습 문제</h2>
</div>
<div class="container">
<table class="table table-hover" height="300pt">
	<tbody>
		<c:forEach begin="1" end="5">
		<tr class="text-center">
			<td></td><td></td><td></td><td></td><td></td>
		</tr>
		</c:forEach>
	</tbody>
</table>    
</div>
</body>
</html>