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
[JSP]
[하] 1. 쿠키값의 life cycle과 필요한 메서드를 기술하세요.
		.setMaxAge(0)
		response.addCookie(cookie)
--%>
<%-- 
[하] 2. 쿠키값을 요청값에 의해 삭제 처리되는 코드를 기술하세요
		<input type="checkbox" name="ck" value="<%=c.getName()%>"/>
		
		String ck = request.getParameterValues("ck");
		Cookie[] cks = request.getCookies(name,value);
		for(Cookie c : cks){
			for(String cn : ck){
				if(cn.equals(c.getName())){
					c.setMaxAge(0)
					response.addCookie(c);
				}
			}
		}
--%>
<%--  
[js]
[하] 1. 배열의 forEach(), map(), filter()의 기본 형식을 기술하세요.
		1) 배열명.forEach(function(단위객체, index, Array){
	
			});
		2) 배열명.map(function(단위객체){
				return 단위객체변경데이터;
			});
		3) 배열명.filter(function(단위객체, index명, 전체배열){
				return 조건;
			});
			>> 배열의 데이터 중 조건에 맞는 데이터만 추출해 새로운 배열 생성

[하] 2. 1000단위 물건가격 5개를 임의로 만들어, 5000이상 고가 그외 저가 구분하여 표기하세요

	<script type="text/javascript">
	var array = [];
	for(var idx=0; idx<5; idx++){
		array[idx] = (Math.floor(Math.random()*10+1))*1000;
	}
	var Narray = array.map(function(pr,index,array){
		return "array["+(idx+1)+"] 물건가격: "+pr+"원 "+(pr>=5000? "고가":"저가");
	});
	console.log(Narray);
	</script>
 
[하] 3. json객체의 문자열 변환 및 객체 변환 메서드를 기본예제를 통해 기술하세요.
		# JSON 문자열 변환 ★★★
		  > JSON.stringify(객체): 객체를 문자열로 변환
		  > JSON.parse("문자열형 JSON"): 문자열을 JSON객체로 변환
		  
		ex)
		// 변수 선언
		var object = {
			name: '윤인성',
			region: '서울특별시'
		};
		// 출력
		var jdataS = JSON.stringify(object); // 객체를 문자열화
		console.log(jdataS);
		var copy = JSON.parse(jdataS); // 문자열을 객체화
		// 출력
		console.log(copy.name +" : "+copy.region);
--%>
</body>
</html>