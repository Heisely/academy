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
<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
<c:set var="deptList" value="${dao.deptList2(param.dname, param.loc)}"/>
{"tot":${deptList.size()}, "deptList":[
	<c:forEach var="dept" items="${deptList}" varStatus="sts">
		{"deptno":${dept.deptno}, "dname":"${dept.dname}", "loc":"${dept.loc}"}
		<c:if test="${!sts.last}">,</c:if>
	</c:forEach>
]}