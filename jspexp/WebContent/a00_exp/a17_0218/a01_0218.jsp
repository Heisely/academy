<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A04_MemberDao"%>
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
/* 

*/
//
	$(document).ready(function(){
		$("h3").text("0218 과제 - 회원 id 확인");
	});
</script>
</head>
<body>
	<h3></h3>
<%--
[JSP]
[하] 1. useBean을 이용하여, 회원등록여부를 DB처리를 통해서 등록여부를 확인하세요.
        회원id:[   ] [등록여부확인] => dao 기능메서드를 통해 확인해서 해당 id가 있으면 등록된 회원입니다.
        없으면 회원등록 가능합니다. 메시지 처리하기.
--%>
	<form method="post">
		<table>
			<tr><th>회원ID</th><td><input type="text" name="id"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="등록여부확인"/></td></tr>
		</table>
	</form>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
	<jsp:setProperty property="*" name="m"/>
	<%
	boolean isExist = false;
	if(m.getId()!=null){
		A04_MemberDao dao = new A04_MemberDao();
		Member m1 = dao.member(m);
		if(m1==null){
			isExist = true;
		} else {
			m.setAuth(m1.getAuth());
	        m.setName(m1.getName());
	        m.setPoint(m1.getPoint());
			response.sendRedirect("a02_0218_success.jsp");
		}
	}
	%>
	<script type="text/javascript">
	var isExist = <%=isExist%>;
	if(isExist){
		alert("회원등록이 가능한 아이디입니다.");
		$("[name=id]").focus();
	}
	</script>
<%--
[a02_0218_success.jsp]
<script type="text/javascript">
/* 

*/
//
	alert("등록된 회원입니다.\n회원정보를 불러옵니다.");
	$(document).ready(function(){
		$("h3").text("회원정보");
	});
	function goMain(){
		location.href="a02_0218_success.jsp?goMain=y";
	}
</script>
</head>
<body>
<%
	String goMain = request.getParameter("goMain");
	if(goMain!=null&&goMain.equals("y")){
		session.setAttribute("m", null);
		response.sendRedirect("a01_0218.jsp");
	}
%>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
	<input type="button" value="돌아가기" onclick="goMain()"/>
	<h3></h3>
	<table>
		<tr><th>아이디</th><td><%=m.getId()%></td></tr>
		<tr><th>이름</th><td><%=m.getName() %></td></tr>
		<tr><th>권한</th><td><%=m.getAuth() %></td></tr>
		<tr><th>포인트</th><td><%=m.getPoint() %></td></tr>
	</table>
</body>
--%>


<%--  
[js]
[하] 1. jquery의 lib의 CDN방식과 local호출방식의 차이를 기술하세요.
		> CDN방식: lib는 인터넷에 특정한 주소와 위치에 호출하여 처리하는 방식
				  네트웍환경이 되어 있어야 한다.
		> local호출: 위 CDN에 있는 특정한 jquery lib를 다운받아
					웹어플리케이션 환경의 서버의 특정 위치에 저장하고 호출해 처리하는 방식
					네트웍환경이 안 되어 있어도 자체 테스트 및 활용 가능

[하] 2. $(document).ready(function(){})의 의미를 기술하세요.
		> $: jquery 활용
		> document: 윈도우 하위에 출력을 처리하는 document를 처리하는 객체
		> .ready(함수): document가 메모리에 로딩되어 인식할 수 있는 준비가 되면
					   처리할 정의된 함수나 익명함수를 수행
		> $(function(){});
		
[하] 3. 계층관계의 선택자의 차이(,>)를 기본예제를 통하여 기술하세요.
		> "공백": 계층 레벨에 상관없이 상위 요소객체를 가진 하위 요소객체를 모두 선택(자식/자손 모두 선택)
			ex)
			<script>
				// form 하위 input객체 모두 선택
				$("form input").css("border", "2px dotted blue"); 
				// form 하위 fieldset 하위 input객체 모두 선택
				$("form fieldset input").css("background-color", "yellow"); 
			</script>
			<body>
				<form>
					<div>기본 폼</div>
					<label for="name">기본 폼의 자식</label>
					<input name="name" id="name">
					<fieldset>
						<label for="newsletter">기본 폼의 자손, 필드셋의 자식</label>
						<input name="newsletter" id="newsletter">
					</fieldset>
				</form>			
			</body>
			
		> ">": 부모 자식 관계에서 자식 선택(자손은 선택 안 함)
			<script>
				$("ul.topnav > li").css("border", "3px double red");
			</script>
			<body>
				<ul class="topnav">
					// ul 바로 밑의 li들에만 css 적용
					<li>아이템 1</li>
					<li>아이템 2
						<ul>
							// ul에 싸여있어도, class=topnav 바로 밑이 아니므로 하위 li들은 css 적용이 안 된다.
							<li>중첩 아이템 1</li>
							<li>중첩 아이템 2</li>
							<li>중첩 아이템 3</li>
						</ul>
					</li>
					<li>아이템 3</li>			
				</ul>
			</body>
		
[하] 4. 형제관계의 선택자의 차이(+,~)의 차이를  선택자 예제를 통하여 기술하세요.
		> $("형제1 + 형제2"): 형제1을 앞으로 둔 형제2 요소객체에 대한 선택자 처리
			<script>
				$("label + input").css("color", "blue").val("Labeled!");
			</script>
			<body>
				<label for="name">기본 폼의 자식</label>
				<input name="name" id="name"> // lable 바로 뒤에 있으므로 css 및 val적용 가능
				<fieldset>
					<label for="newsletter">기본 폼의 자손, 필드셋의 자식</label>
				</fieldset>
				<input name="newsletter" id="newsletter"> // lable 바로 뒤에 없으므로 css 및 val적용 불가능
			</body>
				
		> $("형제1 ~ 형제2"): 형제1을 앞으로 둔 '모든' 형제2 요소객체에 대한 선택자 처리 
			<script>
				$("#prev ~ div").css("border","3px groove blue");
			</script>
			<body>
				<span id="prev">span 아이템 1</span>
				<div>DIV 아이템 2</div> // span 바로 뒤 형제로, 선택자 적용 가능
				<div>DIV 아이템 3<div id="small">중첩 DIV 아이템 1</div></div> // span 바로 뒤 형제가 아님에도 불구하고 선택자 적용 가능
				<span>span 아이템 2</span> // span의 형제는 div이므로 이 부분은 선택자 적용 X
				<div>DIV 아이템 4</div> // span 바로 뒤 형제가 아님에도 불구하고 선택자 적용 가능
			</body>

[하] 5. 속성값의 차이(*=,~=,^=,$=)의 차이를 기술하세요.
		> $("요소객체[속성*=속성값]"): 해당 요소객체의 속성에 속성값이 포함되어 있는 경우
		> $("요소객체[속성~=속성값]"): 해당 요소객체의 속성에 속성값이 '단어'로 포함되어 있는 경우
		> $("[속성^=속성값]"): 해당 속성의 속성값으로 '시작'하는 모든 요소 객체
		> $("[속성$=속성값]"): 해당 속성의 속성값으로 '끝'나는 모든 요소 객체
		
[하] 6. html(), text(), val()의 기능적 차이를 기술하세요.
		> 공통점: 읽기와 저장이 가능한 메서드
		> .html(): html코드 랜더링
		> .text(): 랜더링 없이 text 문자 그대로 출력 및 저장
		> .val(): form 하위 객체의 value 값을 저장하거나 호출
		cf) .attr("기본속성","속성값"): 요소객체의 기본 속성과 속성값을 설정
			.css("css속성","css속성값"): 요소의 css속성과 속성값을 설정할 때 사용
--%>

</body>
</html>