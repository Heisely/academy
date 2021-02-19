package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Member;

public class A04_MemberDao {

	// DAO: Database Access Object
	// 1. 데이터베이스 연결
	private Connection con;
	// 2. 대화
	private Statement stmt;
	private PreparedStatement pstmt;
	// 3. 결과값 받는 객체
	private ResultSet rs;

	// # 연결 처리 기능 메서드
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
		// 드라이버 매니저 객체를 통해 Connection 객체를 생성
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 성공");
	}

	public ArrayList<Member> memberList(String id, String name) {
		ArrayList<Member> mlist = new ArrayList<Member>();

		try {
			// 연결
			setCon();
			// 대화
			String sql = "SELECT *\r\n" + "FROM MEMBER5\r\n"
						+ "WHERE id LIKE '%'||'" + id + "'||'%'\r\n"
						+ "AND name LIKE '%'||'" + name + "'||'%'";
			stmt = con.createStatement();
			// 결과
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Member m = new Member(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5));
				mlist.add(m);
			}
			System.out.println("데이터 건수 : " + mlist.size());
			System.out.println("두 번째 행 데이터 : " + mlist.get(1).getName());
			// 해제
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mlist;
	}

	public Member login(Member login) {
		Member m = null;
		try {
			setCon();
			String sql = "select * from member5 where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login.getId());
			pstmt.setString(2, login.getPass());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				// String id, String pw, String name, int point, String auth
				m = new Member(rs.getString("id"), rs.getString("pass"), rs.getInt("point"), rs.getString("name"),
						rs.getString("auth"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db에러 : " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반에러 : " + e.getMessage());
		}

		return m;
	}
	public Member member(Member mem) {
		Member m = null;
		try {
			setCon();
			String sql = "select * from member5 where id= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem.getId());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				// String id, String pw, String name, int point, String auth
				m = new Member(rs.getString("id"), rs.getString("pass"), rs.getInt("point"), rs.getString("name"),
						rs.getString("auth"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db에러 : " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반에러 : " + e.getMessage());
		}
		return m;
	}
	
	// 데이터가 있는 지 여부를 boolean으로 확인
	public boolean hasMember(String id) {
		boolean hasMem = false;
		try {
			setCon();
			String sql = "select * from member5 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			hasMem = rs.next();			
			System.out.println("## 데이터가 있을까? "+hasMem);
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db에러 : " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반에러 : " + e.getMessage());
		}
		return hasMem;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}