package jspexp.a00_exp;
// jspexp.a00_exp.A01_0209_Dao
import java.sql.*;
import java.util.*;
import jspexp.a00_exp.*;
import jspexp.z01_vo.Emp;

public class A01_0209_Dao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속 성공");
	}
	
	public ArrayList<Members> mlist(String id, String name){
		ArrayList<Members> mlist = new ArrayList<Members>();
		try {
			setCon();
			String sql = "SELECT * FROM members";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				mlist.add(new Members(rs.getString(1), rs.getString(2), rs.getString(3),
									  rs.getInt(4), rs.getString(5), rs.getDate(6), rs.getBoolean(7)));
			}
			System.out.println("데이터 크기: "+mlist.size());
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("# DB 예외 처리 #");
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("# 기타 예외 처리 #");
			System.out.println(e.getMessage());
		}
		return mlist;
	}
	
	public static void main(String[] args) {
		A01_0209_Dao dao = new A01_0209_Dao();
		dao.mlist("himan","7777");
	}
}
