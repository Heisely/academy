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
</head>
<%--
[JSP]
[하] 1. PreparedStatement를 사용하는 이유를 기술하세요.
	1) SQL injection을 막기 위해
 	2) DB 서버의 SQL 해석 속도를 향상시켜 빠른 처리를 하기 위해
 	
[하] 2. 부서정보조회를 위 PreparedStatement를 활용하여 처리하세요.
	public ArrayList<Dept> deptList2(String dname, String loc){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화 SQL
			String sql="SELECT * FROM dept \r\n"
					+ "WHERE dname LIKE '%'||?||'%'\r\n"
					+ "AND loc LIKE '%'||?||'%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			
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

	public static void main(String[] args){
		ArrayList<Dept> dlist = dao.deptList2("","");
		System.out.println("크기: "+dlist.size());
		System.out.println("첫 번째: "+dlist.get(0).getDname());
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
<body>
<script>
	window.onload = function(){
		var button = document.getElementById("button");
		var button2 = document.getElementById("button2");
		var cnt = document.getElementById("cnt");
		var cnt2 = document.getElementById("cnt2");
		button.onclick = function(){
			cnt.innerHTML = Number(cnt.innerHTML)+1;
			cnt2.innerHTML = Number(cnt2.innerHTML)+1;
		}
		button2.onclick = function(){
			cnt.innerHTML = Number(cnt.innerHTML)-1;
			cnt2.innerHTML = Number(cnt2.innerHTML)-1;
		}
	}
	
</script>
<%
		String pname = request.getParameter("pname");
		if(pname==null) pname="";
		String priceS = request.getParameter("price");
		
		int price = 0;
		if(priceS==null) priceS="";
		if(priceS!=null && !priceS.equals("")) price = Integer.parseInt(priceS);
		
		String cntS = request.getParameter("cnt");
		int cnt = 0;
		if(cntS!=null && !cntS.equals("")) cnt = Integer.parseInt(cntS);
		int tot = price * cnt;
%>
	<h3>JS Ex2</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td colspan="2"><input type="text" name="pname"></td></tr>
		<tr><th>가격</th><td colspan="2"><input type="text" name="price"></td></tr>
		<tr><th>개수</th><td><span id="cnt">0</span></td>
						<td><input type="button" id="button" value="수량증가"/>
							<input type="button" id="button2" value="수량감소"/></td>
		</tr>
		<tr><td colspan="3">수량을 변경하시려면 수량증가버튼을 클릭하시면 됩니다.</td></tr>
		<tr><td colspan="3"><input type="submit" value="구매"/></td></tr>
		<%if(pname!=null&&!pname.equals("")){ %>
		<tr><td colspan="3"><%=pname%>을 <%=price%>원에 <%=cnt%>개 구매하여 총 <%=tot%>원 입니다.</td></tr>
		<%} %>
	</table>
	</form>
	
	
	
	
</body>
</html>