package jspexp.z01_vo;

public class Member {
	private String id;
	private int point;
	private String pass;

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
