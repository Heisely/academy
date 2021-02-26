<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"
    import = "jspexp.z01_vo.*"
    import = "jspexp.a03_database.*"%>
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

	var xhr = new XMLHttpRequest();
	$(document).ready(function(){
		$("[name=dname],[name=loc]").keyup(function(){
			if(event.keyCode==13){
				ajaxFunDept();
			}
		});
	});
	
	function ajaxFunDept(){
		var dnameV = $("[name=dname]").val();
		var locV = $("[name=loc]").val();
		var qstr = "dname="+dnameV+"&loc="+locV;
		//alert(qstr);
		xhr.open("get","z03_deptJson.jsp?"+qstr,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){
				//alert(xhr.responseText);
				var dept = JSON.parse(xhr.responseText);
				var show = "<table><tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>";
				$(dept.deptList).each(function(idx, dept){
					show+="<tr>";
					show+="<td>"+dept.deptno+"</td>";
					show+="<td>"+dept.dname+"</td>";
					show+="<td>"+dept.loc+"</td>";
					show+="</tr>";
				});
				show += "</table>";
				
				$("div").html(show);
			}
		};
		xhr.send();
	}
</script>
</head>
<body>
	<h3>부서조회(JSON)Ajax</h3>
	<table>
		<tr><th>부서명</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc"/></td></tr>
	</table>
	<br>
	<div></div>
</body>
</html>