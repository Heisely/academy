package jspexp.a00_exp;

public class Emp {
	private String ename;
	private String year;
	private String weekyear;
	private String day;
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp(String ename, String year, String weekyear, String day) {
		super();
		this.ename = ename;
		this.year = year;
		this.weekyear = weekyear;
		this.day = day;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getWeekyear() {
		return weekyear;
	}
	public void setWeekyear(String weekyear) {
		this.weekyear = weekyear;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
}
