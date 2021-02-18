package jspexp.z01_vo;

public class Member {
	private String id;
	private String pass;
	private int point;
	private String name;
	private String auth;

	// 0217 과제를 위한 생성자
	public Member(String id, String pass, int point,String name, String auth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.point = point;
		this.auth = auth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public Member(String id, int point, String pass) {
		super();
		this.id = id;
		this.point = point;
		this.pass = pass;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Member(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}

	public Member() {
		super();
	}

	public Member(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

}
