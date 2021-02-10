package jspexp.a00_exp.z01_vo;

import java.util.Date;

public class Members {
	private String id;
	private String pw;
	private String name;
	private int point;
	private String address;
	private Date regdte;
	private boolean isAble;

	public Members() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Members(String id, String pw, String name, int point, String address, Date regdte, boolean isAble) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
		this.address = address;
		this.regdte = regdte;
		this.isAble = isAble;
	}

	public Members(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegdte() {
		return regdte;
	}

	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}

	public boolean isAble() {
		return isAble;
	}

	public void setAble(boolean isAble) {
		this.isAble = isAble;
	}

}
