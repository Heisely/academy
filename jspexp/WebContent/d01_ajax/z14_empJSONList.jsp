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
<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"></jsp:useBean>
<c:set var="empList" value="${dao.empList(param.ename,param.job) }"/>
{"tot":${empList.size() },"empList" : [
   <c:forEach var="emp" items="${empList }" varStatus="sts">
      {"empno": ${emp.empno},"ename":"${emp.ename }","job":"${emp.job}",
      "mgr": ${emp.mgr},"hiredate":"${emp.hiredate}","sal": ${emp.sal},
      "comm": ${emp.comm},"deptno": ${emp.deptno} }
      <c:if test="${!sts.last }">,</c:if>
   </c:forEach>
]}
<%--
# JSON 데이터 형식
1. 기본 객체 선언
	{}
2. 배열 선언
	[]
3. 객체 안에 여러 속성 선언
	{"속성":"문자열", "속성":숫자, "속성": boolean, 
	 "속성":function(){}, "속성":{객체}, "속성":[배열데이터]};
	ex)
	{"name":"홍길동", "age":25, "isMarried":false,
	 "show":function(){}, "girlfriend":{"name":"김영희","age":24},
	 "friendNames":["이철수","김현우","홍길동"]}
4. 가져온 데이터 JSON 유효성 check - JSON Validator

--%>
<%--
{"tot":15,
 "empList":[
 	{"empno":7780, "ename":"홍길동", "sal":3000, ...},
 	{"empno":7781, "ename":"신길동", "sal":4000, ...},
 	{"empno":7782, "ename":"마길동", "sal":5000, ...},
 	{"empno":7783, "ename":"오길동", "sal":6000, ...},
 ]
}
--%>