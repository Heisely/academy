<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<body>
      <h3>회원등록 성공</h3>
      <table>
         <tr><th>아이디</th><td><%=request.getParameter("id") %></td></tr>
         <tr><th>포인트</th><td><%=request.getParameter("point") %></td></tr>
      </table>
</body>
</html>