<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A03_ShopDao"%>
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
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick = function(){
			document.querySelector("[name=proc3]").value = "upt";
			document.querySelector("form").submit();
		}
	};
</script>
</head>
<%--

--%>
<body>
<%
	String proc3 = request.getParameter("proc3");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String cnt = request.getParameter("cnt");
	String company = request.getParameter("company");
	String inmanager = request.getParameter("inmanager");
	String credteS = request.getParameter("credteS");
	String incomedteS = request.getParameter("incomedteS");
	String pno = request.getParameter("pno");
	A03_ShopDao dao = new A03_ShopDao();
	if(proc3!=null){
		if(proc3.equals("upt")){
			Product2 upt = new Product2(Integer.parseInt(pno),name,Integer.parseInt(price),
										Integer.parseInt(cnt),company, inmanager, credteS,incomedteS);
			dao.updateProduct(upt);
		}
	}
	Product2 pro = dao.getProd(new Integer(pno));
%>
<script>
	var proc3 = "<%=proc3%>";
	if(proc3=="upt"){
		if(confirm("수정성공\n메인화면으로 이동하시겠습니까?")){
			location.href = 'a00_0210.jsp';
		}
	}
</script>
	<h3>상세화면</h3>
	<form method="post">
	<input type="hidden" name="proc3" value=""/>
	<table>
		<%if(pro!=null){ %>		
		<tr><th>물건번호</th><td><input type="text" name="pno" value="<%=pro.getPno()%>"/></td></tr>
		<tr><th>물건명</th><td><input type="text" name="name" value="<%=pro.getName()%>"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="<%=pro.getPrice()%>"/></td></tr>
		<tr><th>재고량</th><td><input type="text" name="cnt" value="<%=pro.getCnt()%>"/></td></tr>
		<tr><th>제조사</th><td><input type="text" name="company" value="<%=pro.getCompany()%>"/></td></tr>
		<tr><th>책임자</th><td><input type="text" name="inmanager" value="<%=pro.getInmanager()%>"/></td></tr>
		<tr><th>신규등록일</th><td><input type="text" name="credteS" value="<%=pro.getCredte()%>"/></td></tr>
		<tr><th>최근입고일</th><td><input type="text" name="incomedteS" value="<%=pro.getIncomedte()%>"/></td></tr>
		<%} else{ %>
		<tr><td colspan="2">Data is not exist.</td></tr>
		<%} %>
		<tr><td colspan="2">
				<input type="button" value="수정" id="uptBtn"/>
				<input type="button" value="삭제" id="delBtn"/>
				<input type="button" value="메인화면" onclick="location.href='a00_0210.jsp'"/>
		</td></tr>
	</table>
	</form>
</body>
</html>