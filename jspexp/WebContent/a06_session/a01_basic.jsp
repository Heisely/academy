<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- path기준으로 모든 자원(css,img,js)에 접근하여 사용할 수 있다 --%>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<%--
# 세션(session)
1. 웹 컨테이너(서버)에서 클라이언트의 접속정보를 보관할 때 사용
2. 서버에서만 생성하여 저장
3. 클라이언트 단위로 서버에 객체를 생성
	1) 브라우저가 닫히면 세션 자동 종료
	2) 브라우저가 열려 있으면 계속 세션 유지
	3) 다른 브라우저를 통해서 세션 확인 불가
4. session 기본 객체를 이용한 접근 방법
	1) page 속성 session=true가 default
		명시적으로 session=false하지 않는 이상 session 객체를 사용할 수 없음
	2) session의 설정
		session.setAttribute("세션명", 할당할 객체);
	3) session 가져오기
		session.getAttribute("세션명")
		객체일 경우 typecasting을 통해서 가져옴
		(클래스명)session.getAttribute("세션명");
5. 세션 종류 / 타임 아웃
	1) 프로그래밍으로 처리
		- 전체 session 종료: session.invalidate()
		- 특정 유효기간으로 종료: setMaxInactiveInterval(초단위);
	2) web.xml 설정으로 처리
		<session-config>
			<session-timeout>30</session-timeout>
--%>
<body>
<%
// 1. session 설정
	// 1) 일반변수
	session.setAttribute("name","홍길동");
	// 2) 객체설정
	session.setAttribute("p01", new Product("사과",3000,2));
	// 3) 설정된 객체 가져오기
	Product p = (Product)session.getAttribute("p01");
	
// ex1) Person 객체 설정 후 하단에 Person객체의 속성 가져오기
	session.setAttribute("p", new Person("홍길동",25,"서울 신림동"));
// ex2) ArrayList<Person>으로 3명 등록하고 하단에 반복문으로 출력
	ArrayList<Person> plist = new ArrayList<Person>();
	plist.add(new Person("신길동",28,"서울 방배동"));
	plist.add(new Person("김길동",25,"인천 송도"));
	plist.add(new Person("마길동",27,"경기 수원"));
	session.setAttribute("plist",plist);
%>
	<h3>이름: <%=session.getAttribute("name")%></h3>
	<hr>
	<h3>Product session</h3>
	<table>
		<tr><th>과일명</th><td><%=p.getName()%></td></tr>
		<tr><th>가격</th><td><%=p.getPrice()%></td></tr>
		<tr><th>개수</th><td><%=p.getCnt()%></td></tr>
	</table>
	<hr>
	<h3>Person session ex1</h3>
	<%Person p01 = (Person)session.getAttribute("p");%>
	<hr>
	<h3>Person session ex2 - ArrayList</h3>
	<h4 onclick="location.href='a02_show.jsp'">[리스트 session 확인]</h4>
</body>
</html>













