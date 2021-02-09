package jspexp.a03_database;

import java.sql.*;
import java.util.*;
import jspexp.z01_vo.*;

public class A01_Dao { // DAO: Database Access Object
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
	 1. SQL 작성
	 2. VO 객체 생성
	 3. 기능 메서드 선언
	 	1) 요청에 의한 입력: 매개변수로 활용
	 	2) 데이터의 결과에 따라 리턴값 지정
	 		- insert, update, delete: void 사용
	 			ex) public void insertEmp(Emp ins)
	 		- 단위 변수나 한 개의 데이터
	 			> 회원 등록 여부: SELECT * FROM member where ...
	 				public boolean void isMember(String id, String pass)
	 			> 상품 개수: SELECT count(*) FROM member where ...
	 				public int memCount(Member sch)
	 			> 회원 상세 정보: SELECT * FROM member where id=@@@
	 				public Member getMember(String id)
	 		- 여러 개의 데이터
	 			ex)
	 			> 공지사항
	 				public ArrayList<Board> boardList(Board sch)
	 			> 회원정보리스트
	 				public ArrayList<Member> mlist(Member sch)
	 		
	 */
	
	
	
	// 조회(매개변수 없는 것)
	public ArrayList<Emp> empList(){
		ArrayList<Emp> list = new ArrayList<Emp>();
		try {
//			1. 공통 연결 메서드 호출
			setCon();
//			2. Statement 객체 생성(연결객체 - Connection)
			String sql = "SELECT * FROM emp";
			stmt = con.createStatement();
//			3. ResultSet 객체 생성(대화객체 - Statement)
			rs = stmt.executeQuery(sql);
			/*
			 * System.out.println(rs.next()); // 1행에 데이터가 있는지 여부 확인 및 사용할 준비 //
			 * rs.get데이터유형(컬럼의 순서) System.out.println("1행 1열: " + rs.getInt(1));
			 * System.out.println("1행 2열: " + rs.getString(2));
			 * 
			 * System.out.println(rs.next()); // 2행에 데이터가 있는지 여부를 확인 및 사용할 준비 //
			 * rs.get데이터유형(컬럼명) System.out.println("2행 JOB열: " + rs.getString("JOB"));
			 * System.out.println("2행 SAL열: " + rs.getDouble("SAL"));
			 */
			
			 int cnt=1; while(rs.next()) { 
			 /* System.out.print(cnt+++":"+rs.getInt(1)+"\t");
			 * // 1을 "empno"로 바꿔도 같은 결과 System.out.print(rs.getString("ename")+"\t");
			 * System.out.print(rs.getString("job")+"\t");
			 * System.out.print(rs.getInt("mgr")+"\t");
			 * System.out.print(rs.getDate("hiredate")+"\t");
			 * System.out.print(rs.getDouble("sal")+"\t");
			 * System.out.print(rs.getDouble("comm")+"\t");
			 * System.out.print(rs.getInt("deptno")+"\n"); }
			 */
				// 1. 객체 생성과 할당
				//		int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno
				Emp e = new Emp(rs.getInt("empno"), rs.getString(2), rs.getString(3),
						rs.getInt(4), rs.getDate("hiredate"), rs.getDouble(6),
						rs.getDouble(7), rs.getInt(8));
				// 2. ArrayList에 할당
				list.add(e);
			}
			System.out.println("객체의 개수: "+list.size());
			System.out.println("두 번째의 행의 ename: "+list.get(1).getEname());
//				> next(): 행단위 변경
//				> getXXX("컬럼명"): 열단위 호출
//				==> 1개의 데이터인 경우: VO(단일)
//				==> 다중행단위 여러 데이터인 경우: ArrayList<VO>, 마지막에 객체의 참조변수 return;
//			4. 자원의 해제
			rs.close();
			stmt.close();
			con.close();
//			5. 예외 처리
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	// ex1) Dept를 조회하는 메서드 선언 Dept VO 객체 활용
	public ArrayList<Dept> deptList(){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화
			String sql = "SELECT * FROM DEPT";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			// 3. 결과
			int cnt=1;
			while(rs.next()) { // 행단위 변경(행이 있을 때까지)
			
				System.out.print(cnt+++":"+rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
				dlist.add(new Dept(rs.getInt("deptno"), rs.getString(2), rs.getString(3)));
			}
			System.out.println("객체의 개수: "+dlist.size());
			System.out.println("두 번째의 행의 ename: "+dlist.get(1).getDname());
			// 4. 자원해제
			rs.close();
			stmt.close();
			con.close();
		// 5. 예외처리
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return dlist;
	}
	// ex2) select * from emp where empno = 7780 (empno는 유일키)를 처리하는 메서드 선언
	public Emp getEmp(int empno) {
		Emp e = null;
		
		return e;
	}
/*
-- ex1) 하위 구문을 통해서 만들어질 VO와 DAO단에 들어갈 메서드를 선언
-- VO 포함 출력 int deptno, double msal, double asal
-- 		  하나의 데이터일 경우 메서드 매개변수로 double msal 사용
SELECT deptno, max(sal) msal, avg(sal) asal
FROM EMP
GROUP BY DEPTNO 
HAVING max(sal) >= 3000;
 */
	public ArrayList<Emp3> elist(int msal){
		ArrayList<Emp3> elist = null;
		return elist;
	}
/*
-- ex2) String ename, Date hiredate, int workdate
--		메서드 매개변수로 int fromDte, int toDate 사용
SELECT ename, hiredate, floor(MONTHS_BETWEEN(sysdate, hiredate)) workdate
FROM emp
WHERE floor(MONTHS_BETWEEN(sysdate, hiredate)) BETWEEN 470 AND 480;
 */
	public ArrayList<Emp4> elist(int fromDte, int toDate){
		ArrayList<Emp4> emplist = null;
		return emplist;
	}
/*
-- ex3) empno, ... , int part
--		메서드 매개변수로 int part 사용
SELECT e.*, mod(empno, 2) part
FROM emp e
WHERE mod(empno,2)=0;
 */
	public ArrayList<Emp5> elist2(int part){
		ArrayList<Emp5> emplist = null;
		return emplist;
	}
	// 등록
	// 수정
	// 삭제
	public static void main(String[] args) {
		A01_Dao dao = new A01_Dao();
//		try {
//			dao.setCon();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		dao.empList();
		dao.deptList(); // dept list 출력 되게 처리
	}
}
