<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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
<script type="text/javascript">
<%--
# JSTL
1. Jsp Standard Tag Library: 널리 사용되는 커스텀 태그를 표준으로 만든 태그 라이브러리
2. JSTL의 환경설정
	1) WebContent\WEB-INF\lib에 jstl-1.2.jar 추가
	2) tag lib를 상단에 선언
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
3. JSTL의 핵심 tag 종류
	1) core: <c:XXX /> 변수 지원, 흐름제어 url 처리
	2) fmt:  <fmt:XXX /> 지역, 메시지 형식, 숫자 및 날짜 형식..
	3) x(xml 코어), sql(데이터베이스), fn(함수)
4. 활용
	1) 변수 설정
		el 변수 값 설정
		<c:set var="변수명" value="값" scope="session범위"/>
		선언된 변수는 el로 호출할 수 있다. ${변수명}
		ex) <c:set var="name" value="홍길동" scope="request"/>
			<h2>이름: ${name}</h2> ==> 홍길동 출력
		ex) <%
			request.setAttribute("p", new Person("홍길동", 25, "서울신림동");
			%>
			<c:set var="p01" value="${p}" />
			
			# property: 객체의 속성에 접근하는 메서드를 사용하는 것을 말한다.
					set/get을 제외하고 모두 소문자로 변경하여 활용한다.
					public void setName(String name){} 메서드가 있고,
					이 객체의 property name을 호출한다는 것은 위 기능 메서드를 호출해서 처리한다는 것이다.
					setName ==> Name ==> name. 즉, 최종 name이 property를 의미한다.
					el이나 jstl에서 호출할 때, 필드명과 동일해서 필드로 오인하는 경우가 많은데,
					필드는 private 접근제어자가 붙어있어 접근하지 못 한다.
	2) 객체의 값의 변경
		<jsp:useBean id="객체참조명" class="@@@"/>
		<% mvc의 컨트롤러에서 선언된 코드, jsp의 sciptlet 코드
		request.setAttribute("객체참조명", new 객체명(@@@));
		%>
		<c:set var="변수명" value="${참조명}/new 객체명("")"/>
	
		<c:set target="객체명(bean의 it, session scope의 변수명, c:set의 var=변수명)" 
			   property="프로퍼티이름/set메서드명" value="할당할 값"/>
		${객체명.프로퍼티명}
		
		cf) 바로 el코드로 처리해도 된다. ${객체명.setName("홍길동")}
		ex) <c:set target="p01" property="name" value="마길동" />
			${p01.name}: 변경된 데이터 확인(홍길동 --> 마길동)
		
	3) 조건문 처리
		- 단일조건문
			<c:if test="boolean">boolean이 true일 때 수행할 내용</c:if>
		- 다중조건문
			<c:choose>
				<c:when test="조건1인경우">조건1이 true일 때, </c:when>
				<c:when test="조건2인경우">조건2이 true일 때, </c:when> // else if가 포함되어 조건1이 아니고, 조건2인 경우
				<c:when test="조건3인경우">조건3이 true일 때, </c:when>
				<c:otherwise>위의 조건을 제외한 나머지..</c:otherwise>
			</c:choose>
			※ 주의 - when test 구문은 앞의 조건을 제외한 내용이다.
--%>
	$(document).ready(function(){
		//$("h3").text("시작");
	});
</script>
</head>
<body>
	<c:set var="name" value="홍길동" scope="request"/>
	<%--
	# 객체 설정하는 3가지 형식
	1. pageContext/request/session/application
	--%>
	<%
	pageContext.setAttribute("m01", new Member());
	%>
	<c:set target="${m01}" property="id" value="goodman"/>
	아이디: ${m01.id}
	<%--
	2. <c: set var="변수명" value="<%=new 객체명()%>"/>
	--%>
	<c:set var="m02" value="<%=new Member() %>"/>
	<c:set target="${m02}" property="id" value="higirl"/>
	<%--
	3. jsp:useBean...>
	--%>
	<jsp:useBean id="mem" class="jspexp.z01_vo.Member"/>
	<%-- property 형식으로 변경 > mem.setId("himan") --%>
	<c:set target="${mem}" property="id" value="himan"/>
	<h3>제목</h3>
	<table>
		<tr><th>이름</th><td>${name}</td></tr>
		<tr><th>아이디</th><td>${mem.id}</td></tr>
	</table>
	<%-- ex1) 임의의 변수 num01, num02에 데이터를 할당하여 사칙연산 결과를 출력 처리 하세요. --%>
	<c:set var="num01" value="25" scope="request"/>
	<c:set var="num02" value="30" scope="request"/>
	<h4>${num01} + ${num02} = ${num01+num02}</h4>
	<h4>${num01} - ${num02} = ${num01-num02}</h4>
	<h4>${num01} * ${num02} = ${num01*num02}</h4>
	<h4>${num01} / ${num02} = ${num01/num02}</h4>
	<%-- ex2) Product 객체의 속성을 useBean과 JSTL로 변경하고, el태그로 속성을 확인하세요. --%>
	<jsp:useBean id="prod" class="jspexp.z01_vo.Product"/>
	<c:set target="${prod}" property="name" value="apple"/>
	<%--
	Product pro = new Product();
	pro.setName("사과");
	--%>
	<c:set target="${prod}" property="price" value="2000"/>
	<c:set target="${prod}" property="cnt" value="2"/>
	<h3></h3>
	<table>
		<tr><th>물건명</th><td>${prod.name}</td></tr>
		<tr><th>가격</th><td>${prod.price}</td></tr>
		<tr><th>개수</th><td>${prod.cnt}</td></tr>
		<tr><td colspan="2">
				<c:if test="${prod.price * prod.cnt >= 6000}">
					6,000원 이상이면 1+1 행사 대상입니다.
				</c:if>
		</td></tr>
	</table>
	<%-- ex) c:set으로 임의의 점수 할당: 60점 이상이면 합격 표시. --%>
	<%-- <c:set var="score" value="${Math.random()*100}" scope="request"/>
		 <h4>점수: ${score}</h4>
		 <c:if test="${score >=60}"> 합격 </c:if>	 --%>
	<%
	request.setAttribute("ran", (int)(Math.random()*101));
	%>
	<c:set var="point" value="${ran}"/>
	<h3>점수: ${point}, 결과: <c:if test="${point<60}">불</c:if>합격</h3>
	<h3>등급: 
		<c:choose>
			<c:when test="${point>=90}">A</c:when>
			<c:when test="${point>=80}">B</c:when>
			<c:when test="${point>=70}">C</c:when>
			<c:when test="${point>=60}">D</c:when>
			<c:otherwise>F</c:otherwise>
		</c:choose>!!
	</h3>
	<%-- ex1) 물건가격과 개수를 변수로 선언하고, 해당 데이터가 100000이상일 때, 10%할인
			 50000이상 5%할인, 그 외 3%할인을 표시하세요 --%>
	<% request.setAttribute("cnt", (int)(Math.random()*20+1)); %>
	<c:set var="price" value="12345"/>
	<h2>ex1</h2>
	<h4>
	물건 가격: ${price}<br>
	물건 개수: ${cnt}<br>
	총 구매금액: ${price*cnt}<br>
	할인율:
		<c:choose>
			<c:when test="${price*cnt>=100000}">10%, 할인가: ${price * cnt * 0.9}원</c:when>
			<c:when test="${price*cnt>=50000}">5%, 할인가: ${price * cnt * 0.95}원</c:when>
			<c:otherwise>3%, 할인가: ${price * cnt * 0.97}원</c:otherwise>
		</c:choose>
	</h4>
	
	<h2>ex1 풀이</h2>
	<c:set var="price1" value="30000"/>
	<c:set var="cnt1" value="10"/>
	<h4>물건가격: ${price1}</h4>
	<h4>물건개수: ${cnt1}</h4>
	<c:set var = "tot" value="${price1 * cnt1}"/>
	<h4>
		<c:choose>
			<c:when test="${tot>=100000}">10%할인<c:set var="dis" value="0.1"/></c:when>
			<c:when test="${tot>=100000}">5%할인<c:set var="dis" value="0.05"/></c:when>
			<c:otherwise>3%할인<c:set var="dis" value="0.03"/></c:otherwise>
		</c:choose>
	</h4>
	<h4>총비용: ${tot}, 할인금액: ${tot*(1-dis)}</h4>
	
	<%-- ex2) 위 내용을 form객체에 의해 요청값으로 받아서 처리하세요. --%>
<%--
 	<form method="post">
	<table>
		<tr><th>가격</th><td><input type="text" name="price2"/></td></tr>
		<tr><th>개수</th><td><input type="text" name="cnt2"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="가격 계산하기"/></td></tr>
	</table>
	</form>
	<c:set var="price2" value="${price2}"/>
	<c:set var="cnt2" value="${cnt2}"/>
	<table>
		<tr><th>할인율</th><th>할인된 가격</th></tr>
		<tr><c:choose>
				<c:when test="${price2*cnt2>=100000}"><td>10%</td><td>${price2 * cnt2 * 0.9}원</td></c:when>
				<c:when test="${price2*cnt2>=50000}"><td>5%</td><td>${price2 * cnt2 * 0.95}원</td></c:when>
				<c:otherwise><td>3%</td><td>${price2 * cnt2 * 0.97}원</td></c:otherwise>
			</c:choose></tr>
	</table>
	 내가 푼 건 잘 안 됐음 --%> 
	<h3>물건 가격 처리</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>개수</th><td><input type="text" name="cnt"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="계산"/></td></tr>
	</table>
	</form>
	<c:if test="${not empty param.pname}">
		<c:set var="price2" value="${param.price}"/>
		<c:set var="cnt2" value="${param.cnt}"/>
		<h4>물건가격: ${price2}</h4>
		<h4>물건개수: ${cnt2}</h4>
		<c:set var="tot2" value="${price2 * cnt2}"/>
		<h4>
			<c:choose>
				<c:when test="${tot2>=100000}">10%할인<c:set var="dis2" value="0.1"/></c:when>
				<c:when test="${tot>=100000}">5%할인<c:set var="dis2" value="0.05"/></c:when>
				<c:otherwise>3%할인<c:set var="dis2" value="0.03"/></c:otherwise>
			</c:choose>
		</h4>
		<h4>${param.pname} 구매 총 비용: ${tot2}, 할인된 금액: ${tot2*(1-dis2)}</h4>
	</c:if>
</body>
</html>