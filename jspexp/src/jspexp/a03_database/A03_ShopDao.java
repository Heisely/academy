package jspexp.a03_database;
// jspexp.a03_database.A03_ShopDao
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Product2;

public class A03_ShopDao {
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

	/*
	 * -- 등록 sql INSERT INTO product2 VALUES (prod2_seq.nextval, '사과', 2000, 100,
	 * sysdate,'좋은농원', sysdate, '홍길동'); -- 조회 sql SELECT * FROM product2 WHERE name
	 * LIKE '%'||''||'%' AND price BETWEEN 0 AND 99999 ORDER BY pno DESC; -- 상세 sql
	 * SELECT * FROM product2 WHERE pno = 10000;
	 */
	/*
	 * - 조회메서드 public ArrayList<ShopProd> shopList(ShopProd sch)
	 */
	public ArrayList<Product2> shopList(Product2 sch) {
		/*
		 * // null에 대한 default 처리 if(sch.getName()==null) sch.setName("");
		 * if(sch.getTo_price()==0) sch.setTo_price(99999);
		 */
		
		ArrayList<Product2> list = new ArrayList<Product2>();
		try {
			setCon();
			String sql = "SELECT * FROM product2 WHERE name LIKE '%'||'"+sch.getName()+"'||'%'\r\n"
					+ " AND PRICE BETWEEN "+sch.getFr_price()+
					 " AND "+ sch.getTo_price() +" ORDER BY pno DESC";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			/*
			 * Product2(int pno, String name, int price, int cnt, Date credte, String
			 * company, Date incomedte, String inmanager)
			 */
			while (rs.next()) {
				list.add(new Product2(rs.getInt(1), rs.getString(2), 
										rs.getInt(3), rs.getInt(4),
										rs.getDate(5),	rs.getString(6), rs.getDate(7), rs.getString(8)));
			}
			System.out.println(sql);
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러: " + e.getMessage());
		}
		return list;
	}
	public ArrayList<Product2> shopList2(Product2 sch) {
		// null에 대한 default 처리
		if(sch.getName()==null) sch.setName("");
		if(sch.getTo_price()==0) sch.setTo_price(99999);
		
		ArrayList<Product2> list = new ArrayList<Product2>();
		try {
			setCon();
			String sql = "SELECT * FROM product2 WHERE name = ? ORDER BY pno DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getName());
			rs = pstmt.executeQuery();
		
			/*
			 * Product2(int pno, String name, int price, int cnt, Date credte, String
			 * company, Date incomedte, String inmanager)
			 */
			while (rs.next()) {
				list.add(new Product2(rs.getInt(1), rs.getString(2), 
										rs.getInt(3), rs.getInt(4),
										rs.getDate(5),	rs.getString(6), rs.getDate(7), rs.getString(8)));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러: " + e.getMessage());
		}
		return list;
	}

	/*
	 * - 등록메서드 public insertProduct(ShopProd ins)
	 */
	public void insertProduct(Product2 ins) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO product2 VALUES (prod2_seq.nextval, '" + ins.getName() + "', " + ins.getPrice()
					+ ", " + ins.getCnt() + ", sysdate,'" + ins.getCompany() + "', sysdate, '" + ins.getInmanager()
					+ "')";
			System.out.println("# 등록처리 #");
			System.out.println(sql);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.commit();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("입력 에러: " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러: " + e.getMessage());
		}
	}

	/*
	 * - 단일데이터 메서드 public ShopProd getProd(int prono)
	 */
	public int getMaxPno() {
		int pno = 0;
		try {
			setCon();
			String sql = "SELECT MAX(PNO) FROM PRODUCT2";
			System.out.println("# 최근 PNO 가져오기 #");
			System.out.println(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pno = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("상세조회 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외: " + e.getMessage());
		}
		return pno;
	}

	/*
	 * - 단일데이터 메서드 public ShopProd getProd(int prono)
	 */
	public Product2 getProd(int prono) {
		Product2 pro = null;
		try {
			setCon();
			String sql = "SELECT * FROM product2 WHERE pno = " + prono;
			System.out.println("# 상세조회 #");
			System.out.println(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pro = new Product2(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getDate(5),
						rs.getString(6), rs.getDate(7), rs.getString(8));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("상세조회 에러: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외: " + e.getMessage());
		}
		return pro;
	}

	/*
	 * - 등록메서드 public insertProduct(ShopProd ins)
	 */
	public void updateProduct(Product2 upt) {
		try {
			System.out.println("날짜1:"+upt.getCredte_s());
			System.out.println("날짜2:"+upt.getIncomdte_s());
			setCon();
			con.setAutoCommit(false);
			String sql = "UPDATE product2\r\n"
					+ "	SET name = ?,\r\n"
					+ "		price = ?,\r\n"
					+ "		cnt = ?,\r\n"
					+ "		CREDTE = to_date( ?, 'YYYY-MM-DD'),\r\n"
					+ "		COMPANY = ?,\r\n"
					+ "		INCOMEDTE = to_date( ?, 'YYYY-MM-DD'),\r\n"
					+ "		INMANAGER = ?\r\n"
					+ "WHERE pno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getName());
			pstmt.setInt(2, upt.getPrice());
			pstmt.setInt(3, upt.getCnt());
			pstmt.setString(4, upt.getCredte_s());
			pstmt.setString(5, upt.getCompany());
			pstmt.setString(6, upt.getIncomdte_s());
			pstmt.setString(7, upt.getInmanager());
			pstmt.setInt(8, upt.getPno());
			pstmt.executeUpdate();
			
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("입력 에러: " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러: " + e.getMessage());
		}
	}

	/*
	 * - 등록메서드 public insertProduct(ShopProd ins)
	 */
	public void delProduct(int pno) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "DELETE FROM product2 WHERE pno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.executeUpdate();
			
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("입력 에러: " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러: " + e.getMessage());
		}
	}

	public static void main(String[] args) {
		A03_ShopDao dao = new A03_ShopDao();
		dao.shopList(new Product2("", 1000, 9999));
//		dao.insertProduct(new Product2(0, "포도", 5000, 50, "", "포도마을", null, "포도맨"));
//		dao.getProd(10000);
	}
}
