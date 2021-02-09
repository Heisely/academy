package a00_exp.a04_1216;
/*
  5. DataAcessObj라는 데이터베이스를 처리하는 인터페이스를 추상메서드(조회,수정,삭제,등록)으로 선언하고,
    이를 상속받은 실제클래스 MySqlDao, OracleDao를 선언하여 각 클래스마다 다른 처리를 구현하여 호출할 수 있도록 하세요.
 */

interface DataAccessObj {
	void search(); // public abstract가 생략 가능하다.

	void update();

	void delete();

	void insert();
}

class MySqlDao implements DataAccessObj {

	@Override
	public void search() {
		System.out.println("MySql DB 서버에 접속해서 조회를 하다.");
	}

	@Override
	public void update() {
		System.out.println("MySql DB 서버에 접속해서 수정을 하다.");
	}

	@Override
	public void delete() {
		System.out.println("MySql DB 서버에 접속해서 삭제를 하다.");
	}

	@Override
	public void insert() {
		System.out.println("MySql DB 서버에 접속해서 등록을 하다.");
	}

}

class OracleDao implements DataAccessObj {
	@Override
	public void search() {
		System.out.println("OracleDao DB 서버에 접속해서 조회를 하다.");
	}

	@Override
	public void update() {
		System.out.println("OracleDao DB 서버에 접속해서 수정을 하다.");
	}

	@Override
	public void delete() {
		System.out.println("OracleDao DB 서버에 접속해서 삭제를 하다.");
	}

	@Override
	public void insert() {
		System.out.println("OracleDao DB 서버에 접속해서 등록을 하다.");
	}
}

public class A05 {

}
