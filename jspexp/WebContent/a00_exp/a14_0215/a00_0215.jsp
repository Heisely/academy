<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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
[JSP]
[하] 1. PreparedStatement를 사용하는 이유를 기술하세요.
	1) SQL injection을 막기 위해
		- SQL injection: 해킹방법의 하나
			동적인 SQL(문자열과 문자열을 조합시켜 SQL 처리)
			이 화면에서 입력 form 요소객체로 만들어서 서버에서 원하지 않는,,
 	2) DB 서버의 SQL 해석 속도를 향상시켜 빠른 처리를 하기 위해
 	
[하] 2. 부서정보조회를 위 PreparedStatement를 활용하여 처리하세요.
	public ArrayList<Dept> deptList2(Dept sch){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화 SQL
			String sql="SELECT * FROM dept10 \r\n"
					+ "WHERE dname LIKE '%'||?||'%'\r\n"
					+ "AND loc LIKE '%'||?||'%'"
					+ " ORDER BY deptno DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getDname());
			pstmt.setString(2, sch.getLoc());
			// 3. 결과
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dlist.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			System.out.println("데이터 크기: "+dlist.size());
			// 4. 자원해제
			rs.close();
			pstmt.close();
			con.close();
			// 5. 예외처리
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("# DB 예외 처리 #");
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("# 기타 예외 처리 #");
			System.out.println(e.getMessage());
		}
		
		return dlist;
	}

--%>
<%--
[js]
[하] 1. 이벤트, 이벤트대상객체, 이벤트 핸들러 함수를 구분하여 예제를 통하여 개념을 정리하세요.
		window.onload = function(){처리 내용};
		load: 이벤트 이름/타입
		onload: 이벤트 속성
		function(){}: 이벤트 리스트/핸들러
		
		ex)
		<script>
		window.onload = function(){
			// 변수 선언
			var show = document.getElementById("show");
			// 이벤트 연결(핸들러)
			show.onclick = function(){
				alert("클릭!");
				// 해당 객체의 속성 변경
				this.style.color = "white";
				this.sytle.backgroundColor="black";
				// 이벤트 제거
				show.onclick = null;
			};
		};
		</script>
		<body>
			<h2 id="show">안녕하세요</h2>
		</body>
		
[중] 2. 물건명 :[    ] 가격:[    ] 갯수 [0](버튼)
         @@@를 @@@원에 @@개 구매하여 @@@원입니다.
        버튼을 클릭할 때 마다, 카운트가 업되고, 하단의 출력내용을 변경하게 처리하세요
        단) 대상객체.이벤트 = 핸들러함수 형식으로 처리하세요.
--%>
<script type="text/javascript">
	window.onload = function(){
		var h3Obj = document.getElementsByTagName("h3")[0];
		// h3Obj: 이벤트를 처리할 대상 객체
		// click: 이벤트
		// 대상객체.onclick: 이벤트를 대상객체의 속성으로 지정
		// function(){}: 이벤트가 수행될 때 처리할 handler 함수
		h3Obj.onclick = function(){
			// this: 함수 안에서 이벤트를 처리하는 대생객체를 지정
			this.style.backgroundColor="yellow";
			this.innerText = "이벤트 완료";
		}
		
		var pname = document.querySelector("[name=pname]");
		var price = document.querySelector("[name=price]");
		var btn01 = document.querySelector("#btn01");
		btn01.onclick = function(){
			this.value = Number(this.value) + 1;
			var prn = pname.value+"를 "+price.value+"원에 "+this.value+"개 구매하여 총 "+(price.value * this.value)+"원 입니다.";
			show.innerText = prn;
		}
	};
</script>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>개수</th><td><input type="button" value="0" id="btn01" style="width:80%;"/></td></tr>
		<tr><td colspan="2" id="show">내용</td></tr>
	</table>
</body>
</html>