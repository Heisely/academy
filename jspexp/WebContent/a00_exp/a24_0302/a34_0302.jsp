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
[js]
[하] 1. 이벤트의 기본 형식을 기술하세요
		$("선택자").이벤트명(function(){});
		$("선택자").on("이벤트명",function(){});
		$("선택자").on({"이벤트1":function(){}, "이벤트2":function(){}, ...});
		$("선택자").on("이벤트명","선택자 하위객체", function(){});
			> 장래에 만들어질 요소객체(선택자하위객체)에 대한 이벤트 처리
		$("선택자").bind("이벤트명",function(){});
		$("선택자").bind("이벤트명",{넘겨질 json형식 데이터}, function(event){
			event.data로 매개변수에 있는 json데이터 활용
		});
[하] 2. 커져라, 작아져라 버튼을 통해서, 특정이미지의 크기를 상대적으로 점점 커지거나,
        작아지게 처리하세요.
        
[하] 3. checkbox의 checked 속성 처리 형식 2가지를 기술하세요.
		$("선택자").removeAttr("속성") 속성 삭제
		$("선택자").attr("속성","속성값") 속성 저장
		$("선택자").prop("checked", true/false) checked 속성의 true/false를 통해 checked/unchecked 처리
		
[하] 4. h3로 무지개 색상이 나오고, 클릭시, 바로 밑에 h4로 해당 RE:색상형식으로 추가되어
        클릭시, 글자 색상이 변경되게 하세요.
--%>
	$(document).ready(function(){
		$(".btn").on("click",function(){
			//alert($(this).val());
			//$("img").attr("width") 문자열로 속성값을 가져오므로 숫자로 형변환 필요
			var width = Number($("img").attr("width"));
			var height = Number($("img").attr("height"));
			if($(this).val()=="커져라"){	
				width += 10;
				height += 10;
			} else {
				width -= 10;
				height -= 10;
			}
			$("img").attr("width", width);
			$("img").attr("height", height);
		});
		
		$("h3").on("click",function(){
			$(this).next().append("<h4 id="+$(this).text()+">RE:"+$(this).text()+"</h4>");
		});
		$("body").on("click","h4",function(){
			$(this).css("color",$(this).attr("id"));
		});
	});
</script>
</head>
<body>
	<h3>커져라 작아져라</h3>
	<input type="button" value="커져라" class="btn"/>
	<input type="button" value="작아져라" class="btn"/><br>
	<img src="banana.png" width="200" height="200"/><br>
	
	<h3>red</h3><span></span>
	<h3>orange</h3><span></span>
	<h3>yellow</h3><span></span>
	<h3>green</h3><span></span>
	<h3>blue</h3><span></span>
	<h3>navy</h3><span></span>
	<h3>purple</h3><span></span>
</body>
</html>