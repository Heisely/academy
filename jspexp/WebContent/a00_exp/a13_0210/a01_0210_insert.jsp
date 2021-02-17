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

	};
</script>
</head>
<%--

--%>
<body>
<%
	String name = request.getParameter("name");
	if(name==null) name = "";
	int price = 0;
	String priceS = request.getParameter("price");
	if(priceS!=null&&!priceS.equals("")) price = new Integer(priceS);
	int cnt = 0;
	String cntS = request.getParameter("cnt");
	if(cntS!=null&&!cntS.equals("")) cnt = new Integer(cntS);
	String company = request.getParameter("company");
	if(company==null) company = "";
	String inmanager = request.getParameter("inmanager");
	if(inmanager==null) inmanager = "";
	if(!name.equals("")){ // 초기 화면과 구분
		A03_ShopDao dao = new A03_ShopDao();
		dao.insertProduct(new Product2(0, name, price, cnt, "", company, "", inmanager));
	}
%>
	<script type="text/javascript">
		var name = "<%=name%>";
		if(name != ''){
			if(confirm("등록완료\n초기화면으로 이동하시겠습니까?")){
				location.href='a00_0210.jsp';
			}
		}
	</script>
	<h3>물품등록화면</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>재고량</th><td><input type="text" name="cnt"/></td></tr>
		<tr><th>제조사</th><td><input type="text" name="company"/></td></tr>
		<tr><th>책임자</th><td><input type="text" name="inmanager"/></td></tr>
		<tr><td colspan="2">
				<input type="submit" value="등록"/>
				<input type="button" value="메인화면" onclick="location.href='a00_0210.jsp'"/>
		</td></tr>
	</table>
	</form>
</body>
</html>