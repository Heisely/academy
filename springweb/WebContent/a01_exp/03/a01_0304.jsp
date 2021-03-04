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
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
1. A01_StartController 안에서 메서드를 추가하고, view단도 추가해서
	view: WEB-INF\views\z01_exp\a01_exp01.jsp
	http://localhost:7080/springweb/start2.do
	화면에서 "안녕하세요. 스프링 연습입니다. ^^" 출력되게 처리
	
	# a01_exp01.jsp <body>
	<h3>안녕하세요. 스프링 연습입니다.^^</h3>
	
	# A01_StartController.java
	@RequestMapping("/start2.do")
	public String start2() {
		return "WEB-INF\\views\\z01_exp\\a01_exp01.jsp";
	}
	
2. springweb\z01_exp\A01_ExpController.java 를 만들고
	 http://localhost:7080/springweb/start3.do 를 호출해서
	 view: WEB-INF\views\z01_exp\a03_exp.jsp 호출하게 처리
	 
	 # dispatcher-servlet.xml 추가
	 <bean class="springweb.z01_exp.A01_ExpController"></bean>
	 
	 # a03_exp.jsp <body>
	 <h3>2021년 03월 04일 Spring 과제 3번입니다.</h3>
	 
	 # A01_ExpController.java
	 package springweb.z01_exp;

	 import org.springframework.stereotype.Controller;
	 import org.springframework.web.bind.annotation.RequestMapping;
	
	 @Controller
	 public class A01_ExpController {
		 // http://localhost:7080/springweb/start3.do
		 @RequestMapping("/start3.do")
		 public String start3() {
			 return "WEB-INF\\views\\z01_exp\\a03_exp.jsp";
		 }
	 }
	 
3. springweb2 dynamicWeb project를 만들고
	초기화면을
	http://localhost:7080/springweb2/newSpring.do 를 호출
	(캡쳐해서 전달)
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>