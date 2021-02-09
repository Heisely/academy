<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<%--
[jsp]
[하] 1. jsp에서 에러페이지의 지정 속성과 실제 에러가 발생한 페이지에 대한 속성을 선언하세요.
	> 에러페이지 지정: <%@ page errorPage="에러페이지"%>
	> 에러발생페이지 속성확인: <%=exception.getMessage()%>,<%=exception.printStackTrace()%>
	
[하] 2. String [] s= {""}; s[3]; 코드를 호출하여, 에러가 발생했을 때, 나타날 페이지를 
        지정하여 처리하세요. 
        > String[] s = {""}; NullPointerException > z05_null_exception.jsp
        > 
[하] 3. 서버단위 에러와 페이지 단위 에러처리의 차이점을 기술하세요.
		> 서버단위에서 에러페이지를 선언해서 에러처리를 하면, 페이지마다 에러가 발생하면 처리할 페이지를 지정해줄 필요가 없다.
			에러가 발생하면 해당 에러에 맞는 에러처리페이지를 서버단위에서 설정한대로 찾아간다.
[하] 4. ArrayIndexOutOfBoundsException를 확인하고, 해당 내용일 때, 처리할 페이지를 구현하고,
        web.xml에 등록하여, 처리되게 하세요.
--%>
<body>
<h3>JS ex1</h3>
주민번호: <input type="text" name="civilNum"/><input type="button" value="생년월일추출" onclick="birth()"/><br>
<h4 id="births"></h4>
<hr>
<h3>JS ex2</h3>
물건정보: <input type="text" name="pname"/><br>
가격정보: <input type="text" name="price"/><input type="button" value="등록" onclick="addData()"/><br>
<table id="tab">
	<tr><th>물건명</th><th>가격</th></tr>
</table>
</body>
<script>
/*
[js]
[하] 1. 주민번호를 문자열 메서드에 의해서 생년월일을 추출하여, 출력하세요
        주민번호[      ][생년월일추출]==> 클릭시,
        @@@년 @@월 @@일 생.
*/
	function birth(){
		var birth = document.querySelector("[name=civilNum]");
		var year = birth.value.slice(0,2);
		var month = birth.value.slice(2,4);
		var day = birth.value.slice(4,6);
		if(year>=00 && year<=21){
			document.querySelector("#births").innerHTML = "20"+year+"년 "+month+"월 "+day+"일 생.";
		} else{
			document.querySelector("#births").innerHTML = "19"+year+"년 "+month+"월 "+day+"일 생.";
		}
	}
/*
[중] 2. 물건정보 [사과^바나나^딸기]
       가격정보 [3000,4000,5000] [등록] ==> 클릭시 데이터 추출 후, 아래 테이블에 리스트
        물건명   가격
        사과    3000
        바나나   4000
        딸기    5000
*/
	function addData(){
		var pname = document.querySelector("[name=pname]").value;
		var plist1 = pname.split("^");
		var price = document.querySelector("[name=price]").value;
		var plist2 = price.split(",");
		var tab = document.querySelector("#tab");
		var addTab = "";
		list.for(Eac)
       }


/*
[하] 3. 임의의 점수 1~100을 한반에 30명에 할당한 후, 내림차순과 오름 차순으로 출력하세요.
[중] 4. 학생번호와 국어,영어,수학 점수의 속성화 함수로 avg()로 선언하고, 30명에게 각각 임의의 점수(1~100)
    까지 할당하게 하고, 전체과목기준 평균점수 기준으로 rank3을 출력하세요. 
[하] 5. 배열 삭제 메서드의 prototype선언과 삭제 위치에 대한 역순위 처리의 이유에 대하여 기술하세요.
 */
</script>
</html>