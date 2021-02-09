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
<body>
<%--
[jsp]
[하] 1. jsp:forward의 기본 코드를 request.getRequestDispatcher비교하세요.
		RequestDispatcher rd = request.getRequestDispatcher("페이지");
		rd.forward(request, response);
		를 포함한 것과 동일하게
		<jsp:forward page="<%=page1%>">
		로 간단하게 표기할 수 있다.
		
[하] 2. 물건명,물건가격, 물건갯수를 입력받아, 1000000이상은 VVIP, 50만이상 VIP 
        그외에는 일반고객으로 각각의 페이지를 구현하여 처리하세요. 고객 이름과 함께 처리하세요.
        @@님 총구매금액 @@@원으로 VVIP 페이지에 접속하셨습니다.
--%>
	<h2>JSP ex2</h2>
	<form method="post">
		아이디:<input type="text" name="id"/><br>
		물건명:<input type="text" name="pname"/><br>
		가격:<input type="text" name="price"/><br>
		개수:<input type="text" name="cnt"/><br>
		<input type="submit" value="구매"/>
	</form>
<%
	String priceS = request.getParameter("price");
	if(priceS==null) priceS="0";
	int price = Integer.parseInt(priceS);
	
	String cntS = request.getParameter("cnt");
	if(cntS==null) cntS="0";
	int cnt = Integer.parseInt(cntS);

	int tot = price*cnt;

	String level="";
	if(price!=0 && cnt!=0){
		if(tot>=1000000){
			level = "a01_VVIP.jsp";
		} else if(tot>=500000){
			level = "a01_VIP.jsp";
		} else {
			level = "a01_normal.jsp";
		}
%>
		<jsp:forward page="<%=level%>"/>
<%} %>
<%--


--%>
</body>
<script>
/*
[js]
[하] 1. prototype의 개념에 대하여 Book(도서명,저자,가격)의 생성자형 객체를 기준으로
        배열형(구매 도서3권)으로 선언하여 기술하세요.
 */
function Book(name, writer, price){
	this.name = name;
	this.writer = writer;
	this.price = price;
}
Book.prototype.toString = function(){
	return "도서명: "+this.name+"\n"+
			"저자: "+this.writer+"\n"+
			"가격: "+this.price+"원";
}
var list = [];
list.push(new Book("java의 정석","남궁성",28000));
list.push(new Book("만화로 읽는 경제학","정갑영",15000));
list.push(new Book("회계학콘서트","하야사 아츠무",17000));
console.log("## Book ##")
for(var idx in list){
	var b = list[idx];
	console.log(b.toString());
}

/*
[하] 2. Object의 하위의 공통 메서드를 기술하고, Duck(오리종류, 색상, 날수있는지여부)를 선언하여,
        종류가 속성에 포함되는지, 수영을 할 수 있는지 여부, 속성을 포함되는지 호출하고, 색상이 접근가능
        여부를 하위 공통메서드 기반으로 선언하세요.
        
    	constructor(): 생성자 함수
    	hasOwnProperty(name): name 속성이 있는지 확인
    	isPrototypeof(object): object가 프로토타입인지 검사
    	propertyIsEnumerable(name): 반복문으로 열거할 수 있는 지 확인
    	toLocalString(): 객체를 호스트 환경에 맞는 언어의 문자열 변환
    	toString(): 문자열변환
    	valueOf(): 객체 값 리턴       
 */
var Duck = {kind:'normal', color:'white', flyable:'can fly'};
var out = '';
out += "HOP('kind'): "+Duck.hasOwnProperty('kind')+'\n';
out += "HOP('swimable'): "+Duck.hasOwnProperty('swimable')+'\n';
out += "PIE('color'): "+Duck.propertyIsEnumerable('color');
console.log(out);

/*
[하] 3. Number의 소숫점 이하 표현 메서드를 이용해서, 아래와 같이 출력을 클릭시, 화면에 처리되게 하세요.
       입력데이터[0.34222  ]
       소숫점자리수[3   ] [출력]
       0.342
 */
var num = 0.34222;
var out2 = '';
out2 += num.toFixed(3);
console.log(out2);
</script>
</html>