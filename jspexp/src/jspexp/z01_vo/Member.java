package jspexp.z01_vo;

public class Member {
	private String id;
	private int point;

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
