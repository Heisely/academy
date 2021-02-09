package jspexp.a00_exp;

import java.sql.*;
import java.util.*;
import jspexp.a00_exp.*;
import jspexp.z01_vo.Emp;

public class A01_0208_DAO {
	/*
	[하] 1. jsp화면에서 Database를 처리한 결과를 출력할려고 한다. 처리하는 process를 정리하세요.
		1) 화면 구성
			회원리스트
			이름: [		]
			권한: [		]
			[조회]
			번호	이름	권한	포인트...
		2) 요청값 처리
		3) DB 처리
			- SQL 작성	SELECT * FROM member WHERE name like '%%'...
			- VO 객체 생성
			- DAO, 공통 connection 메서드, 기능메서드 선언
				public ArrayList<Member> getMemList(String name, String auth){}
			- 기능메서드 상세 내용 처리:	연결, 대화, 결과처리, 자원해제, 예외처리
		4) JSP 화면
			- DAO import
			- 요청값에 의한 객체 생성 Dao
			- ArrayList<Member> mlist = dao.getMemList(name, auth)
			- for문을 통한 화면 처리
	 */

	/*
	[하] 2.    SELECT ename, 
	        to_char(hiredate,'YYYY') year,
	        to_char(hiredate,'MM') month,
	        to_char(hiredate,'W') weekyear,
	        to_char(hiredate,'DAY') day
	       FROM emp
	       WHERE to_char(hiredate,'W') = '1';에 해당하는 vo 객체과 DAO 메서드를 선언해보세요.
	 */
	public ArrayList<Emp> elist(String weekyear){
		ArrayList<Emp> elist = null;
		try {
			setCon();
			String sql = "SELECT ename, to_char(hiredate,'YYYY') year, to_char(hiredate,'MM') month, to_char(hiredate,'W') weekyear, to_char(hiredate,'DAY') day FROM emp WHERE to_char(hiredate,'W') = '1'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt=1;
			while(rs.next()) {
				System.out.print(cnt+++":"+rs.getString("ename")+"\t");
				System.out.print(rs.getString("year")+"\t");
				System.out.print(rs.getString("month")+"\t");
				System.out.print(rs.getString("weekyear")+"\t");
				System.out.print(rs.getString("day")+"\n");
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return elist;
	}
	/*
	[하] 4. Connection, Statement, ResultSet 객체의 생성과정을 메서드와 함께 기술하세요.
		1) Connection: JDBC 드라이버 매니저에 의해 객체 생성. setCon() 메서드
			con = DriverManager.getConnection(접속정보, 계정, 비밀번호);
		2) Statement: 생성된 Connection 객체의 createStatement() 메서드로 생성됨
			String sql = "sql문";
			stmt = con.createStatement();
		3) ResultSet: Statement객체에 의해 excuteQuery(sql문) 생성
			rs = stmt.executeQuery(sql);	
	 */
	/*
	[하] 5. ResultSet 객체의 rs.next(), rs.getString()의 기능을 구체적으로 기술하고, while()과의
	    관계를 기술하세요.
	    > rs.next(): 다음 행에 데이터가 있는지 여부를 boolean으로 return하고 행단위로 이동.
	    				1번 호출 시 첫 번째 행으로 커서 이동
	    				2번 호출 시 두 번째 행으로 커서 이동
	    > rs.get컬럼데이터유형(순서/"컬럼명"): 열단위로 이동하여 해당 데이터를 가져오는 처리를 한다.
	    > while(rs.next()){}: 데이터가 있는 행의 개수만큼 반복수행.
	    						호출한 후에 마지막 블럭 "}"에서 다시 while(rs.next())를 계속 호출
	    						rs.getString(1); select의 첫 번째 컬럼의 문자열 데이터를 가져온다.
	    						rs.getInt("empno"); select의 컬럼명이 empno인 정수형 데이터를 가져온다.
	 */
	/*	
	[중] 6. select * from member를 데이터를 확인하고, 조회되는 메서드를 DAO로 구현하세요.
		1) SQL 확인
		2) VO 작성
		3) 메서드 선언
		4) 메서드 상세 내용
			- 연결
			- statement
			- resultset
			- while문
			- 자원해제
			- 예외처리
	 */
	// 공통 필드 선언
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// # 연결처리 기능 메서드
	public void setCon() throws SQLException {
		// 1. driver 메모리 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// 2. 특정 서버
		// - 접속 정보: 드라이버명:@ip:port:sid
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 성공");
	}
	
	public ArrayList<Member> mlist(){
		ArrayList<Member> mlist = null;
		try {
			setCon();
			stmt = con.createStatement();
			String sql = "SELECT * FROM MEMBER";
			rs = stmt.executeQuery(sql);
			
			int cnt=1;
			while(rs.next()) {
				System.out.print(cnt+++":"+rs.getString("id")+"\t");
				System.out.print(rs.getString("pass")+"\t");
				System.out.print(rs.getString("name")+"\t");
				System.out.print(rs.getDate("regdte")+"\t");
				System.out.print(rs.getDate("uptdate")+"\n");	
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("# DB 관련 예외 #");
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("# 기타 예외 #");
			System.out.println(e.getMessage());
		}
		return mlist;
	}
	public static void main(String[] args) {
		A01_0208_DAO dao = new A01_0208_DAO();
		dao.elist("1");
		dao.mlist();
	}
}
