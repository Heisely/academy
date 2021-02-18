<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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

</script>
</head>
<%--        
[JSP]
[하] 1. 웹화면에서 데이터를 삭제할 때, 진행되는 순서를 간단하게 기술하세요.
	> 수정버튼 클릭 시 요청값을 proc속성에 속성값 del로 처리하고 요청값 전송
	> proc = del과 함께 수정할 데이터를 입력받아 출력처리
	> 수정할 SQL 확인
	> 기능 메서드 public void delEmp(Emp del) 구현(메서드이름은 del+테이블명)
	> 넘겨온 요청값을 기능 메서드의 매개변수로 넘기기 위해 객체 처리
	> DAO에 선언할 메서드 처리
	
[하] 2. 물건객체에서 삭제처리하는 프로세스에 의해 삭제 처리하세요
	> 2월 10일 과제에
	> sql확인 및 DAO에 delProduct(int pno) 처리, a02_0210_detail.jsp 수정 완료
	> 삭제처리 정상적으로 이루어짐
	
[하] 3. useBean에서 property와 필드를 구분하여 기술하세요.
	> 필드: useBean의 대상이 되는 클래스의 class변수/상수를 의미하고
			일반적으로 접근제어자가 private이기에 직접적인 접근을 할 수 없다.
	> property: useBean의 대상이 되는 setXXX()메서드와 getXXX()메서드로
				JSP에서 호출할 때에는 set과 get은 빼고, 나머지 메서드명을 소문자로 만들어 지칭
				접근제어자는 일반적으로 public으로 접근하여 사용할 수 있다.

[하] 4. 아이디, 패스워드, 이름, 포인트, 권한이 있는 Member VO객체를 만들고,
        회원등록페이지와 useBean을 이용해서, 등록버튼 클릭시 등록 회원을
        확인할 수 있게 처리하세요.
        > 정상 작동 확인 완료
        [a02_regMember.jsp]
        <body>
			<h3>회원정보 입력</h3>
			<form method="post" action="a03_revBean.jsp">
			<table>
				<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
				<tr><th>패스워드</th><td><input type="text" name="pw"/></td></tr>
				<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
				<tr><th>포인트</th><td><input type="text" name="point"/></td></tr>
				<tr><th>권한</th><td><input type="text" name="auth"/></td></tr>
				<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
			</table>
			</form>
		</body>
		
		[a03_revBean.jsp]
		<jsp:useBean id="m01" class="jspexp.z01_vo.Member" scope="session"></jsp:useBean>
		<jsp:setProperty property="*" name="m01"/>
		<body>
			<h3>저장된 Member</h3>
			<table>
				<tr><th>아이디</th><td><%=m01.getId() %></td></tr>
				<tr><th>패스워드</th><td><%=m01.getPass() %></td></tr>
				<tr><th>이름</th><td><%=m01.getName() %></td></tr>
				<tr><th>포인트</th><td><%=m01.getPoint() %></td></tr>
				<tr><th>권한</th><td><%=m01.getAuth() %></td></tr>
			</table>
		</body>
--%>
<%--  
[js]
[하] 1. 윈도우창 로딩시, 매개변수에 따른 기본 옵션을 기술하세요.
		> .open("url","이름","option"): 새로운 창 open
			option: width(너비), height(높이)
		> .moveTo(x,y): 절대위치이동
		> .moveBy(x,y): 현재위치에서 x축, y축방향으로 설정한 값만큼 이동
		> .resizeTo(x축크기, y축크기): 절대적 윈도우 창 크기 변경
		> .resizeBy(x축크기, y축크기): 상대적 윈도우 창 크기 변경
		
[하] 2. 윈도창이 왼쪽 상단에 로딩되어, 오른쪽으로 하단으로 다시 왼쪽으로
        위로 이동하여 멈추게 처리하세요.(자동으로 이동)
        > 자동으로 하는 방법을 모르겠습니다ㅠ
--%>
<script>
	window.onload=function(){
		var win = window.open('','','width=300, height=300');
		win.document.write("<h2>움직이는 창!</h2>");
		var xpos = 0;
		var ypos = 0;
		var cnt = 0;
		var setIntv = setInterval(function(){
			cnt++;
/* 			if(cnt<=20) {	// 1~20: x축 오른쪽으로 이동
				xpos += 10;
			} else if(cnt<=40) { // 21~40: y축 아래로 이동
				ypos += 10;
			} else if(cnt<=60) { // 41~60: x축 왼쪽으로 이동
				xpos -= 10;
			} else if(cnt<=80){ // 61~80: y축 위로 이동
				ypos -= 10;
			} else { // 80 초과일 때 반복처리 중단
				clearInterval(setInt);
			} */
			if(cnt<=40){
				xpos += 10;
				ypos += 10;
			} else if(cnt<=80){
				xpos -= 10;
				ypos -= 10;
			} else {
				clearInterval(setInt);
			}
			win.moveTo(xpos, ypos);
		},100);
		
	};
</script>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>