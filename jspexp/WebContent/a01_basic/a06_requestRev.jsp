<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"
    import="java.util.Map"
    %>
<%-- Enumeration은 나열형 데이터를 .nextElement() 호출을 통해서 하나씩 가져온다.
     Map: <key, val>형식으로 데이터를 가지고 있는 Collection 객체 				--%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- path기준으로 모든 자원(css,img,js)에 접근해 사용할 수 있다. --%>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<%--
# request객체에서 요청값 처리 메서드
0. 들어오는 요청 형식(query string)
	key1=value1&key2=value2&key2=value3&key3=value4
	<input name="key1" value="value1"/>
	<input name="key2" value="value2"/>
	<input name="key2" value="value3"/>
	<input name="key2" value="value4"/>
	<input type="checkbox" name="key3" value="value2"/>
	<input type="checkbox" name="key3" value="value3"/>
	<input type="checkbox" name="key3" value="value4"/>
	1) 명시적으로 get방식으로 url을 넘겨도 요청값을 받을 수 있다.
		location.href="page.jsp?key1=value1&key2=value2;
	
1. request.getParameter("key1")
	> 받는 값 String data = request.getParameter("key1");
	> data에는 value1이 할당되어있음
2. request.getParameterValues("key2");
	> 동일한 이름의 key값으로 여러 value값을 받을 때, 배열로 데이터를 받을 수 있다.
	> String[] data = request.getParameter("key2");
	> 실제 data안에는 data = ["value2","value3","value4"]; 형식으로 문자열 배열이 들어가 있다.
3. request.getParameterName();
	> 요청되는 모든 내용의 key값을 가져온다.
	> Enumeration enum = request.getParameterNames();
4. request.getParameterMap();
	> 요청된 모든 내용을 key/value형식으로 map에 할당해 가져온다.
	> Map mp = request.getParameterMap();
 --%>
<body>
<b>request.getParameter() 메서드 사용</b><br>
name 파라미터 = <%= request.getParameter("name") %><br>
address 파라미터 = <%= request.getParameter("address") %>
<p>
<b>request.getParameterValues() 메서드 사용</b><br>
<% // checkbox는 checked된 값만 배열로 전달
	String[] values = request.getParameterValues("pet");
	if(values!=null){
		for(int i=0; i<values.length; i++){
%>
			<%= values[i] %>
<%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
/*	# Enumeration 객체의 저장형태: request.getParameterNames() 모든 key만 가지고 있음.
	> (데이터1, 데이터2, 데이터3, 데이터4)
	> .hasMoreElement(): 다음 값이 있는지 여부를 boolean형식으로 가져온다.
	> .nextElement(): 해당 데이터를 가져온다.
 */
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String name = (String)paramEnum.nextElement();
%>
		<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() 메서드 사용</b><br>
<%
	Map parameterMap = request.getParameterMap();
	// parameterMap.get("키"): 해당 key에 해당하는 value를 가져온다.
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null){
%>
		name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>