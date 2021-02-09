<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	var cnt=1;
	window.onload=function(){
		makeTab(cnt);
	};
	function add(){
		cnt++;
		makeTab(cnt);
	}
	function del(){
		cnt--;
		makeTab(cnt);
	}
	function makeTab(cnt){
		var tabObj = document.querySelector("table");
		var show="<table><tr><th>no</th><th>물건명</th><th>가격</th><th>개수</th></tr>";
		for(var no=1; no<cnt; no++){
			show += "<tr><td>"+no+"</td>";
			show += "<td><input name='name'/></td>";
			show += "<td><input name='price' size='3'/></td>";
			show += "<td><input name='cnt' size='2'/></td></tr>";
		}
		show += "<tr><th colspan='2'>구매방법</th><td colspan='2'>";
		show += "<label><input type='checkbox' name='pay' value='카드'/>카드</label>";
		show += "<label><input type='checkbox' name='pay' value='현금'/>현금</label>";
		show += "<label><input type='checkbox' name='pay' value='포인트'/>포인트</label></td></tr>";
		show += "<tr><td colspan='4'><input type='submit' value='구매처리'/></td></tr>";
//		show += "<tr><td colspan='4'><input type='button' onclick='valid()' value=''/><td><tr>"
		show += "</table>";
		tabObj.innerHTML = show;
	}
	function valid(){
		var nameObj = document.querySelectorAll("name");
		var priceObj = document.querySelectorAll("price");
		// 문자형 입력 항목
		for(var idx=0; idx<=nameObj.length; idx++){
			if(nameObj[idx].value==''){
				alert('데이터를 입력해주세요');
				nameObj[idx].focus();
				return;
			}
		}
		// 숫자형 입력 항목
		for(var idx=0; idx<=priceObj.length; idx++){
			if(priceObj[idx].value==''){
				alert('데이터를 입력해주세요');
				priceObj[idx].focus();
				return;
			} else{
				if(isNaN(priceObj[idx].value)){
					alert('가격은 숫자로 입력해주세요');
					priceObj[idx].focus();
					return;
				}
			}
		}
	}
</script>
</head>
<body>
<%--
	form 처리 방식 입력 후, 출력.
            구매물건
            물건명	가격 갯수
            [   ]	@@@	[  ]
            [   ]	@@@ [  ]
            [   ]	@@@ [  ]
            구매방법 []신용카드[]현금[]포인트
--%>
	<h3>구매물건</h3>
	<input type="button" onclick="add()" value="구매추가"/>
	<input type="button" onclick="del()" value="구매삭제"/><br>
	<form action="a00_jspClass.jsp" method="post">
		<table></table>
	</form>
</body>
</html>