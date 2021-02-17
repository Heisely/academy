<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A02_DeptDao"%>
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
		document.querySelector("form").onsubmit = function(){
			//
			var deptnoVal = document.querySelector("[name=deptno]").value
			if(deptnoVal==""||isNaN(deptnoVal)){
				alert("부서번호를 숫자로 입력해주세요.");
				return false;
			}
			// 기타 유효성 check;
		};
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick = function(){
			// 처리할 process 구분 설정
			document.querySelector("[name=proc]").value="upt";
			// form의 submit버튼과 동일한 JS
			document.querySelector("form").submit();
		}
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick = function(){
			document.querySelector("[name=proc]").value="del";
			document.querySelector("form").submit();
		}
	};
</script>
</head>
<%--
# 부서정보 수정 처리
1. 이벤트로 수정처리 클릭 시 요청값 전송
2. 전달한 요청값 확인, VO객체로 할당
3. 수정 sql 작성/확인
4. DAO에서 수정 기능 메서드 선언
5. JSP DAO 수정 기능메서드 호출 / VO 객체 할당
6. JS로 수정처리 완료. confirm 계속 수정/ 조회화면 이동 선택
	location.href = "초기 리스트 페이지";
--%>
<body>
<%
int deptno=0;
String deptnoS = request.getParameter("deptno");
if(deptnoS!=null&&!deptnoS.equals("")) deptno = Integer.parseInt(deptnoS);

String proc = request.getParameter("proc");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

A02_DeptDao dao = new A02_DeptDao();

if(proc!=null){
	if(proc.equals("upt")){
		Dept upt = new Dept(deptno, dname, loc);
		log("# 수정 준비 #");
		log("# 번호: "+upt.getDeptno());
		log("# 부서명: "+upt.getDname());
		log("# 위치: "+upt.getLoc());
		
		dao.updateDept(upt);
	}
	if(proc.equals("del")){
		System.out.println("삭제준비완료: "+deptno);
		dao.deleteDept(deptno);
	}
}

Dept d = dao.getDept(deptno);
%>
<script type="text/javascript">
	var proc = "<%=proc%>";
	if(proc=="upt"){
		if(confirm("수정성공\n메인화면으로 이동하시겠습니까?")){
			location.href = 'a04_searchDeptList.jsp';
		}
	}
	if(proc=="del"){
		if(confirm("삭제성공\n메인화면으로 이동하시겠습니까?")){
			location.href = 'a04_searchDeptList.jsp';
		}
	}
</script>
	<h3>부서정보[<%=deptno%>]</h3>
	<form method="post">
	<input type="hidden" name="proc" value=""/>
	<table>
		<%if(d!=null){ %>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%=d.getDeptno()%>"/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%=d.getDname()%>"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="<%=d.getLoc()%>"/></td></tr>
		<%} else { %>
		<tr><td colspan="2">해당 부서정보는 없습니다.</td></tr>
		<%} %>
		<tr><td colspan="2">
			<input type="button" value="메인화면" onclick="location.href='a04_searchDeptList.jsp'">
			<input type="button" value="수정" id="uptBtn">
			<input type="button" value="삭제" id="delBtn">
		</td></tr>
	</table>
	</form>
</body>
</html>