<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--

*주석은 꼭 <%--로!*


#최상단에 jsp 페이지에 대한 설정 정보 선언
1. @ page : 페이지에 대한 선언, Directive라고 함
	1) 프로그래밍 언어
	2) 화면 출력 방식 : contentType
		ex) text/html : html, 파일 전송, excel, pdf등을 전송할 수 있음
	3) 문자의 encoding 방식 : pageEncoding

2. html 코드를 기반으로 함
3. 스크립틀릿(scriptlet), 표현식(expression), 선언부(Declaration)를 통해서 java코드가 삽입됨
4. 이 내용을  servlet 형식의 자바클래스로 만들어 컴파일과 실행 후, 결과 html을 만들고 요청한 곳에 stream 방식으로 파일을 전송해 브라우저에서 볼 수 있게 됨
   프로세스 : 
         1) 브라우저 주소에 ip와 페이지를 입력
         2) 서버에 해당하는 페이지를 찾음
         3) 아래와 같은 프로세스를 거쳐 클라이언트(브라우저에 전달)
         
   jsp 페이지 -> servlet 클래스 -> html 코드 -> 브라우저에 받아 html 렌더링
   서버         서버        서버만들어 클라이언트에 전달
   
  
#디렉티브(Directive)
1. jsp 페이지에 대한 설정 정보 지정
2. 디렉티브 구문
	형식 %@ 디렉티브 이름 속성=속성값 속성=속성값
3. 제공 디렉티브 이름
	1) page : jsp 페이지에 대한 정보를 지정
		- 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 정보 지정
	2) taglib : 사용할 태그 라이브러리 지정
		ex) %@ taglib uri="@@@.@@"
		jstl: 표준 태그 라이브러리: 기본 태그로 지원되지 않는 내용을 태그로 지정하고 java코드와 합께 기능처리
	3) include : 다른 페이지를 포함할 때 지정
		ex) %2 include file="##.jsp"
      
      
#스크립트 요소
1. 동적으로 출력 결과물을 생성하기 위해 사용
2. 스크립트 요소
	1) 표현식(Expression) - 변수를 통해 값을 출력   
		ex) <%=변수명%>
	2) 스크립트릿(Scriptlet) - 자바 코드를 실행       
		ex) <% %>를 선를 선언하여 자바의 변수를 선언하거나 조건 반복문의 로직을 수행
	3) 선언부(Declaration) - 자바 메서드(함수)를 정의
		ex) % ! %사이에 선언
      
      
#기본 내장 객체(implicit object)
	1) 웹 프로그래밍에 필요한 기능을 제공하는 객체
	2) jsp에서 별도의 선언 없이 사용 가능
	3) 주요 기본 객체
      - request   : 요청 정보를 구할 때 사용
      - response  : 응답과 관련된 설정시 사용
      - out       : 직접 응답을 출력할 때 사용
      - session   : 세션 관리에 사용
 --%>
<%!
	// 1. 선언부 변수의 선언/메서드의 선언
	String name = "홍길동";
	int plus(int num01, int num02){
		return num01+num02;
	}
%>
<%
	//2. 스크립트릿: 반복문 조건문 등 여러 가지 프로그램을 처리하는 부분
	name="신길동"; //값의 변경
	int result = plus(25,30); // 선언할 결과값을 변수에 할당
	for(int cnt=1; cnt<=10; cnt++){
%>
		<h3><%=cnt%>번째 안녕하세요</h3>
		<%-- 3. 익스프레션: 위 선언부터 스클립틀릿의 데이터출력 --%>
<%
	}
%>
<%--
ex1) 선언부에는 물건가격과 개수를 입력받아 총계를 리턴하는 메서드 선언
	 스클릿트 부분에 위 물건명, 가격, 개수를 할당하고
	 익스프레션 부분에 물건명, 가격, 개수, 총계를 h3로 출력하세요
	 (단, 총계는 선언부에 선언한 메서드 이용)
 --%>
<%!	// 선언
	String pname;
	int price;
	int cnt;
	int tot(int price, int cnt){
		return price*cnt;
	}
%>
<%	// 스클립틀릿
	pname = "사과";
	price =  2000;
	cnt = 5;
%>
	<h3>물건명: <%=pname %></h3>
	<h3>가격: <%=price %></h3>
	<h3>개수: <%=cnt %></h3>
	<h3>총계: <%=tot(price,cnt) %></h3>
</body>
</html>